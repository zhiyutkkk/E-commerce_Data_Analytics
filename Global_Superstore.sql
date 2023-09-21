SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sakila_snowflake
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `global_superstore` DEFAULT CHARACTER SET latin1 ;
USE `global_superstore` ;


CREATE TABLE IF NOT EXISTS `global_superstore`.`import` (
  `Row_ID` INT NOT NULL,
  `Order_ID` VARCHAR(45) NOT NULL,
  `Order_Date` DATE NOT NULL,
  `Ship_Date` DATE NOT NULL,
  `Ship_Mode` VARCHAR(45) NOT NULL,
  `Customer_ID` VARCHAR(45) NOT NULL,
  `Customer_First_Name` VARCHAR(45) NOT NULL,
  `Customer_Middle_Name` VARCHAR(45) ,
  `Customer_Last_Name` VARCHAR(45) NOT NULL,
  `Segment` VARCHAR(45)  NULL,
  `City` VARCHAR(45) NOT NULL ,
  `State` VARCHAR(45) NOT NULL ,
  `Country` VARCHAR(45) NOT NULL,
  `Postal_code` INT DEFAULT 0,
  `Market` VARCHAR(45) NOT NULL,
  `Region` VARCHAR(45) NOT NULL,
  `Product_ID` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Sub_Category` VARCHAR(45),
  `Product_Name` TEXT NOT NULL,
  `Sales` DOUBLE NOT NULL,
  `Quantity` INT NOT NULL,
  `Discount` DOUBLE NOT NULL,
  `Profit` DOUBLE NOT NULL,
  `Shipping_Cost` DOUBLE NOT NULL,
  `Order_Priority` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`Row_ID`)
        )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;




