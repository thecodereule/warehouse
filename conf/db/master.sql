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
