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
    `category_id` INT,
    `product_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`)
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
