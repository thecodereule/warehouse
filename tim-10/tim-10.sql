-- Database DDL SCHEMA


-- warehouse_management.cart definition

CREATE TABLE `cart` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.category definition

CREATE TABLE `category` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) DEFAULT NULL,
                            `description` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.customer definition

CREATE TABLE `customer` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `first_name` varchar(255) NOT NULL,
                            `last_name` varchar(255) NOT NULL,
                            `shipping_address_id` int DEFAULT NULL,
                            `email` varchar(255) NOT NULL,
                            `phone` varchar(255) NOT NULL,
                            `country` varchar(255) DEFAULT NULL,
                            `zip` varchar(255) DEFAULT NULL,
                            `city` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `fk_customer_shipping_address` (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.product_trait definition

CREATE TABLE `product_trait` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `weight_kg` double DEFAULT NULL,
                                 `dimensions_mm` varchar(255) DEFAULT NULL,
                                 `consumer_product` tinyint(1) DEFAULT NULL,
                                 `fragile` tinyint(1) DEFAULT NULL,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.shipping_address definition

CREATE TABLE `shipping_address` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `address` varchar(255) NOT NULL,
                                    `city` varchar(255) NOT NULL,
                                    `state` varchar(255) NOT NULL,
                                    `zip` varchar(255) NOT NULL,
                                    `country` varchar(255) NOT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `idx_shipping_address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.warehouse definition

CREATE TABLE `warehouse` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `name` varchar(255) DEFAULT NULL,
                             `address` varchar(255) DEFAULT NULL,
                             `city` varchar(255) DEFAULT NULL,
                             `state` varchar(255) DEFAULT NULL,
                             `zip` varchar(255) DEFAULT NULL,
                             `country` varchar(255) DEFAULT NULL,
                             `phone` varchar(255) DEFAULT NULL,
                             `email` varchar(255) DEFAULT NULL,
                             `totalCapacity` int DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.customer_order definition

CREATE TABLE `customer_order` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `cart_id` int NOT NULL,
                                  `customer_id` int NOT NULL,
                                  `shipping_address_id` int NOT NULL,
                                  `order_date` datetime NOT NULL,
                                  `status` varchar(255) NOT NULL,
                                  `warehouse_id` int DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `unique_cart_id` (`cart_id`),
                                  KEY `fk_customer_order_customer` (`customer_id`),
                                  KEY `fk_customer_order_warehouse` (`warehouse_id`),
                                  KEY `fk_customer_order_shipping_address` (`shipping_address_id`),
                                  CONSTRAINT `fk_customer_order_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
                                  CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
                                  CONSTRAINT `fk_customer_order_shipping_address` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`id`),
                                  CONSTRAINT `fk_customer_order_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.product definition

CREATE TABLE `product` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) DEFAULT NULL,
                           `description` varchar(255) DEFAULT NULL,
                           `category_id` int DEFAULT NULL,
                           `code` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `category_id` (`category_id`),
                           CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.product_to_product_trait definition

CREATE TABLE `product_to_product_trait` (
                                            `product_id` int NOT NULL,
                                            `product_trait_id` int NOT NULL,
                                            PRIMARY KEY (`product_id`,`product_trait_id`),
                                            KEY `product_trait_id` (`product_trait_id`),
                                            CONSTRAINT `product_to_product_trait_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
                                            CONSTRAINT `product_to_product_trait_ibfk_2` FOREIGN KEY (`product_trait_id`) REFERENCES `product_trait` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.article definition

CREATE TABLE `article` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) DEFAULT NULL,
                           `code` varchar(255) DEFAULT NULL,
                           `variant` varchar(255) DEFAULT NULL,
                           `description` varchar(255) DEFAULT NULL,
                           `price` double DEFAULT NULL,
                           `product_id` int DEFAULT NULL,
                           `warehouse_id` int DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `product_id` (`product_id`),
                           KEY `warehouse_id` (`warehouse_id`),
                           CONSTRAINT `article_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
                           CONSTRAINT `article_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.cart_item definition

CREATE TABLE `cart_item` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `cart_id` int DEFAULT NULL,
                             `article_id` int DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `cart_id` (`cart_id`),
                             KEY `article_id` (`article_id`),
                             CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
                             CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- warehouse_management.warehouse_inventory definition

