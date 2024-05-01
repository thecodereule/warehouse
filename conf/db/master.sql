USE `warehouse_management`;


CREATE TABLE `product`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `code` VARCHAR(255),
    `description` VARCHAR(255),
    `category_id`INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`)
);

CREATE TABLE `article`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `code` VARCHAR(255),
    `variant` VARCHAR(255),
    `description` VARCHAR(255),
    `price` DOUBLE,
    `category_id` INT,
    `product_id` INT,
    `warehouse_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`),
    FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse`(`id`)
);

CREATE TABLE `category`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `description` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `product_trait`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `product_product_trait`(
    `product_id` INT,
    `product_trait_id` INT,
    PRIMARY KEY (`product_id`, `product_trait_id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`),
    FOREIGN KEY (`product_trait_id`) REFERENCES `product_trait`(`id`)
);

CREATE TABLE `warehouse`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `address` VARCHAR(255),
    `city` VARCHAR(255),
    `state` VARCHAR(255),
    `zip` VARCHAR(255),
    `country` VARCHAR(255),
    `phone` VARCHAR(255),
    `email` VARCHAR(255),
    `totalCapacity` INT,
    `availableCapacity` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `customer`(
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `shipping_address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255),
    `zip` VARCHAR(255),
    `city` VARCHAR(255),
    PRIMARY KEY (`id`)
)ENGINE=InnoDB;

ALTER TABLE `customer`
    ADD CONSTRAINT `fk_customer_shipping_address`
        FOREIGN KEY (`shipping_address`) REFERENCES `shipping_address`(`address`);


CREATE TABLE `shipping_address`(
   `id` INT AUTO_INCREMENT,
   `address` VARCHAR(255) NOT NULL,
   `city` VARCHAR(255) NOT NULL,
   `state` VARCHAR(255) NOT NULL,
   `zip` VARCHAR(255) NOT NULL,
   `country` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `shipping_address`
    ADD INDEX `idx_shipping_address` (`address`);

CREATE TABLE `customer_order`(
    `id` INT AUTO_INCREMENT,
    `cart_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `shipping_address` VARCHAR(255) NOT NULL,
    `order_date` DATETIME NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `warehouse_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`cart_id`) REFERENCES `cart`(`id`),
    FOREIGN KEY (`shipping_address`) REFERENCES `shipping_address` (`address`),
    FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
)ENGINE=InnoDB;

ALTER TABLE `customer_order`
    ADD CONSTRAINT `fk_customer_order_cart`
        FOREIGN KEY (`cart_id`) REFERENCES `cart`(`id`),
    ADD CONSTRAINT `fk_customer_order_customer`
        FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`),
    ADD CONSTRAINT `fk_customer_order_shipping_address`
        FOREIGN KEY (`shipping_address`) REFERENCES `shipping_address` (`address`),
    ADD CONSTRAINT `fk_customer_order_warehouse`
        FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`);

CREATE TABLE `cart_item`(
    `id` INT AUTO_INCREMENT,
    `cart_id` INT,
    `article_id` INT,
    `quantity` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
    FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
);


CREATE TABLE `cart`(
    `id` INT AUTO_INCREMENT PRIMARY KEY
)ENGINE=InnoDB;
