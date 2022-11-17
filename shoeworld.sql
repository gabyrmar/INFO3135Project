DROP DATABASE IF EXISTS shoeworld;
create database shoeworld;
use shoeworld;


CREATE TABLE users (
    userID int NOT NULL AUTO_INCREMENT,
    password_hash VARCHAR(100) NOT NULL DEFAULT '',
    email VARCHAR(100) NOT NULL DEFAULT '',
    name VARCHAR(30) NOT NULL DEFAULT '',
    username VARCHAR(30) NOT NULL DEFAULT '',
    PRIMARY KEY (userId)
);



CREATE TABLE admin (
    adminID int NOT NULL AUTO_INCREMENT,
    password VARCHAR(100) NOT NULL DEFAULT '',
    email VARCHAR(100) NOT NULL DEFAULT '',
    PRIMARY KEY (adminID)
);

CREATE TABLE shoes (
	shoeID int NOT NULL auto_increment,
    shoeName VARCHAR(100) NOT NULL DEFAULT '',
    Brand VARCHAR(50) NOT NULL DEFAULT '',
    Price int NOT NULL,
    primary key(shoeID)
);

CREATE TABLE category (
	CategoryID INT NOT NULL auto_increment,
    CategoryName VARCHAR(25) NOT NULL DEFAULT '',
    primary key(CategoryID)
);

CREATE TABLE orders (
	OrderID int NOT NULL AUTO_INCREMENT,
    OrderDate DATETIME NOT NULL,
	TaxAmount DECIMAL(10,2) NOT NULL,
    ShipAddressID INT NOT NULL,
    CardType CHAR(1) NOT NULL,
    CardNumber CHAR(16) NOT NULL,
    CardExpires CHAR(7) NOT NULL,
    primary key(OrderID)
);

CREATE TABLE orderItems (
	itemID INT NOT NULL auto_increment,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    itemPrice DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    Size int NOT NULL,
    PRIMARY KEY (itemID),
    INDEX orderID (orderID),
    INDEX productID (productID)
);

-----------------------------------------------------------------------------------------------------
INSERT INTO shoes (shoeName, Brand, Price) 
VALUES ('Runner 1','Nike','99.99'),
	   ('Runner 2','Nike','109.99'),
        ('Casual 1','Converse','79.99'),
        ('Coausl 2','Vans','89.99'),
       ('Formal 1','Steve Madden','199.99'),
       ('Formal 2','Boss','299.99'),
        ('Boots 1','Hunter','249.99'),
       ('Boots 2','Berkenstocks','209.99'),
       ('Sandals 1','Crocs','69.99'),
       ('Sandals 2','Nike','109.99'); 

INSERT INTO category (CategoryName)
VALUES ('Running'),
	   ('Casual'),
       ('Formal'),
       ('Boots'),
       ('Sandals');
       
INSERT INTO users (name, password_hash, email, username)
VALUES ('gaby','123', 'gaby.renderos1@gmail.com', 'gab');

INSERT INTO shoeworld.admin (password, email) 
VALUES ('Password123.','admin@shoeworld.com');


-- create the users
CREATE USER IF NOT EXISTS mgs_user@localhost 
IDENTIFIED BY 'pa55word';

CREATE USER IF NOT EXISTS mgs_tester@localhost 
IDENTIFIED BY 'pa55word';

-- grant privleges to the users
GRANT SELECT, INSERT, DELETE, UPDATE
ON * 
TO mgs_user@localhost;

GRANT SELECT 
ON category
TO mgs_tester@localhost;
