DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;
CREATE TABLE employee (
  employee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);
CREATE TABLE address (
  address_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(50) NOT NULL,
  number VARCHAR(50) NOT NULL,
  floor VARCHAR(10),
  door VARCHAR(10),
  city VARCHAR(50),
  pc VARCHAR(10),
  country VARCHAR(50)
);
CREATE TABLE client (
  client_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (address_id) REFERENCES address(address_id),
  referred_by INT UNSIGNED,
  FOREIGN KEY (referred_by) REFERENCES client(client_id)
);
CREATE TABLE supplier (
  supplier_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (address_id) REFERENCES address(address_id),
  phone_number VARCHAR(50) NOT NULL,
  fax_number VARCHAR(50),
  nif VARCHAR(50)
);
CREATE TABLE glasses (
  glasses_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(50) NOT NULL,
  graduation_r_lens DOUBLE NOT NULL,
  graduation_l_lens DOUBLE NOT NULL,
  frame_type ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  frame_color VARCHAR(50) NOT NULL,
  lens_color VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock INT NOT NULL,
  supplier_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);
CREATE TABLE sale(
  sale_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  sale_date DATE NOT NULL,
  sold_by INT UNSIGNED NOT NULL,
  sold_to INT UNSIGNED NOT NULL,
  FOREIGN KEY (sold_by) REFERENCES employee(employee_id),
  FOREIGN KEY (sold_to) REFERENCES client(client_id)
);
CREATE TABLE sale_item(
  sale_item_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  glasses_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id),
  quantity INT NOT NULL,
  sale_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (sale_id) REFERENCES sale(sale_id)
);
INSERT INTO
  address
VALUES(
    1,
    'Carrer de les Carolines',
    '25',
    '4',
    'A',
    'Barcelona',
    'A3215',
    'España'
  );
INSERT INTO
  address
VALUES(
    2,
    'C. Churruca',
    '6',
    '3',
    null,
    'Getafe',
    'C8975',
    'España'
  );
INSERT INTO
  employee
VALUES(1, 'Amanda', 'Perez');
INSERT INTO
  client
VALUES(1, 'Maria', 'Hernandez', 1, NULL);
INSERT INTO
  client
VALUES(2, 'Ester', 'Camacho', 1, 1);
INSERT INTO
  supplier
VALUES
  (
    1,
    'Super provedor',
    2,
    '+3458-674562',
    '+3456578-674562',
    'A79935607'
  );
INSERT INTO
  glasses
VALUES
  (
    1,
    'Ray Ban',
    1.55,
    2.8,
    'metalica',
    'Red',
    'dark',
    21354,
    987,
    1
  );
INSERT INTO
  sale
VALUES
  (1, '2021/08/21', 1, 1);
INSERT INTO
  sale_item
VALUES
  (1, 1, 3, 1);
----Queries-------------------------------------------------
  
-- Lista el total de facturas de un cliente en un período determinado
SELECT
  SUM(g.price * si.quantity) AS total_facturas
FROM
  client c
  INNER JOIN sale s ON s.sold_to = c.client_id
  INNER JOIN sale_item si ON si.sale_id = s.sale_id
  INNER JOIN glasses g ON g.glasses_id = si.glasses_id
WHERE
  c.name = "Maria"
  AND c.last_name = "Hernandez"
  AND s.sale_date BETWEEN "1999-01-01"
  AND "2030-12-31" 
  
  -- Lista los distintos modelos de gafas que ha vendido un empleado durante un año
  --Las gafas no tienen nombre de modelo, las caracteristicas unicas de cada gafa estan agrupadas por su id, eso es lo que voy a devolver:
SELECT
  DISTINCT g.glasses_id AS numero_de_modelo
FROM
  glasses g
  INNER JOIN sale_item si ON g.glasses_id = si.glasses_id
  INNER JOIN sale s ON si.sale_id = s.sale_id
  INNER JOIN employee e ON e.employee_id = s.sold_by
WHERE
  e.employee_id = 1
  AND s.sale_date BETWEEN "2021-01-01"
  AND "2021-12-31" 
  
  -- Lista los distintos proveedores que han suministrado gafas vendidas con éxito por la óptica
SELECT
  DISTINCT s.name AS supplier_whos_products_have_been_sold
FROM
  supplier s
  INNER JOIN glasses g ON g.supplier_id = s.supplier_id
  INNER JOIN sale_item si ON g.glasses_id = si.glasses_id