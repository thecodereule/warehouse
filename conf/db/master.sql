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
