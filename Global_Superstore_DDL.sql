SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- use DDL script to create (empty) tables for the Global_Superstore_Relational schema 

CREATE SCHEMA IF NOT EXISTS `Global_Superstore_Relational` DEFAULT CHARACTER SET latin1 ;
USE `Global_Superstore_Relational` ;

CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_first_name` VARCHAR(45) NOT NULL,
  `customer_middle_name` VARCHAR(45) DEFAULT NULL,
  `customer_last_name` VARCHAR(45) NOT NULL,
  `segment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`product` (
  `product_key` INT NOT NULL AUTO_INCREMENT,
  `product_id` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `sub_category` VARCHAR(45) DEFAULT NULL,
  `product_name` TEXT NOT NULL,
  PRIMARY KEY (`product_key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`market` (
  `market_id` INT NOT NULL AUTO_INCREMENT,
  `market_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`market_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  `market_id` INT NOT NULL,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `fk_country_market` FOREIGN KEY (`market_id`)
        REFERENCES `Global_Superstore_Relational`.`market` (`market_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`state` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`state_id`),
  CONSTRAINT `fk_state_country` FOREIGN KEY (`country_id`)
        REFERENCES `Global_Superstore_Relational`.`country` (`country_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  `postal_code` INT NOT NULL DEFAULT 0,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  CONSTRAINT `fk_address_state` FOREIGN KEY (`state_id`)
        REFERENCES `Global_Superstore_Relational`.`state` (`state_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`order` (
  `order_key` INT NOT NULL AUTO_INCREMENT,
  `order_id` VARCHAR(45) NOT NULL,
  `order_date` DATE NOT NULL,
  `ship_date` DATE NOT NULL,
  `ship_mode` VARCHAR(45) NOT NULL,
  `order_priority` VARCHAR(45) NOT NULL,
  `customer_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`order_key`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`)
        REFERENCES `Global_Superstore_Relational`.`customer` (`customer_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address_id`)
        REFERENCES `Global_Superstore_Relational`.`address` (`address_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
        )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `Global_Superstore_Relational`.`sales` (
  `sales_id` INT NOT NULL AUTO_INCREMENT,
  `sales` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `discount` DOUBLE NOT NULL DEFAULT 0,
  `profit` DOUBLE NOT NULL,
  `shipping_cost` DOUBLE NOT NULL,
  `order_key` INT NOT NULL,
  `product_key` INT NOT NULL,
  CONSTRAINT `fk_sales_product` FOREIGN KEY (`product_key`)
        REFERENCES `Global_Superstore_Relational`.`product` (`product_key`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order` FOREIGN KEY (`order_key`)
        REFERENCES `Global_Superstore_Relational`.`order` (`order_key`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY (`sales_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `sales_product_id` ON `Global_Superstore_Relational`.`product` (`product_key` ASC);
CREATE INDEX `sales_order_id` ON `Global_Superstore_Relational`.`order` (`order_id` ASC);
CREATE INDEX `address_state_id` ON `Global_Superstore_Relational`.`state` (`state_id` ASC);
CREATE INDEX `state_country_id` ON `Global_Superstore_Relational`.`country` (`country_id` ASC);
CREATE INDEX `country_market_id` ON `Global_Superstore_Relational`.`market` (`market_id` ASC);



# CREATE TABLE IF NOT EXISTS `Global_Superstore_Snowflake`.`address` (
#   `address_id` INT NOT NULL AUTO_INCREMENT,
#   `city_name` VARCHAR(45) NOT NULL,
#   `postal_code` INT DEFAULT NULL,
#   `state_name` VARCHAR(45) NOT NULL,
#   `country_name` VARCHAR(45) NOT NULL,
#   `market_name` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`address_id`))
# ENGINE = InnoDB
# DEFAULT CHARACTER SET = latin1;