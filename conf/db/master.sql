
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
