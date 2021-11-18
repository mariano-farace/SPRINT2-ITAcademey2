DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;
CREATE TABLE city (
  city_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL
);
CREATE TABLE client (
  client_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  street VARCHAR(100) NOT NULL,
  city_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (city_id) REFERENCES city(city_id),
  phone_number VARCHAR(50) NOT NULL
);
CREATE TABLE store (
  store_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  street VARCHAR(100) NOT NULL,
  postal_code VARCHAR(100) NOT NULL,
  city_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (city_id) REFERENCES city(city_id),
  phone_number VARCHAR(50) NOT NULL
);
CREATE TABLE employee (
  employee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  nif VARCHAR(20) NOT NULL,
  phone_number VARCHAR(50) NOT NULL,
  job_type ENUM('cook', 'delivery_man') NOT NULL,
  store_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (store_id) REFERENCES store(store_id)
);
CREATE TABLE product (
  product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  type ENUM("pizza", "burger", "drink") NOT NULL,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(200) NOT NULL,
  picture VARCHAR(200) NOT NULL,
  price INT UNSIGNED NOT NULL,
  pizza_cattegory VARCHAR(50)
);
CREATE TABLE order_c(
  order_c_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  order_c_date_and_time DATETIME NOT NULL,
  store_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (store_id) REFERENCES store(store_id),
  for_delivery BOOL NOT NULL,
  delivery_man_id INT UNSIGNED,
  FOREIGN KEY (delivery_man_id) REFERENCES employee(employee_id),
  delivery_time DATETIME,
  client_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (client_id) REFERENCES client(client_id),
  total_price INT UNSIGNED NOT NULL
);
CREATE TABLE order_c_item(
  order_c_item_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  product_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  quantity INT NOT NULL,
  order_c_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (order_c_id) REFERENCES order_c(order_c_id)
);
-------------------------------------------------------------------------------------------------------

INSERT INTO
  city
VALUES(1,"Barcelona", "Catalunya");


INSERT INTO
  client
VALUES(1, "Marita", "Riveros", "Viladomat 96", 1, "956-8764564");

INSERT INTO
  store
VALUES(1, "Pizzeria Fantastica", "Carrer Arago 895", "S6547", 1, "+34 9 547 12354");

INSERT INTO
  employee
VALUES(1, "Analia", "Nielsen", "Z654657", "65475867564", "delivery_man", 1);

INSERT INTO
  product
VALUES(1, "pizza", "Fugazzeta", "Cebolla, oregano, muzzarella", "https://fugazzeta.JPG", 3500, "A la piedra");

INSERT INTO
  product
VALUES(2, "drink", "Sprite", "Bebida refrescante sabor lima", "sprite/media/.JPG", 300, NULL);

INSERT INTO
  order_c
VALUES(1, "2020-01-01 10:10:10", 1, 1,1,"2020-01-01 10:45:35",1,3800 );



INSERT INTO
  order_c_item
VALUES(1,1,2,1);

INSERT INTO
  order_c_item
VALUES(2,2,5,1);