CREATE TABLE `warehouse_inventory` (
                                       `warehouse_id` int NOT NULL,
                                       `article_id` int NOT NULL,
                                       `product_id` int DEFAULT NULL,
                                       PRIMARY KEY (`warehouse_id`,`article_id`),
                                       KEY `article_id` (`article_id`),
                                       KEY `product_id` (`product_id`),
                                       CONSTRAINT `warehouse_inventory_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
                                       CONSTRAINT `warehouse_inventory_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
                                       CONSTRAINT `warehouse_inventory_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





-- Data --


INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   ('Article Name','Article Code','Article Variant','Article Description',100.0,2,1),
   ('Article Name','Article Code','Article Variant','Article Description',100.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10),
   (NULL,NULL,NULL,NULL,200.0,2,11);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,2,1),
   (NULL,NULL,NULL,NULL,200.0,2,2),
   (NULL,NULL,NULL,NULL,200.0,2,3),
   (NULL,NULL,NULL,NULL,200.0,2,4),
   (NULL,NULL,NULL,NULL,200.0,2,5),
   (NULL,NULL,NULL,NULL,200.0,2,7),
   (NULL,NULL,NULL,NULL,200.0,2,8),
   (NULL,NULL,NULL,NULL,200.0,2,9),
   (NULL,NULL,NULL,NULL,200.0,2,10);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,2,11),
   (NULL,NULL,NULL,NULL,200.0,2,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4),
   (NULL,NULL,NULL,NULL,200.0,33,5);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12),
   (NULL,NULL,NULL,NULL,200.0,33,1),
   (NULL,NULL,NULL,NULL,200.0,33,2),
   (NULL,NULL,NULL,NULL,200.0,33,3),
   (NULL,NULL,NULL,NULL,200.0,33,4);
INSERT INTO warehouse_management.article (name,code,variant,description,price,product_id,warehouse_id) VALUES
   (NULL,NULL,NULL,NULL,200.0,33,5),
   (NULL,NULL,NULL,NULL,200.0,33,7),
   (NULL,NULL,NULL,NULL,200.0,33,8),
   (NULL,NULL,NULL,NULL,200.0,33,9),
   (NULL,NULL,NULL,NULL,200.0,33,10),
   (NULL,NULL,NULL,NULL,200.0,33,11),
   (NULL,NULL,NULL,NULL,200.0,33,12);
INSERT INTO warehouse_management.cart () VALUES
   (),
   (),
   (),
   (),
   (),
   (),
   (),
   (),
   (),
   ();
INSERT INTO warehouse_management.cart () VALUES
   (),
   (),
   (),
   (),
   (),
   ();
INSERT INTO warehouse_management.cart_item (cart_id,article_id) VALUES
   (1,4),
   (1,4),
   (1,5),
   (2,33),
   (2,23),
   (2,24),
   (2,35),
   (2,279),
   (2,290),
   (3,23);
INSERT INTO warehouse_management.cart_item (cart_id,article_id) VALUES
   (3,24),
   (3,35),
   (3,279),
   (3,290),
   (4,23),
   (4,24),
   (4,35),
   (4,279),
   (4,290),
   (5,23);
INSERT INTO warehouse_management.cart_item (cart_id,article_id) VALUES
   (5,24),
   (5,35),
   (5,279),
   (5,290),
   (6,23),
   (6,24),
   (6,35),
   (6,279),
   (6,290),
   (7,23);
INSERT INTO warehouse_management.cart_item (cart_id,article_id) VALUES
   (7,24),
   (7,35),
   (7,279),
   (7,290),
   (8,23),
   (8,24),
   (8,35),
   (8,279),
   (8,290),
   (9,23);
INSERT INTO warehouse_management.cart_item (cart_id,article_id) VALUES
   (9,24),
   (9,35),
   (9,279),
   (9,290);
INSERT INTO warehouse_management.category (name,description) VALUES
   ('Category Name','Category Description'),
   ('A','Consumer Electronics'),
   ('A2','Phones and Telecommunication'),
   ('A3a','Nokia Mobile Phones'),
   ('A3b','Xiaomi Mobile Phones'),
   ('A3c','Huawei Mobile Phones'),
   ('A3d','Apple Mobile Phones'),
   ('A3e','Samsung Mobile Phones'),
   ('A3f','LG Mobile Phones'),
   ('A4','Computers and Tablets');
INSERT INTO warehouse_management.category (name,description) VALUES
   ('A4a','Desktop Computers'),
   ('A4b','Laptops'),
   ('A4c','Tablets'),
   ('A4d','2-in-1 Laptops'),
   ('A4e','Gaming Laptops'),
   ('B','Home Appliances'),
   ('B2','Kitchen Appliances'),
   ('B2a','Refrigerators'),
   ('B2b','Ovens'),
   ('B2c','Microwaves');
INSERT INTO warehouse_management.category (name,description) VALUES
   ('B2d','Dishwashers'),
   ('B2e','Toasters');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('John','Doe',2,'john.doe@example.com','1234567890','USA','10001','New York'),
   ('Jane','Doe',4,'jane.doe@example.com','1234567890','USA','10001','New York'),
   ('igor','tadić',5,'igortadicsudo@admin.hr','1234567890','Croatia','10001','Zagreb'),
   ('Vinko','Horvat',6,'itsvinko@kupac.hr','41320841','Croatia','10000','Zagreb'),
   ('Dobrožizna','Pribislava',7,'dobrozizna@pribislava.com','413201321','Slovenia','10321','Maribor'),
   ('Destiny','Wiggins',NULL,'shaneyoung@example.net','001-583-518-2254x95022','Cyprus','26271','Mccormickland'),
   ('Megan','Clements',NULL,'dustin77@example.net','6954872725','Lithuania','28493','Ronaldside'),
   ('Benjamin','Perry',NULL,'colton27@example.org','(613)600-6494x410','Armenia','10407','Woodtown'),
   ('David','Juarez',NULL,'torreskathleen@example.net','465-895-1497','Greenland','36644','Amberchester'),
   ('Katie','Burns',NULL,'nwilliams@example.net','4967451850','Kiribati','16620','North Charlesmouth');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Wendy','Lambert',NULL,'jenkinslori@example.org','708.952.4909x847','Yemen','86784','Port Jonathan'),
   ('Darryl','Murillo',NULL,'michellele@example.net','749-495-2453x49449','Equatorial Guinea','99469','West Jeffrey'),
   ('Andrew','Jensen',NULL,'pparker@example.com','687.306.9034','Kenya','17026','East Kaitlynport'),
   ('David','Nguyen',NULL,'michael36@example.net','889-574-8614x7429','Nauru','83595','Michelemouth'),
   ('Jordan','Martinez',NULL,'luis41@example.net','484.484.5852x079','Korea','90590','Karenland'),
   ('Melissa','Camacho',NULL,'michael26@example.com','673.338.1088','Swaziland','46292','Ryanshire'),
   ('Jason','Ellis',NULL,'psexton@example.org','364.732.7159','Cuba','23265','New Deborahborough'),
   ('Joseph','Watkins',NULL,'ppratt@example.org','+1-772-240-7570x221','Timor-Leste','14656','Andersonborough'),
   ('Cindy','Sherman',NULL,'rdean@example.com','484.480.6059','Senegal','11633','New Wendyland'),
   ('Kathryn','Smith',NULL,'ravensmith@example.net','896.955.2906','Thailand','80483','Frazierhaven');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Heather','Drake',NULL,'kristasanders@example.org','(644)282-6041','Saint Lucia','90734','Jonesville'),
   ('Jonathon','Lucas',NULL,'nancywhite@example.com','701.282.0637x022','Algeria','80346','Heatherfort'),
   ('Jaclyn','Lester',NULL,'fsanchez@example.net','9794013820','Syrian Arab Republic','87592','Hoganport'),
   ('Alexandra','Nichols',NULL,'nathaniel62@example.com','815.675.9911x5527','British Indian Ocean Territory (Chagos Archipelago)','51122','Grahamfort'),
   ('Beth','Miller',NULL,'morrisangie@example.com','001-376-487-8261x838','Tanzania','91359','North Jonathan'),
   ('Johnny','Brooks',NULL,'thomasyoung@example.com','(693)912-9426x110','Jordan','73039','North Raymondport'),
   ('Mary','Stuart',NULL,'jamesbrown@example.com','+1-662-261-5735x1588','Anguilla','89117','Lake Michael'),
   ('Kevin','Torres',NULL,'vriley@example.com','+1-910-481-7274','United States Minor Outlying Islands','63542','Youngshire'),
   ('Anthony','Walker',NULL,'robertperez@example.org','(559)373-2938','Nicaragua','94533','Matthewfurt'),
   ('Daniel','Spears',NULL,'thomasmark@example.org','264-874-8576','Russian Federation','96858','Churchfort');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Sarah','Hurst',NULL,'pricechristian@example.com','(399)211-4577x65956','Brazil','53260','New Donnaland'),
   ('Darlene','Adams',NULL,'millsnoah@example.net','+1-847-647-0890','Nepal','39918','New Justinmouth'),
   ('Kelli','Pittman',NULL,'williambrown@example.net','(830)811-0271','Cuba','09971','Amberchester'),
   ('Spencer','Ramirez',NULL,'nconway@example.net','430.647.7666x168','Iraq','59954','Brianburgh'),
   ('Megan','Davis',NULL,'taylor97@example.com','+1-657-627-8387x972','Lesotho','89451','Taylorhaven'),
   ('Lori','Beard',NULL,'romeromegan@example.com','9979871530','Turkmenistan','47014','Andreside'),
   ('Adam','Guerra',NULL,'destinyramirez@example.net','+1-991-315-8608x93995','Bouvet Island (Bouvetoya)','36804','South Erica'),
   ('James','Perez',NULL,'smithjeremiah@example.net','496-804-6215x1058','Sri Lanka','34824','East Eric'),
   ('Crystal','Neal',NULL,'tfrazier@example.org','(463)275-0784','Korea','68767','Lauraville'),
   ('Luke','Gonzalez',NULL,'ljohnson@example.net','368.708.6960','Nigeria','51068','South Cassandra');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Jamie','Brown',NULL,'obrown@example.net','001-983-914-2786','Tokelau','53209','Port Walter'),
   ('Kevin','Yang',NULL,'warethomas@example.net','001-988-423-3119','Northern Mariana Islands','72318','Martinezbury'),
   ('Sarah','Snyder',NULL,'dramirez@example.org','870.864.4993','Kyrgyz Republic','55699','East Judith'),
   ('Michael','Ali',NULL,'william94@example.com','+1-304-218-6638x9748','Norfolk Island','31870','Normanview'),
   ('Bradley','Brown',NULL,'martha23@example.org','(737)399-7078x7608','Faroe Islands','27323','West Donaldborough'),
   ('Shirley','Le',NULL,'sharon96@example.com','001-648-778-6392','Saint Lucia','56361','Johnsonshire'),
   ('Hunter','Day',NULL,'simmonsjeffrey@example.net','(511)814-8629x7366','Kuwait','02003','Lambborough'),
   ('Kristin','Hoover',NULL,'jordan07@example.org','+1-826-366-7564x7872','Finland','04060','Grossport'),
   ('Brandon','Allen',NULL,'jhudson@example.org','+1-575-738-8004x6709','Venezuela','79922','Lake Miguel'),
   ('Megan','Ayala',NULL,'rwilson@example.com','(929)845-2075x02339','Central African Republic','47965','Cindystad');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Tina','Lowe',NULL,'richardchase@example.org','001-777-530-1495','Venezuela','89968','South Jasonstad'),
   ('Nicholas','Jones',NULL,'dkhan@example.org','2116544181','India','50519','Donaldville'),
   ('Jasmine','Mills',NULL,'tina80@example.com','(685)800-0952','Palestinian Territory','43291','East Rachel'),
   ('David','Clark',NULL,'justin73@example.com','001-584-961-5593x007','Grenada','49079','Port Christopher'),
   ('Brenda','Lang',NULL,'pamelabell@example.org','758-771-7912','Portugal','19512','East Shawn'),
   ('Brian','Pearson',NULL,'bmeyer@example.com','(680)519-3752x5962','Guadeloupe','70446','Riverashire'),
   ('Miguel','Hopkins',NULL,'michellerojas@example.org','(540)771-8463','Papua New Guinea','65933','Eatonburgh'),
   ('Matthew','Miller',NULL,'kevincook@example.org','482-796-0320','Kuwait','34030','Sanchezshire'),
   ('Donald','Lyons',NULL,'bryan96@example.net','001-660-208-8423x578','Bahamas','34538','Houseberg'),
   ('Ethan','Brooks',NULL,'watsonerika@example.net','873-926-3059x5019','Maldives','16450','East Michaelmouth');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Richard','Patterson',NULL,'shawnbarrett@example.net','(827)638-0571','Faroe Islands','70283','Lake Teresaland'),
   ('Thomas','Butler',NULL,'john47@example.com','+1-655-990-9317x53519','Malawi','20203','Shawfort'),
   ('Henry','Nelson',NULL,'rjackson@example.net','9886700003','French Southern Territories','45079','Angelabury'),
   ('Keith','Dixon',NULL,'cchang@example.com','+1-884-747-8189x962','Germany','28789','Robertshire'),
   ('Andrea','Mendez',NULL,'dwayne20@example.com','852-478-5721x332','Pitcairn Islands','02043','Willieville'),
   ('Kevin','Burnett',NULL,'johnanderson@example.com','617.282.6081','Lesotho','89795','Hayesland'),
   ('Tara','Hubbard',NULL,'heather24@example.net','001-885-395-5071x3283','Saint Kitts and Nevis','08331','East Randallfort'),
   ('Carla','Bartlett',NULL,'gary89@example.org','001-879-906-7435x21152','Mali','19504','East Karentown'),
   ('Kevin','Raymond',NULL,'nichole65@example.net','(894)557-3980x693','Algeria','82910','Port Destinyfort'),
   ('Robert','Campbell',NULL,'joshuajohnson@example.net','+1-405-246-0316x87605','Papua New Guinea','24057','South Dustinside');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('William','Perkins',NULL,'mbrown@example.org','699-534-5521x99889','Namibia','84343','Jenniferbury'),
   ('Julie','Marshall',NULL,'duncancole@example.net','001-458-545-9291x455','Monaco','09078','Lake Christine'),
   ('Johnny','Jenkins',NULL,'stoneeric@example.org','397.547.0016','South Georgia and the South Sandwich Islands','04374','Davischester'),
   ('Ryan','Swanson',NULL,'cabrerajason@example.org','+1-771-908-8115x9699','French Southern Territories','92880','North Bradleymouth'),
   ('Ashley','Barrett',NULL,'xbrown@example.org','+1-288-895-0238x7302','Vanuatu','88854','Kaiserbury'),
   ('Michael','Miller',NULL,'qgilbert@example.net','869-560-1550x7949','Bangladesh','77015','North Dominiquefurt'),
   ('Craig','Dean',NULL,'garciasean@example.net','413.649.6968','Kiribati','97282','Port Sherrychester'),
   ('Karen','Jones',NULL,'richardsandoval@example.net','8616167649','Myanmar','01259','South Andrea'),
   ('Harold','Poole',NULL,'jacqueline24@example.net','221.827.3408x6443','Azerbaijan','98246','Millertown'),
   ('Jeremy','Miller',NULL,'robertgreen@example.com','001-647-394-4143x4189','Kiribati','99938','North Maria');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Derrick','Foster',NULL,'williamsmolly@example.com','7425173099','Albania','24219','New Michael'),
   ('Corey','Strickland',NULL,'fwilliams@example.com','001-556-698-8662x6232','Suriname','17364','North Troyberg'),
   ('Ryan','Carter',NULL,'martin59@example.org','(749)411-2418x321','Guadeloupe','78920','Ashleyfort'),
   ('Darren','Jones',NULL,'victoriasimmons@example.net','(438)297-1277x427','Trinidad and Tobago','30328','Port Margaret'),
   ('Paula','Harvey',NULL,'icollins@example.org','365.831.0181x09351','Austria','77622','Heathershire'),
   ('Allison','Rodriguez',NULL,'vward@example.com','826.752.7283','Kiribati','26468','East Stephenport'),
   ('Diane','Mendez',NULL,'hudsonkevin@example.net','(902)481-4022','Tajikistan','82475','Sheltonstad'),
   ('Cindy','Walker',NULL,'frenchjessica@example.com','001-943-838-6798x809','Central African Republic','07627','Port Stephanie'),
   ('Megan','Gamble',NULL,'guerrerologan@example.net','+1-661-945-8935x3730','Korea','57828','South Daniellechester'),
   ('Mark','Taylor',NULL,'frederick00@example.net','(675)764-0981x49876','Malta','79911','Michaelton');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Stephanie','White',NULL,'mbond@example.org','287-385-2799x50430','Croatia','02720','South Sydney'),
   ('Brian','Baker',NULL,'jonesmary@example.org','(849)335-8140','Cote d''Ivoire','40515','West Ronaldberg'),
   ('Nicole','Davidson',NULL,'yvonne12@example.org','411.704.2444x815','Turks and Caicos Islands','19014','East Phillip'),
   ('Clayton','Henry',NULL,'perezerica@example.org','7958794744','Albania','52136','Lake James'),
   ('Daniel','Stevenson',NULL,'arthurcollins@example.net','+1-358-594-9474x47525','Belarus','15268','Lake Danielfurt'),
   ('Richard','Cannon',NULL,'jamesblair@example.org','(852)371-0026x37170','San Marino','47455','West Caitlin'),
   ('Glenda','Gillespie',NULL,'rjones@example.org','(755)747-8573','Saint Helena','11874','Kellyhaven'),
   ('Cole','Mitchell',NULL,'gmartin@example.net','677.298.3405','Niue','59053','Carriestad'),
   ('Shannon','Lowe',NULL,'shane16@example.org','001-989-683-4377','Liechtenstein','85447','Cainmouth'),
   ('Rodney','Mcgee',NULL,'sandramata@example.net','+1-981-369-9542','Timor-Leste','51545','Bonniemouth');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Peggy','Harris',NULL,'stonehector@example.org','4953091743','Sudan','41236','East Ryan'),
   ('Bryan','Chang',NULL,'timothylong@example.net','267.397.0185x364','Maldives','49196','Rebeccaland'),
   ('Andrea','Edwards',NULL,'hillisaiah@example.com','(689)892-6006x21337','Guyana','80874','East Cristinafurt'),
   ('Virginia','Kirk',NULL,'aarontorres@example.com','(924)703-2464','Panama','33707','South Marcusfurt'),
   ('William','Moran',NULL,'andrea23@example.com','248.641.1965','Zambia','91006','Walshhaven'),
   ('Jason','Chambers',NULL,'kim53@example.net','(318)912-9045x8776','Spain','93285','Hopkinstown'),
   ('Sean','Burke',NULL,'amy20@example.com','001-744-320-1391x123','Jamaica','90577','Smithborough'),
   ('Candice','Johnson',NULL,'jbennett@example.com','001-741-691-4979x6886','Canada','71134','Andrewview'),
   ('Justin','Rojas',NULL,'aaronhunt@example.com','(833)422-3446','Costa Rica','72779','Mosesland'),
   ('Cynthia','Woods',NULL,'andrea49@example.net','001-866-753-3589','Pitcairn Islands','21419','South Robert');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Joan','Fowler',NULL,'cannonshannon@example.com','001-357-345-0521x804','Western Sahara','65429','Melissachester'),
   ('Darryl','Porter',NULL,'samuelhamilton@example.org','(491)215-8981','American Samoa','79297','Cannonton'),
   ('Deborah','Nichols',NULL,'richard63@example.com','+1-967-974-3189','Sao Tome and Principe','18356','Jacobshaven'),
   ('Melissa','Hill',NULL,'jesusgarrison@example.org','289.715.6462x826','Bouvet Island (Bouvetoya)','67907','West Bruce'),
   ('Brianna','Harris',NULL,'gsummers@example.net','(586)717-4554x2090','Libyan Arab Jamahiriya','07959','Bryantown'),
   ('Christy','Bates',NULL,'ijohnson@example.net','+1-309-601-8256x840','Dominican Republic','09141','Greentown'),
   ('Samuel','Dickerson',NULL,'lukeward@example.com','(952)979-5600x5856','Syrian Arab Republic','96442','South Jameshaven'),
   ('Christopher','Morgan',NULL,'donald73@example.org','8032879501','Wallis and Futuna','23086','Jillstad'),
   ('Jerry','Leon',NULL,'tfoster@example.org','(348)419-7641x1404','Wallis and Futuna','31828','Lamberthaven'),
   ('Lorraine','Miller',NULL,'awise@example.org','(279)710-9666','Greece','82879','South Rhondashire');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Christina','Cummings',NULL,'barryjones@example.org','001-424-714-6189x44980','Dominica','46353','Garciafort'),
   ('Jeffrey','Doyle',NULL,'rcummings@example.com','001-669-255-6769','Lithuania','95410','West Kellyside'),
   ('Sandra','Hurley',NULL,'brownbobby@example.net','001-997-580-9640x44806','Slovenia','38923','Jillfurt'),
   ('Beth','Villa',NULL,'dennisgomez@example.com','802-343-7592','Italy','27473','East Pamela'),
   ('Melissa','Vargas',NULL,'vgibson@example.com','(368)717-1988x3780','Martinique','58000','Solisborough'),
   ('Jessica','Brown',NULL,'annamcintosh@example.net','(996)493-2826','Albania','98214','North Joy'),
   ('Marilyn','Grant',NULL,'khunter@example.net','895-520-9578x2281','Mexico','17550','Gomezfurt'),
   ('Joseph','Davis',NULL,'josebrown@example.com','2798451233','Angola','12549','Weisschester'),
   ('Sarah','Walker',NULL,'alicynthia@example.com','9199700605','Ireland','75937','North Thomas'),
   ('Darren','Kramer',NULL,'justin75@example.org','475.757.9536','Moldova','48314','Dicksonmouth');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('John','Shaffer',NULL,'ljones@example.net','213.309.9697x917','Morocco','56236','New Leviview'),
   ('Tracy','Parker',NULL,'averyjames@example.com','9827189462','Singapore','12618','Andrewton'),
   ('Michelle','Hernandez',NULL,'kelseysnyder@example.net','(866)546-6978','Finland','06538','Deannabury'),
   ('Samuel','Yates',NULL,'jessemejia@example.com','001-479-706-5195','Guam','25399','Williamshaven'),
   ('Karen','Galvan',NULL,'zalvarez@example.org','592.437.9376x5652','Ireland','19554','Weststad'),
   ('Charles','Romero',NULL,'craig94@example.com','+1-863-346-0651x128','Paraguay','52009','East Elizabethborough'),
   ('Erik','Livingston',NULL,'nicholas48@example.org','001-489-664-0200x9053','Wallis and Futuna','19595','Robinsonmouth'),
   ('Katelyn','Johnston',NULL,'fwoods@example.net','(738)665-5269','Vietnam','86486','Hendricksland'),
   ('Mary','Davis',NULL,'jreynolds@example.com','2392057835','Netherlands Antilles','43552','North Wesleyhaven'),
   ('Michael','Martinez',NULL,'jacobjones@example.net','(619)675-3600x8994','Bolivia','34598','Burnettberg');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Mary','Owens',NULL,'erica91@example.org','+1-518-610-8845x601','Fiji','78500','Melissamouth'),
   ('Shannon','Sandoval',NULL,'davissydney@example.net','709.571.5851x131','Malaysia','75355','Herreraberg'),
   ('Amanda','Yates',NULL,'esingleton@example.com','+1-252-487-1878x803','San Marino','24198','West Kaylabury'),
   ('Angela','Meadows',NULL,'veleznancy@example.org','3359831160','United States Virgin Islands','57620','Lake Michael'),
   ('Kaitlin','Lee',NULL,'kathy56@example.com','9525794666','Rwanda','74235','North James'),
   ('Lisa','Adams',NULL,'mramos@example.com','532.970.2118x32116','Belize','85748','Joyside'),
   ('Rita','Goodwin',NULL,'craig05@example.net','+1-898-653-7986x1556','Gambia','31009','East Jeremy'),
   ('Pamela','Velazquez',NULL,'emilyerickson@example.net','357-965-5491x919','Peru','67213','Singletonland'),
   ('Cindy','Montgomery',NULL,'kelly16@example.com','+1-278-655-1088x56914','Guinea-Bissau','78451','New James'),
   ('Daniel','Sanchez',NULL,'sadams@example.org','792-385-4434','Estonia','75383','Shawnside');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Gary','Robinson',NULL,'johnsonjill@example.net','+1-433-664-9836','Malaysia','18695','Robertfort'),
   ('Lisa','Peterson',NULL,'kmitchell@example.com','303.532.2936x39293','United States Minor Outlying Islands','92906','Port Ricardo'),
   ('Ashley','Beck',NULL,'nwilliams@example.com','001-652-739-3239','Bouvet Island (Bouvetoya)','69337','Hansenland'),
   ('Katherine','Rogers',NULL,'agreen@example.com','271.969.4242x0423','Cambodia','20469','Lake John'),
   ('Elizabeth','Fuller',NULL,'qarmstrong@example.org','(384)527-5891','Austria','37252','New Davidborough'),
   ('Scott','Johnson',NULL,'fjohnson@example.org','001-706-394-3314x20713','Ukraine','54442','Aliciachester'),
   ('Kelly','Lowery',NULL,'mariahcasey@example.com','391-881-5255','Sweden','94326','West Steveborough'),
   ('Edward','Bullock',NULL,'markrandolph@example.net','279.568.6347x68912','Latvia','69075','South Sara'),
   ('Kendra','Jackson',NULL,'lisa98@example.net','001-396-545-7348x8094','Azerbaijan','12592','Scottberg'),
   ('Susan','Jarvis',NULL,'upatton@example.net','973.622.4723','Saint Martin','47303','East Larry');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Ann','Miller',NULL,'kathygonzalez@example.com','+1-687-287-2698x40367','Yemen','35175','West Aprilborough'),
   ('David','Bowers',NULL,'mark58@example.org','(395)870-8943','Costa Rica','58224','South Marktown'),
   ('Bob','Porter',NULL,'nicholas92@example.com','675-559-5617','Zimbabwe','52459','North Nancyborough'),
   ('David','Jacobs',NULL,'iwilliams@example.com','001-995-300-6442','India','17473','New Jennifer'),
   ('Heather','Braun',NULL,'bwatts@example.net','748.334.5846x69386','Peru','66266','Perezfort'),
   ('Angela','Chang',NULL,'gregory19@example.net','423-985-9415x023','Turkey','79509','Richardfort'),
   ('Amanda','Garcia',NULL,'callahanlinda@example.com','842.879.2972','Azerbaijan','25878','East Tammy'),
   ('Patricia','Jones',NULL,'nathan57@example.org','816.489.4408x406','Equatorial Guinea','36913','Matthewchester'),
   ('Gabriel','Jones',NULL,'gbeck@example.net','493-812-7988x7979','San Marino','67693','Lawrencefort'),
   ('Jennifer','Russo',NULL,'muellerryan@example.org','+1-717-425-6262x42460','Denmark','58327','Christophertown');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Megan','Strickland',NULL,'twilson@example.com','330.336.1654','Hong Kong','99024','Kempfort'),
   ('Mary','Patel',NULL,'bjackson@example.org','766-248-9428','Israel','41304','Wolfeport'),
   ('Angela','Miller',NULL,'claudia22@example.net','642-851-8934','Pakistan','49539','Lozanoland'),
   ('Eric','Taylor',NULL,'pageashley@example.org','001-679-700-8782x978','Saint Lucia','24639','Kimberlyfort'),
   ('Jennifer','Banks',NULL,'thompsonmiguel@example.com','695.960.5792x826','Slovakia (Slovak Republic)','96118','Austinmouth'),
   ('Tabitha','Green',NULL,'browningjohn@example.org','824-220-7684','Isle of Man','47386','South Jeffreymouth'),
   ('Morgan','Beck',NULL,'dmcclain@example.org','(517)506-9685x88636','Ukraine','81171','Floresport'),
   ('Christine','Ross',NULL,'qhendricks@example.org','001-644-437-2956','Zambia','15506','New Aaronstad'),
   ('Rachel','Lin',NULL,'kevingomez@example.org','+1-366-683-5212','Marshall Islands','83133','Connerfort'),
   ('Ryan','Reyes',NULL,'mollybender@example.org','(364)554-1544x887','Mayotte','04594','Jessicatown');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Tom','Mcmillan',NULL,'wayne57@example.net','(474)506-6498x037','Turks and Caicos Islands','14656','West Laura'),
   ('Sarah','Saunders',NULL,'nortonadam@example.com','842.886.1137','Martinique','25651','West Traciburgh'),
   ('Susan','Fischer',NULL,'ysanchez@example.org','4329450345','Cambodia','06368','Reedville'),
   ('Laura','Williams',NULL,'clogan@example.org','736.243.6362x9282','Slovenia','85357','West Tina'),
   ('John','Johnson',NULL,'myersdaniel@example.net','231.243.5220x88649','Burundi','36854','East Kimberlyshire'),
   ('Chris','Phillips',NULL,'kaitlynsmith@example.com','8062080162','Guam','63101','Cynthiastad'),
   ('David','Young',NULL,'landrykelly@example.net','245.738.1600','Uruguay','38214','South Wanda'),
   ('Brent','Bowers',NULL,'velazquezricky@example.com','3296861430','China','63925','Matthewfort'),
   ('Alicia','Howell',NULL,'leblancrobert@example.com','4046098378','Italy','50435','West Marcmouth'),
   ('Sandra','Smith',NULL,'smithlaura@example.net','+1-823-409-8249','Poland','55201','South Melissa');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Paul','Johnson',NULL,'rnelson@example.net','5189993129','India','37376','Lake Victoria'),
   ('Isaac','Ramirez',NULL,'jasmine52@example.com','(388)662-7123x3295','Mauritius','75272','Melissamouth'),
   ('Kelly','Hendricks',NULL,'crawfordsarah@example.net','531-727-6926','United Arab Emirates','99106','Reyesborough'),
   ('Shawn','Mcdaniel',NULL,'mmurray@example.net','+1-502-267-5471x782','Zambia','34383','Roweshire'),
   ('Denise','Williams',NULL,'vlewis@example.org','+1-604-241-8993x0989','Tuvalu','23427','Micheleville'),
   ('Jonathan','Parker',NULL,'amercer@example.org','794.868.6546','Saint Kitts and Nevis','07937','Jaredfurt'),
   ('Dawn','Perez',NULL,'vaughndebbie@example.org','+1-717-890-1018x339','Malaysia','14017','East Matthew'),
   ('Samuel','Gonzalez',NULL,'tracy61@example.com','889-847-5095x6001','Liberia','28420','Cathyfort'),
   ('Gregory','Singleton',NULL,'megansheppard@example.net','202-380-2859','French Polynesia','44482','Lake Teresatown'),
   ('Michael','Perkins',NULL,'uduncan@example.org','232-260-7798x86572','Jamaica','79785','Martinmouth');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Darryl','Patterson',NULL,'emily28@example.org','(911)574-5815x93667','Algeria','24055','Robertmouth'),
   ('Tyler','Rojas',NULL,'omichael@example.com','+1-599-295-8896','Barbados','33931','West Thomasfurt'),
   ('Benjamin','Church',NULL,'tyler59@example.net','838.514.5025','Timor-Leste','28847','Frankview'),
   ('Brian','Walton',NULL,'hessjustin@example.org','001-403-847-6098','Montserrat','11729','South Evan'),
   ('Danielle','Martin',NULL,'thomaskelly@example.net','001-288-886-6343','United Arab Emirates','34453','South Paul'),
   ('Laura','Galešić',NULL,'victorpoelitz@example.com','0800 43 94','Zypern','42184858','Karlsruhe'),
   ('Gereon','Dvojak',NULL,'karlakocijancic@example.net','060 937 021','Kolumbija','42184858','Greiz'),
   ('Dario','Lovrić',NULL,'ijagarinec@example.net','+49(0)8234 359214','Honduras','42184858','Pag'),
   ('Liesbeth','Langern',NULL,'miletudor@example.com','+49(0) 757056592','Sjeverni Marijanski Otoci','42184858','Sveti Ivan Zelina'),
   ('Sophie','Schuchhardt',NULL,'ika60@example.net','+49(0)8910480161','Dschibuti','42184858','Novi Marof');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Toni','Zimmer',NULL,'penicjosko@example.org','+49(0)1901800403','Bahrein','42184858','Nin'),
   ('Ika','Lasić',NULL,'martindizdar@example.com','052 422 768','Afghanistan','42184858','Omiš'),
   ('Nika','Rust',NULL,'spoljaricmateja@example.net','099 1906 265','Guyana','42184858','Bergzabern'),
   ('Leon','Radman',NULL,'gordanarahija@example.net','031 176 750','Tadschikistan','42184858','Wunsiedel'),
   ('Wera','Staničić',NULL,'joskosobota@example.org','034 369 316','Côte d’Ivoire','42184858','Koprivnica'),
   ('Ružica','Ribičić',NULL,'fmisicher@example.com','03370 41631','Liberija','42184858','Wertingen'),
   ('Pavao','Kühnert',NULL,'hethurclaus-dieter@example.org','031 846 898','Barbados','42184858','Schmölln'),
   ('Magdalena','Müller',NULL,'victorkrebs@example.org','00353156111','Falklandinseln','42184858','Forchheim'),
   ('Antun','Roso',NULL,'bjelisjulijana@example.com','074 460 991','St. Kitts und Nevis','42184858','Berchtesgaden'),
   ('Luka','Schmidt',NULL,'zdravko35@example.net','033 048 182','Indija','42184858','Dugo Selo');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Dalibor','Geisler',NULL,'mstanic@example.net','040 805 438','Luxemburg','42184858','Königs Wusterhausen'),
   ('Branko','Bender',NULL,'stiffelswantje@example.net','042 891 883','Britanski Djevičanski Otoci','42184858','Novigrad'),
   ('Mirjana','Perišić',NULL,'cichoriussandro@example.org','03294 16181','Belgien','42184858','Burgdorf'),
   ('Anđela','Koch',NULL,'skupnjakantonio@example.net','020 995 416','Wallis und Futuna','42184858','Buzet'),
   ('Herrmann','Davids',NULL,'rochusheser@example.com','+49(0)3642 51239','Bahrain','42184858','Wurzen'),
   ('Ingmar','Lazar',NULL,'jvidov@example.com','(09123) 12214','Kap Verde','42184858','Dessau'),
   ('Elizabeta','Liović',NULL,'aschomber@example.org','040 937 649','Antarktis','42184858','Prelog'),
   ('Dario','Seip',NULL,'loefflerrosemarie@example.org','020 827 606','Nigerija','42184858','Calau'),
   ('Helmut','Röhrdanz',NULL,'gutezdenka@example.org','+49(0)1235722531','Kiribati','42184858','Geithain'),
   ('Ivana','Koch II',NULL,'matovinakarlo@example.net','(07832) 65757','Malediven','42184858','Imotski');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Nataša','Kolega',NULL,'jnorac@example.com','0800 86 28','Äußeres Ozeanien','42184858','Mursko Središće'),
   ('Ilija','Šantić',NULL,'iflego@example.com','+49(0)0950 368483','Nördliche Marianen','42184858','Požega'),
   ('Yilmaz','Ugrinić',NULL,'barbarajemric@example.com','03477437811','Iran, Islamska Republika','42184858','Vodnjan'),
   ('Alla','Šitum',NULL,'joskoklaric@example.com','+49 (0) 4926 056887','Paraguay','42184858','Saulgau'),
   ('Mate','Banovac',NULL,'hornigklaus-d@example.com','095 6789 014','Palästinensische Gebiete','42184858','Našice'),
   ('Ildiko','Culi',NULL,'austermuehletilly@example.net','03761 726490','Mikronesien','42184858','Berlin'),
   ('Enver','Kauzlarić',NULL,'opalic@example.com','(04858) 586376','Kanada','42184858','Poreč'),
   ('Olga','Adler',NULL,'annetteliebelt@example.com','04193 334829','Turks- und Caicosinseln','42184858','Spremberg'),
   ('Dominik','Vidović',NULL,'ivajuretic@example.net','092 8515 620','Russische Föderation','42184858','Bad Kreuznach'),
   ('Mohammad','Majstorović',NULL,'thanelgerti@example.org','+49(0) 073849884','Niger','42184858','Hammelburg');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Ljiljana','Schäfer',NULL,'igor28@example.org','0950502432','Malediven','42184858','Bogen'),
   ('Jadranka','Gunpf',NULL,'antoinetteloechel@example.net','(00375) 13803','Britische Jungferninseln','42184858','Vukovar'),
   ('Ivka','Ullmann',NULL,'sanja54@example.net','098 1964 511','Philippinen','42184858','Sangerhausen'),
   ('Gordana','Jagečić',NULL,'ikolega@example.com','09383 017809','Čile','42184858','Zadar'),
   ('Hanno','Blümel',NULL,'hvukusic@example.net','01 0963 327','St. Barthélemy','42184858','Freital'),
   ('Patrik','Jagečić',NULL,'dragicatudic@example.net','+49(0)3781 042300','Kazakstan','42184858','Wernigerode'),
   ('Zdravko','Johann',NULL,'zbeckmann@example.com','034 486 654','Ujedinjeni Arapski Emirati','42184858','Auerbach'),
   ('Fernando','Salz',NULL,'katakolic@example.org','+49(0)1400 999014','Färöer','42184858','Säckingen'),
   ('Alex','Hölzenbecher',NULL,'albina79@example.net','033 392 062','Sv. Lucija','42184858','Petrinja'),
   ('Teresa','Etzler',NULL,'bernhard12@example.com','020 436 335','Tokelau','42184858','Supetar');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Gerta','Maraš',NULL,'matija37@example.net','(04314) 22773','Sonderverwaltungszone Hongkong','42184858','Opuzen'),
   ('Felicia','Henck',NULL,'markoorlovic@example.com','097 7803 715','Samoa','42184858','Glina'),
   ('Laura','Heintze',NULL,'toni62@example.com','049 690 364','Russische Föderation','42184858','Perleberg'),
   ('Fedor','Hoffmann',NULL,'rholt@example.net','095 6818 852','São Tomé und Príncipe','42184858','Poreč'),
   ('Priska','Piljek',NULL,'gordana37@example.net','(09163) 551903','Zypern','42184858','Dugo Selo'),
   ('Karl-Wilhelm','Bloch',NULL,'bucanacdarko@example.net','074 613 144','Sonderverwaltungszone Macao','42184858','Riesa'),
   ('Ilija','Gredičak',NULL,'marin29@example.com','05029 597953','Uzbekistan','42184858','Crikvenica'),
   ('Pero','Martin',NULL,'klaus-werner17@example.org','022 782 049','Alandski otoci','42184858','Ochsenfurt'),
   ('Nicolaus','Schleich',NULL,'simarafuma@example.org','023 101 311','Bulgarien','42184858','Crikvenica'),
   ('Suzana','Piljek',NULL,'steficajagecic@example.org','042 274 557','Malezija','42184858','Havelberg');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Katarina','Horvatek',NULL,'ssalz@example.org','032 006 352','Turska','42184858','Pirmasens'),
   ('Michail','Krebs',NULL,'alfstumpf@example.com','04701 87608','Singapur','42184858','Gunzenhausen'),
   ('Zvonko','Štefanec',NULL,'tilmannbauer@example.com','020 148 178','Sirija','42184858','Ebermannstadt'),
   ('Danijel','Kostolzin',NULL,'matejabaljak@example.com','+49(0)0369 383107','Honduras','42184858','Vilsbiburg'),
   ('Patrik','Zimmer',NULL,'kerekovicdragica@example.org','021 874 701','Französisch-Polynesien','42184858','Amberg'),
   ('Hakan','Gligora',NULL,'steymiroslav@example.com','06212081793','Vereinigte Arabische Emirate','42184858','Rathenow'),
   ('Pero','Križan',NULL,'jgroettner@example.org','+49(0)9637 467584','Kokosovi Otoci','42184858','Krapina'),
   ('Nikša','Bošnjaković',NULL,'trubinortwin@example.net','051 120 030','Ägypten','42184858','Luckau'),
   ('Folkert','Junken',NULL,'qbauer@example.com','+49(0)0436910395','Bugarska','42184858','Sigmaringen'),
   ('Nikolaj','Kreusel',NULL,'eberthsemra@example.com','042 101 846','Gvajana','42184858','Sveta Nedelja');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Gordana','Kallert',NULL,'karlovicdanijel@example.net','034 270 981','Sonderverwaltungszone Macao','42184858','Aachen'),
   ('Ante','Tudić',NULL,'snjezanaplese@example.org','00599472256','Saudijska Arabija','42184858','Warendorf'),
   ('Gerald','Hermighausen',NULL,'vlasicdjuro@example.org','040 131 936','São Tomé und Príncipe','42184858','Pinneberg'),
   ('Dušan','Juncken',NULL,'ingo38@example.org','+49(0)1863 308000','Spanien','42184858','Sternberg'),
   ('Hanspeter','Sedlar',NULL,'aleksejsaeuberlich@example.com','+49 (0) 9026 124867','Tadschikistan','42184858','Wolfratshausen'),
   ('Sara','Legović',NULL,'oterzic@example.org','+49(0) 769127150','St. Barthélemy','42184858','Varaždin'),
   ('Eckard','Döring',NULL,'damir07@example.net','(04052) 80363','Mauricijus','42184858','Rudolstadt'),
   ('Šime','Babić',NULL,'natali27@example.net','+49(0)4023 65832','Liberija','42184858','Wesel'),
   ('Käthe','Steckel',NULL,'adrian15@example.org','+49(0)2606794637','Kiribati','42184858','Nova Gradiška'),
   ('Barbara','Brlek',NULL,'jaehnjonathan@example.net','+49 (0) 8493 932232','Saudijska Arabija','42184858','Karlovac');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Jozo','Andrijašević',NULL,'gerta16@example.net','051 303 367','Litauen','42184858','Bjelovar'),
   ('Ruža','Boucsein',NULL,'joachim82@example.com','06133274819','Philippinen','42184858','Mali Lošinj'),
   ('Mara','Tomić',NULL,'katerinamitschke@example.org','+49(0)8462800539','Brasilien','42184858','Klanjec'),
   ('Veit','Trub',NULL,'zeljka19@example.org','074 852 674','Filipini','42184858','Đurđevac'),
   ('Vesna','Božanić',NULL,'hnohlmans@example.net','+49(0) 824792308','Liberia','42184858','Marienberg'),
   ('Mesut','Karz',NULL,'sasa95@example.org','(00900) 427995','Sjeverni Marijanski Otoci','42184858','Kamenz'),
   ('Marijana','Alković',NULL,'damir21@example.com','+49(0)6266682987','Mali','42184858','Trogir'),
   ('Marica','Žugec',NULL,'elisabetladeck@example.org','033 713 273','Tunis','42184858','Calau'),
   ('Ignaz','Schottin',NULL,'zoravukman@example.com','+49(0)3908408968','Luxemburg','42184858','Schweinfurt'),
   ('Stavros','Paffrath',NULL,'sanjavuk@example.org','091 8238 691','Französisch-Guayana','42184858','Eisenberg');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Hans-Jochen','Mihelčić',NULL,'lidijazupanic@example.com','+49(0)8298 460606','Paraguay','42184858','Kutjevo'),
   ('Mladen','Horak',NULL,'stolledward@example.net','+49(0)1283436710','Schweiz','42184858','Ludwigslust'),
   ('Milka','Marasović',NULL,'kelecicjele@example.net','048 786 972','Španjolska','42184858','Rovinj'),
   ('Lana','Cvetković',NULL,'nikolinamatesa@example.com','053 585 263','Tanzanija','42184858','Miltenberg'),
   ('Ante','Dussen van',NULL,'anicichana@example.com','022 107 116','Namibia','42184858','Neu-Ulm'),
   ('Ivica','Brezjan',NULL,'henschelbayram@example.net','040 065 083','Kiribati','42184858','Worbis'),
   ('Jana','Šalić',NULL,'alwinekitzmann@example.org','033 515 338','Kasachstan','42184858','Lepoglava'),
   ('Susana','Kusch',NULL,'mzorbach@example.net','097 9453 517','Obala Slonovače','42184858','Čakovec'),
   ('Mira','Maloča',NULL,'diedrich84@example.net','00866 748653','Kuba','42184858','Hersbruck'),
   ('Joana','Seip',NULL,'nina58@example.com','(06142) 934616','Ägypten','42184858','Kastav');
INSERT INTO warehouse_management.customer (first_name,last_name,shipping_address_id,email,phone,country,zip,city) VALUES
   ('Anton','Urlić',NULL,'ymilas@example.net','049 781 728','Kuba','42184858','Bad Liebenwerda'),
   ('Jakov','Siering',NULL,'genovevamangold@example.org','098 2884 905','Puerto Rico','42184858','Lipik'),
   ('Sandra','Vučetić',NULL,'tomislav26@example.org','(02074) 60100','Japan','42184858','Garešnica'),
   ('Katherina','Jäntsch',NULL,'nhornig@example.com','022 364 393','Kaimaninseln','42184858','Rathenow'),
   ('Guntram','Šokčević',NULL,'seideleditha@example.org','097 3422 975','Tajvan','42184858','Slavonski Brod');
INSERT INTO warehouse_management.customer_order (cart_id,customer_id,shipping_address_id,order_date,status,warehouse_id) VALUES
   (1,2,2,'2024-05-05 12:03:42','PROCESSING',1),
   (2,2,2,'2024-05-11 00:31:02','PROCESSING',11),
   (3,3,4,'2024-05-11 00:31:02','PROCESSING',10),
   (4,4,5,'2024-05-11 00:31:02','PROCESSING',9),
   (5,5,6,'2024-05-11 00:31:02','SHIPPED',2),
   (6,6,7,'2024-05-11 00:31:02','PROCESSING',11),
   (7,2,2,'2024-05-11 00:33:01','PROCESSING',12),
   (8,3,4,'2024-05-11 00:33:01','PROCESSING',12),
   (9,4,5,'2024-05-11 00:33:01','PROCESSING',10),
   (10,5,6,'2024-05-11 00:33:01','PROCESSING',3);
INSERT INTO warehouse_management.customer_order (cart_id,customer_id,shipping_address_id,order_date,status,warehouse_id) VALUES
   (11,6,7,'2024-05-11 00:33:01','PROCESSING',12);
INSERT INTO warehouse_management.product (name,description,category_id,code) VALUES
   ('Product Name','Product Description',1,'Product Code'),
   ('Apple iPhone 13','Apple iPhone 13 with 128GB Storage',1,'P1'),
   ('Samsung Galaxy S21','Samsung Galaxy S21 with 128GB Storage',1,'P2'),
   ('Dell XPS 15','Dell XPS 15 Laptop with Intel i7',2,'P3'),
   ('MacBook Pro','Apple MacBook Pro with M1 Chip',2,'P4'),
   ('Sony WH-1000XM4','Sony WH-1000XM4 Wireless Noise-Cancelling Headphones',3,'P5'),
   ('Bose QuietComfort 35 II','Bose QuietComfort 35 II Wireless Bluetooth Headphones',3,'P6'),
   ('Instant Pot Duo','Instant Pot Duo 7-in-1 Electric Pressure Cooker',4,'P7'),
   ('Ninja Professional Countertop Blender','Ninja Professional Countertop Blender with 1100-Watt Base',4,'P8'),
   ('Kindle Paperwhite','Kindle Paperwhite – Now Waterproof with 2x the Storage',5,'P9');
INSERT INTO warehouse_management.product (name,description,category_id,code) VALUES
   ('Fire TV Stick 4K','Fire TV Stick 4K streaming device with Alexa Voice Remote',5,'P10'),
   ('PlayStation 5 Console','PlayStation 5 Console',6,'P11'),
   ('Xbox Series X','Xbox Series X',6,'P12'),
   ('LEGO Star Wars: The Mandalorian The Razor Crest','LEGO Star Wars: The Mandalorian The Razor Crest Building Kit',7,'P13'),
   ('Monopoly Classic Game','Monopoly Classic Game',7,'P14'),
   ('Fitbit Charge 4','Fitbit Charge 4 Fitness and Activity Tracker',8,'P15'),
   ('Garmin Forerunner 245','Garmin Forerunner 245, GPS Running Smartwatch',8,'P16'),
   ('The Alchemist','The Alchemist, Paperback – Deckle Edge',9,'P17'),
   ('Becoming','Becoming by Michelle Obama, Hardcover',9,'P18'),
   ('CeraVe Moisturizing Cream','CeraVe Moisturizing Cream for Normal to Dry Skin',10,'P19');
INSERT INTO warehouse_management.product (name,description,category_id,code) VALUES
   ('Neutrogena Hydro Boost Hyaluronic Acid Hydrating Water Gel','Neutrogena Hydro Boost Hyaluronic Acid Hydrating Water Gel Daily Face Moisturizer',10,'P20'),
   ('Tide PODS Laundry Detergent Liquid Pacs','Tide PODS Laundry Detergent Liquid Pacs, Clean Breeze Scent',11,'P21'),
   ('Bounty Quick-Size Paper Towels','Bounty Quick-Size Paper Towels, White, 12 Family Rolls',11,'P22'),
   ('Philips Sonicare ProtectiveClean 6100 Rechargeable Electric Toothbrush','Philips Sonicare ProtectiveClean 6100 Rechargeable Electric Toothbrush, White',12,'P23'),
   ('Oral-B Pro 1000 CrossAction Electric Toothbrush','Oral-B Pro 1000 CrossAction Electric Toothbrush, Black',12,'P24'),
   ('Fujifilm X-T4 Mirrorless Camera','Fujifilm X-T4 Mirrorless Camera Body - Black',13,'P25'),
   ('Canon EOS R6 Full-Frame Mirrorless Camera','Canon EOS R6 Full-Frame Mirrorless Camera with 4K Video',13,'P26'),
   ('KitchenAid Artisan Series 5-Qt. Stand Mixer','KitchenAid Artisan Series 5-Qt. Stand Mixer with Pouring Shield - Empire Red',14,'P27'),
   ('Cuisinart DFP-14BCNY 14-Cup Food Processor','Cuisinart DFP-14BCNY 14-Cup Food Processor, Brushed Stainless Steel - Silver',14,'P28'),
   ('Philips Hue White and Color Ambiance LED Smart Light Bulb Starter Kit','Philips Hue White and Color Ambiance LED Smart Light Bulb Starter Kit',15,'P29');
INSERT INTO warehouse_management.product (name,description,category_id,code) VALUES
   ('Nest Learning Thermostat','Nest Learning Thermostat, 3rd Gen, Smart Thermostat, Stainless Steel',15,'P30'),
   ('LG OLED TV','LG OLED TV with AI ThinQ',16,'P31'),
   ('Samsung QLED TV','Samsung QLED 4K UHD Smart TV',16,'P32'),
   ('Sony Bravia TV','Sony Bravia OLED 4K UHD Smart TV',16,'P33'),
   ('Vizio P-Series TV','Vizio P-Series Quantum X 4K HDR Smart TV',16,'P34'),
   ('TCL 6-Series TV','TCL 6-Series 4K UHD Dolby Vision HDR QLED Roku Smart TV',16,'P35');
INSERT INTO warehouse_management.product_to_product_trait (product_id,product_trait_id) VALUES
   (2,1);
INSERT INTO warehouse_management.product_trait (weight_kg,dimensions_mm,consumer_product,fragile) VALUES
   (1.5,'150x100x50',1,0),
   (2.3,'200x150x100',1,1),
   (0.5,'100x100x100',0,0),
   (3.0,'300x200x150',1,0),
   (1.2,'150x150x150',0,1),
   (2.5,'250x200x150',1,0),
   (0.3,'30x30x30',0,1),
   (4.0,'400x300x200',1,1),
   (0.8,'80x80x80',0,0),
   (1.7,'170x130x90',1,1);
INSERT INTO warehouse_management.product_trait (weight_kg,dimensions_mm,consumer_product,fragile) VALUES
   (2.9,'290x210x140',0,0),
   (0.6,'60x60x60',1,1),
   (3.5,'350x250x200',0,1),
   (1.0,'100x100x100',1,0),
   (2.0,'200x150x100',0,1),
   (0.4,'40x40x40',1,1),
   (3.2,'320x230x150',0,0),
   (1.6,'160x120x80',1,1),
   (2.8,'280x200x130',0,1),
   (0.7,'70x70x70',1,0);
INSERT INTO warehouse_management.product_trait (weight_kg,dimensions_mm,consumer_product,fragile) VALUES
   (3.7,'370x270x180',0,1),
   (1.3,'130x100x70',1,1),
   (2.6,'260x190x120',0,0),
   (0.2,'20x20x20',1,1),
   (3.4,'340x240x160',0,1),
   (1.8,'180x140x90',1,0),
   (2.7,'270x200x130',0,1),
   (0.9,'90x90x90',1,1),
   (3.6,'360x260x170',0,0),
   (1.4,'140x110x70',1,1);
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('123 Main St','New York','NY','10001','USA'),
   ('123 Main St','New York','NY','10001','USA'),
   ('123 Main St','New York','NY','10001','USA'),
   ('123 Main St','New York','NY','10001','USA'),
   ('Avenue Street 1','Sofia','Sofia','437184','Bulgaria'),
   ('Cooney Village 32','Zagreb','Zagreb','10000','Croatia'),
   ('City Street 51','Maribor','Maribor','10321','Slovenia'),
   ('988 Watkins Well
Angelahaven, PA 90821','North Rhonda','Oklahoma','75799','Aruba'),
   ('69295 Gibbs Divide Suite 938
East Jason, OH 79045','Port Ann','South Carolina','14226','Mauritius'),
   ('4886 Spence Trail Apt. 970
Port Marcburgh, DC 96621','Melaniestad','Minnesota','38778','Mongolia');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('2165 Mercedes Rapids Suite 292
East Robertview, NY 42983','Harriston','Louisiana','86223','Chile'),
   ('2384 Pacheco Lane
Taylorfurt, AL 76470','Port Tracibury','Utah','03577','San Marino'),
   ('USS Bridges
FPO AA 97227','East Jason','Washington','83467','Eritrea'),
   ('6024 Carter Springs Apt. 234
Elizabethfort, MT 72484','East Steven','Alaska','24917','Gabon'),
   ('717 Mary Pines
Mitchellland, RI 06971','Alexanderside','North Dakota','13006','Central African Republic'),
   ('78768 Michelle Meadows
South Christina, AK 39494','Lake Amychester','Michigan','35612','Sierra Leone'),
   ('7232 William Islands
Brianburgh, TX 92289','Lake Kelly','Rhode Island','80763','Guinea'),
   ('7883 Joseph Springs Apt. 741
Doyletown, MD 59305','Lake Valerietown','Delaware','48780','Yemen'),
   ('USNV Miller
FPO AE 12093','Parkershire','Massachusetts','23749','Azerbaijan'),
   ('43337 Adams Path Apt. 895
Port Jacqueline, MO 14363','Jeremyburgh','West Virginia','07409','Libyan Arab Jamahiriya');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('2011 Kenneth Isle
South Jamesville, MH 85165','Thomasfort','Colorado','77503','Honduras'),
   ('29460 Lisa Skyway
Port Courtneyburgh, PA 97663','Port David','Alabama','01749','Cocos (Keeling) Islands'),
   ('91183 Fischer Forges
Shellyberg, MA 03199','Parkermouth','Wisconsin','73173','Malta'),
   ('5632 Martinez Wells Apt. 487
East Natalieport, VI 59084','Mayerland','Oklahoma','04653','Timor-Leste'),
   ('215 Duncan Summit
Lake Richardport, RI 28498','Anneburgh','Alabama','14775','Djibouti'),
   ('1148 Sierra Trail
West Nathan, CA 36672','East Christinaland','South Dakota','90121','Guinea-Bissau'),
   ('4319 Alvarez Burgs
Lake William, WY 75000','Adrianberg','West Virginia','16163','Antarctica (the territory South of 60 deg S)'),
   ('9594 Duran Lodge
Fernandezstad, AK 66947','Port Dustinmouth','Montana','96384','Ireland'),
   ('91391 Williams Creek Apt. 093
Colemanport, PA 89500','Garciaport','North Carolina','51588','Uruguay'),
   ('50629 Jose Landing Apt. 612
New Carlos, PW 82936','Lake Lindsay','Colorado','68016','Grenada');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('58740 Dwayne Meadow Apt. 955
Adamfort, HI 74710','Lake Stephanie','South Dakota','26364','British Indian Ocean Territory (Chagos Archipelago)'),
   ('630 Kelly Hollow Apt. 295
Ianview, AL 24730','Bradleytown','Illinois','97849','Swaziland'),
   ('Unit 0252 Box 9885
DPO AA 91722','East Cole','Tennessee','13793','Qatar'),
   ('722 Stephenson Orchard Suite 373
Lake Kara, IL 23346','New Christopherfort','Arizona','65803','Slovenia'),
   ('Unit 2245 Box 4355
DPO AA 74515','New Richardport','Virginia','97639','Tanzania'),
   ('62607 Nolan Viaduct
Trevinoborough, NM 61800','West Allisonfurt','Ohio','05147','Antigua and Barbuda'),
   ('055 Dennis Streets Suite 755
Gonzalezfort, OH 60136','New Andrewland','Florida','67215','Egypt'),
   ('1204 Allison Radial Suite 432
Turnerton, MT 86671','Robinborough','Florida','40475','Ireland'),
   ('USCGC Juarez
FPO AA 86491','New Teresaville','Virginia','40323','Ghana'),
   ('2684 Guerra Harbors
Sweeneytown, MT 75201','North Dorothybury','Maryland','70097','Cyprus');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('74271 Melinda Street Suite 192
Port Lauren, AS 24824','Kiddberg','Missouri','87470','Antigua and Barbuda'),
   ('PSC 4769, Box 4949
APO AA 21736','Cohenshire','Nebraska','61356','Sweden'),
   ('93196 Kevin Greens
South Mollybury, OH 05675','Matthewfurt','Alabama','99310','Niger'),
   ('807 Graham Fords
East Taylor, IA 15528','North Jessicafurt','Iowa','99722','Malta'),
   ('00121 Jones Wall
Alyssachester, TX 35660','Simsborough','New Hampshire','34078','Tonga'),
   ('560 Washington Courts Suite 837
Joshuachester, MT 15903','South Jennaview','New Mexico','50286','Singapore'),
   ('Unit 4511 Box 1408
DPO AA 18116','Alexanderfort','Utah','38091','Kenya'),
   ('PSC 1104, Box 1250
APO AE 24730','North Tammy','Massachusetts','80863','Tunisia'),
   ('Unit 8803 Box 3480
DPO AE 76304','Wolfebury','Kansas','34129','Bahamas'),
   ('5992 Daniel Port Suite 232
Katiefurt, NJ 21782','Brandonmouth','Oregon','04308','Malta');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('33208 Paul Creek
North Markstad, AR 66524','Lisahaven','New York','49983','Saint Lucia'),
   ('649 Anderson Court Suite 302
Maryhaven, MN 01731','Christyville','Utah','59901','Micronesia'),
   ('7655 Jennifer Underpass
New Robertfort, MI 73947','Lake John','Wyoming','41978','United States Minor Outlying Islands'),
   ('66159 Megan Hollow Apt. 861
Patriciamouth, NY 88838','Mclaughlinville','Maine','55875','Venezuela'),
   ('016 April Courts Apt. 216
Mcguireville, HI 48831','Kelseyborough','West Virginia','66997','Liberia'),
   ('PSC 5669, Box 3395
APO AE 99606','Anthonyside','Wyoming','26554','Panama'),
   ('539 Bradley Turnpike Apt. 708
Angelhaven, NY 40542','Lisafurt','Georgia','72859','El Salvador'),
   ('Jurišićeva 57
65871 Duga Resa','Valpovo','Šibensko-kninska','90976','Finska'),
   ('Kraljevečki odvojak 83
24631 Senj','Klanjec','Krapinsko-zagorska','90976','Sv. Vincent i Grenadini'),
   ('Goljak 7
20305 Garešnica','Metković','Thüringen','90976','Slowakei');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('Mlinarska 9c
16622 Supetar','Duga Resa','Sisačko-moslavačka','90976','Malawi'),
   ('Srebrnjak 418
22113 Umag','Soest','Rheinland-Pfalz','90976','Sv. Vincent i Grenadini'),
   ('Girschnerweg 910
08283 Burgdorf','Dinslaken','Dubrovačko-neretvanska','90976','Nepal'),
   ('Svibovac 28
25743 Sinj','Pag','Baden-Württemberg','90976','Kongo'),
   ('Mlinske 4a
95730 Belišće','Ravensburg','Bremen','90976','Ungarn'),
   ('Heydrichring 0/9
10514 Ilmenau','Naila','Sisačko-moslavačka','90976','Šri Lanka'),
   ('Krokerstraße 4/7
45340 Bad Freienwalde','Hofgeismar','Saarland','90976','Sv. Vincent i Grenadini'),
   ('Zamenhofova 1a
29285 Makarska','Augsburg','Zadarska','90976','Mikronesien'),
   ('Löwerstraße 270
60420 Oranienburg','Bakar','Virovitičko-podravska','90976','Somalia'),
   ('Herrmanngasse 545
16301 Gotha','Split','Saarland','90976','Mauricijus');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('Orlovac 9a
63228 Bjelovar','Krk','Krapinsko-zagorska','90976','Sveti Martin'),
   ('Stephan-Mitschke-Ring 6
17066 Dachau','Ingolstadt','Primorsko-goranska','90976','Kamerun'),
   ('Hesseallee 6
72942 Teterow','Buje','Bayern','90976','Tokelau'),
   ('Schmiedtring 5/1
45034 Monschau','Đurđevac','Varaždinska','90976','Nordmazedonien'),
   ('Kabusweg 1
03155 Ueckermünde','Trogir','Hamburg','90976','Antarktis'),
   ('Mihaljevac 8a
76076 Oroslavje','Nauen','Varaždinska','90976','Dänemark'),
   ('Täscheweg 7
22919 Guben','Samobor','Niedersachsen','90976','Curacao'),
   ('Šilobodov put 5a
38164 Velika Gorica','Sveti Ivan Zelina','Bremen','90976','Aserbaidschan'),
   ('Zamenhofova 9c
96726 Delnice','Witzenhausen','Zagrebačka','90976','Salamunovi Otoci'),
   ('Dvoranski prečac 2b
48625 Čakovec','Bad Liebenwerda','Saarland','90976','Nauru');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('Martinstr. 4
96630 Lichtenfels','Melsungen','Zadarska','90976','Otok Heard i Otoci McDonald'),
   ('Male 2a/3
89655 Đurđevac','Nova Gradiška','Dubrovačko-neretvanska','90976','Kambodscha'),
   ('Justine-Plath-Platz 065
28348 Naila','Lüdinghausen','Niedersachsen','90976','Gambia'),
   ('H.-Dieter-Stadelmann-Weg 06
58998 Emmendingen','Finsterwalde','Berlin','90976','Martinique'),
   ('Saban-Rogner-Straße 766
10410 Ahaus','München','Krapinsko-zagorska','90976','Kuba'),
   ('Dvoranski prečac 3b
70471 Bakar','Crikvenica','Istarska','90976','Mali'),
   ('Perivoj biskupa Stjepana II. 3b
52191 Ivanec','Vodnjan','Dubrovačko-neretvanska','90976','Wallis und Futuna'),
   ('Gradec 1a
59850 Senj','Amberg','Istarska','90976','Eritrea'),
   ('Etzoldallee 34
98652 Bad Mergentheim','Cuxhaven','Saarland','90976','Južni Sudan'),
   ('Lissi-Hertrampf-Weg 0/3
38876 Saulgau','Ogulin','Šibensko-kninska','90976','Gambija');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('Višnjičke 6a
84906 Dugo Selo','Mühldorf am Inn','Sachsen-Anhalt','90976','Zapadna Sahara'),
   ('Jagodnjak 202
30781 Jastrebarsko','Đakovo','Sachsen-Anhalt','90976','Bangladesch'),
   ('Strossmayerovo šetalište 7a
64281 Novi Marof','Büsingen am Hochrhein','Saarland','90976','Vereinigtes Königreich'),
   ('Nadeschda-Fechner-Platz 7/5
52228 Bautzen','Vrlika','Virovitičko-podravska','90976','Deutschland'),
   ('Zamenhofove 0a/2
51728 Velika Gorica','Eberswalde','Primorsko-goranska','90976','Vietnam'),
   ('Alf-Benthin-Straße 6
28232 Lüdenscheid','Oroslavje','Ličko-senjska','90976','Honduras'),
   ('Hans-Christian-Rudolph-Weg 47
85945 Wittstock','Miesbach','Požeško-slavonska','90976','Swasiland'),
   ('Hansjoachim-Riehl-Ring 0
45679 Eichstätt','Jastrebarsko','Brodsko-posavska','90976','Serbien'),
   ('Paffrathplatz 1/9
60886 Rehau','Daruvar','Bayern','90976','Demokratische Volksrepublik Korea'),
   ('Kaptol 3b/6
25407 Kutjevo','Iserlohn','Krapinsko-zagorska','90976','Tuvalu');
INSERT INTO warehouse_management.shipping_address (address,city,state,zip,country) VALUES
   ('Franca-Trub-Gasse 1/7
21196 Ansbach','Hrvatska Kostajnica','Požeško-slavonska','90976','Spanien'),
   ('Medveščak 3b/4
98765 Čabar','Amberg','Brodsko-posavska','90976','Libyen'),
   ('Zamenhofove 799
20282 Rovinj','Varaždin','Niedersachsen','90976','Maršalovi Otoci'),
   ('Kamenita 28
64251 Buje','Bremervörde','Sachsen-Anhalt','90976','Amerikanisch-Ozeanien'),
   ('Eberthgasse 7/2
89536 Wernigerode','Tecklenburg','Sachsen','90976','Gambia'),
   ('Mihaljevac 4a/1
11931 Jastrebarsko','Prenzlau','Niedersachsen','90976','Kiribati'),
   ('Bučarova 2c
82043 Klanjec','Vechta','Ličko-senjska','90976','Frankreich');
INSERT INTO warehouse_management.warehouse (name,address,city,state,zip,country,phone,email,totalCapacity) VALUES
   ('Warehouse Name','Warehouse Address','Warehouse City','Warehouse State','Warehouse Zip','Warehouse Country','Warehouse Phone','Warehouse Email',100),
   ('UK_London','123 Main St','London','England','E1 6AN','UK','123-456-7890','warehouse1@example.com',1000),
   ('France_Paris','456 Market St','Paris','Ile-de-France','75001','France','234-567-8901','warehouse2@example.com',2000),
   ('Germany_Berlin','789 Broadway','Berlin','Berlin','10115','Germany','345-678-9012','warehouse3@example.com',3000),
   ('Spain_Madrid','321 State St','Madrid','Madrid','28001','Spain','456-789-0123','warehouse4@example.com',4000),
   ('Italy_Rome','654 Elm St','Rome','Lazio','00118','Italy','567-890-1234','warehouse5@example.com',5000),
   ('Netherlands_Amsterdam','987 Pine St','Amsterdam','North Holland','1011','Netherlands','678-901-2345','warehouse6@example.com',6000),
   ('Belgium_Brussels','147 Oak St','Brussels','Brussels','1000','Belgium','789-012-3456','warehouse7@example.com',7000),
   ('Sweden_Stockholm','258 Maple St','Stockholm','Stockholm','111 21','Sweden','890-123-4567','warehouse8@example.com',8000),
   ('Poland_Warsaw','369 Cedar St','Warsaw','Masovian','00-001','Poland','901-234-5678','warehouse9@example.com',9000);
INSERT INTO warehouse_management.warehouse (name,address,city,state,zip,country,phone,email,totalCapacity) VALUES
   ('Portugal_Lisbon','741 Spruce St','Lisbon','Lisbon','1100-061','Portugal','012-345-6789','warehouse10@example.com',10000),
   ('Croatia_Zagreb','Radnicka 25','Zagreb','Croatia','10000','Croatia','123-456-7899','warehouse11@example.com',2000);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,23,2),
   (1,24,2),
   (1,25,2),
   (1,26,2),
   (1,27,2),
   (1,28,2),
   (1,29,2),
   (1,30,2),
   (1,31,2),
   (1,32,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,33,2),
   (1,34,2),
   (1,35,2),
   (1,36,2),
   (1,37,2),
   (1,38,2),
   (1,43,2),
   (1,48,2),
   (1,53,2),
   (1,58,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,63,2),
   (1,68,2),
   (1,73,2),
   (1,78,2),
   (1,83,2),
   (1,88,2),
   (1,93,2),
   (1,98,2),
   (1,103,2),
   (1,108,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,113,2),
   (1,124,2),
   (1,135,2),
   (1,146,2),
   (1,157,2),
   (1,168,2),
   (1,179,2),
   (1,190,2),
   (1,201,2),
   (1,212,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,223,2),
   (1,234,2),
   (1,245,2),
   (1,256,2),
   (1,267,2),
   (2,39,2),
   (2,44,2),
   (2,49,2),
   (2,54,2),
   (2,59,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (2,64,2),
   (2,69,2),
   (2,74,2),
   (2,79,2),
   (2,84,2),
   (2,89,2),
   (2,94,2),
   (2,99,2),
   (2,104,2),
   (2,109,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (2,114,2),
   (2,125,2),
   (2,136,2),
   (2,147,2),
   (2,158,2),
   (2,169,2),
   (2,180,2),
   (2,191,2),
   (2,202,2),
   (2,213,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (2,224,2),
   (2,235,2),
   (2,246,2),
   (2,257,2),
   (2,268,2),
   (3,115,2),
   (3,126,2),
   (3,137,2),
   (3,148,2),
   (3,159,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (3,170,2),
   (3,181,2),
   (3,192,2),
   (3,203,2),
   (3,214,2),
   (3,225,2),
   (3,236,2),
   (3,247,2),
   (3,258,2),
   (3,269,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (4,40,2),
   (4,45,2),
   (4,50,2),
   (4,55,2),
   (4,60,2),
   (4,65,2),
   (4,70,2),
   (4,75,2),
   (4,80,2),
   (4,85,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (4,90,2),
   (4,95,2),
   (4,100,2),
   (4,105,2),
   (4,110,2),
   (4,116,2),
   (4,127,2),
   (4,138,2),
   (4,149,2),
   (4,160,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (4,171,2),
   (4,182,2),
   (4,193,2),
   (4,204,2),
   (4,215,2),
   (4,226,2),
   (4,237,2),
   (4,248,2),
   (4,259,2),
   (4,270,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (5,117,2),
   (5,128,2),
   (5,139,2),
   (5,150,2),
   (5,161,2),
   (5,172,2),
   (5,183,2),
   (5,194,2),
   (5,205,2),
   (5,216,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (5,227,2),
   (5,238,2),
   (5,249,2),
   (5,260,2),
   (5,271,2),
   (7,41,2),
   (7,46,2),
   (7,51,2),
   (7,56,2),
   (7,61,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (7,66,2),
   (7,71,2),
   (7,76,2),
   (7,81,2),
   (7,86,2),
   (7,91,2),
   (7,96,2),
   (7,101,2),
   (7,106,2),
   (7,111,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (7,118,2),
   (7,129,2),
   (7,140,2),
   (7,151,2),
   (7,162,2),
   (7,173,2),
   (7,184,2),
   (7,195,2),
   (7,206,2),
   (7,217,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (7,228,2),
   (7,239,2),
   (7,250,2),
   (7,261,2),
   (7,272,2),
   (8,42,2),
   (8,47,2),
   (8,52,2),
   (8,57,2),
   (8,62,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (8,67,2),
   (8,72,2),
   (8,77,2),
   (8,82,2),
   (8,87,2),
   (8,92,2),
   (8,97,2),
   (8,102,2),
   (8,107,2),
   (8,112,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (8,119,2),
   (8,130,2),
   (8,141,2),
   (8,152,2),
   (8,163,2),
   (8,174,2),
   (8,185,2),
   (8,196,2),
   (8,207,2),
   (8,218,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (8,229,2),
   (8,240,2),
   (8,251,2),
   (8,262,2),
   (8,273,2),
   (9,120,2),
   (9,131,2),
   (9,142,2),
   (9,153,2),
   (9,164,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (9,175,2),
   (9,186,2),
   (9,197,2),
   (9,208,2),
   (9,219,2),
   (9,230,2),
   (9,241,2),
   (9,252,2),
   (9,263,2),
   (9,274,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (10,121,2),
   (10,132,2),
   (10,143,2),
   (10,154,2),
   (10,165,2),
   (10,176,2),
   (10,187,2),
   (10,198,2),
   (10,209,2),
   (10,220,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (10,231,2),
   (10,242,2),
   (10,253,2),
   (10,264,2),
   (10,275,2),
   (11,122,2),
   (11,133,2),
   (11,144,2),
   (11,155,2),
   (11,166,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (11,177,2),
   (11,188,2),
   (11,199,2),
   (11,210,2),
   (11,221,2),
   (11,232,2),
   (11,243,2),
   (11,254,2),
   (11,265,2),
   (11,276,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (12,123,2),
   (12,134,2),
   (12,145,2),
   (12,156,2),
   (12,167,2),
   (12,178,2),
   (12,189,2),
   (12,200,2),
   (12,211,2),
   (12,222,2);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (12,233,2),
   (12,244,2),
   (12,255,2),
   (12,266,2),
   (12,277,2),
   (1,279,33),
   (1,290,33),
   (1,301,33),
   (1,312,33),
   (1,323,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (1,334,33),
   (1,345,33),
   (1,356,33),
   (1,367,33),
   (1,378,33),
   (1,389,33),
   (1,400,33),
   (1,411,33),
   (1,422,33),
   (1,433,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (2,280,33),
   (2,291,33),
   (2,302,33),
   (2,313,33),
   (2,324,33),
   (2,335,33),
   (2,346,33),
   (2,357,33),
   (2,368,33),
   (2,379,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (2,390,33),
   (2,401,33),
   (2,412,33),
   (2,423,33),
   (2,434,33),
   (3,281,33),
   (3,292,33),
   (3,303,33),
   (3,314,33),
   (3,325,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (3,336,33),
   (3,347,33),
   (3,358,33),
   (3,369,33),
   (3,380,33),
   (3,391,33),
   (3,402,33),
   (3,413,33),
   (3,424,33),
   (3,435,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (4,282,33),
   (4,293,33),
   (4,304,33),
   (4,315,33),
   (4,326,33),
   (4,337,33),
   (4,348,33),
   (4,359,33),
   (4,370,33),
   (4,381,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (4,392,33),
   (4,403,33),
   (4,414,33),
   (4,425,33),
   (4,436,33),
   (5,283,33),
   (5,294,33),
   (5,305,33),
   (5,316,33),
   (5,327,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (5,338,33),
   (5,349,33),
   (5,360,33),
   (5,371,33),
   (5,382,33),
   (5,393,33),
   (5,404,33),
   (5,415,33),
   (5,426,33),
   (5,437,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (7,284,33),
   (7,295,33),
   (7,306,33),
   (7,317,33),
   (7,328,33),
   (7,339,33),
   (7,350,33),
   (7,361,33),
   (7,372,33),
   (7,383,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (7,394,33),
   (7,405,33),
   (7,416,33),
   (7,427,33),
   (7,438,33),
   (8,285,33),
   (8,296,33),
   (8,307,33),
   (8,318,33),
   (8,329,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (8,340,33),
   (8,351,33),
   (8,362,33),
   (8,373,33),
   (8,384,33),
   (8,395,33),
   (8,406,33),
   (8,417,33),
   (8,428,33),
   (8,439,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (9,286,33),
   (9,297,33),
   (9,308,33),
   (9,319,33),
   (9,330,33),
   (9,341,33),
   (9,352,33),
   (9,363,33),
   (9,374,33),
   (9,385,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (9,396,33),
   (9,407,33),
   (9,418,33),
   (9,429,33),
   (9,440,33),
   (10,287,33),
   (10,298,33),
   (10,309,33),
   (10,320,33),
   (10,331,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (10,342,33),
   (10,353,33),
   (10,364,33),
   (10,375,33),
   (10,386,33),
   (10,397,33),
   (10,408,33),
   (10,419,33),
   (10,430,33),
   (10,441,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (11,288,33),
   (11,299,33),
   (11,310,33),
   (11,321,33),
   (11,332,33),
   (11,343,33),
   (11,354,33),
   (11,365,33),
   (11,376,33),
   (11,387,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (11,398,33),
   (11,409,33),
   (11,420,33),
   (11,431,33),
   (11,442,33),
   (12,289,33),
   (12,300,33),
   (12,311,33),
   (12,322,33),
   (12,333,33);
INSERT INTO warehouse_management.warehouse_inventory (warehouse_id,article_id,product_id) VALUES
   (12,344,33),
   (12,355,33),
   (12,366,33),
   (12,377,33),
   (12,388,33),
   (12,399,33),
   (12,410,33),
   (12,421,33),
   (12,432,33),
   (12,443,33);




-- Views

CREATE VIEW customer_order_view AS
SELECT c.first_name, c.last_name, o.order_date, o.status, s.address, w.name AS warehouse_name, w.address AS warehouse_address
FROM customer_order o
         JOIN customer c ON o.customer_id = c.id
         JOIN shipping_address s ON o.shipping_address_id = s.id
         JOIN warehouse w ON o.warehouse_id = w.id;


CREATE VIEW customer_order_status_shipped AS
SELECT id,order_date, status, warehouse_id
FROM customer_order
WHERE status = "SHIPPED";


CREATE VIEW customer_to_shipping_address AS
SELECT c.first_name, c.last_name, c.phone, c.country, s.address
FROM customer c
         JOIN shipping_address s
              ON c.shipping_address_id = s.id;


CREATE VIEW customers_from_croatia AS
SELECT first_name, last_name
FROM customer
WHERE country = "Croatia";


CREATE VIEW total_product_inventory AS
SELECT product_id, COUNT(*) as total_quantity
FROM warehouse_inventory
GROUP BY product_id;


CREATE VIEW cart_details AS
SELECT c.id as cart_id, a.name as article_name, a.code as article_code, a.variant as article_variant
FROM cart_item ci
         JOIN article a ON ci.article_id = a.id
         JOIN cart c ON ci.cart_id = c.id;


CREATE VIEW cart_value AS
SELECT ci.cart_id, SUM(a.price) as total_value
FROM cart_item ci
         JOIN article a ON ci.article_id = a.id
GROUP BY ci.cart_id;


CREATE VIEW customer_orders AS
SELECT co.id as order_id, cu.first_name, cu.last_name, co.order_date, co.status
FROM customer_order co
         JOIN customer cu ON co.customer_id = cu.id;


CREATE VIEW warehouse_article_count AS
SELECT warehouse_id, COUNT(*) as total_articles
FROM warehouse_inventory
GROUP BY warehouse_id;


CREATE VIEW `processed_order_count_by_warehouse` AS
SELECT w.id AS warehouse_id, w.name AS warehouse_name, COUNT(o.id) AS total_orders_processed
FROM `warehouse` w
         LEFT JOIN `customer_order` o ON w.id = o.warehouse_id
GROUP BY w.id, w.name
ORDER BY total_orders_processed DESC;
