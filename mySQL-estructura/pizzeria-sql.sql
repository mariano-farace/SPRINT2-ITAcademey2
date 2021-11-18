--//TODO referir el cliente con otra key de cliente  (siempre y cuando alguien le haya recomendado).
--//TODO ver como insertar la fecha date, verificar el tipo de data
--//TODO ver los que son ENUM!!!!
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