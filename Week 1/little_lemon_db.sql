-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer_Details` (
  `customer_id` INT NOT NULL,
  `customer_names` VARCHAR(50) NOT NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(50) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `booking_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE INDEX `booking_id_UNIQUE` (`booking_id` ASC) VISIBLE,
  INDEX `customer_id_bookings_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_bookings`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDM`.`Customer_Details` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`MenuItems` (
  `menu_items_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  `cusine` VARCHAR(15) NOT NULL,
  `starters` VARCHAR(45) NULL,
  `courses` VARCHAR(45) NULL,
  `drinks` VARCHAR(45) NULL,
  `desserts` VARCHAR(45) NULL,
  `cost` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`menu_items_id`),
  UNIQUE INDEX `menu_items_id_UNIQUE` (`menu_items_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  `total_cost` DECIMAL(8,2) NOT NULL DEFAULT 0.0,
  `menu_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  PRIMARY KEY (`order_id`),
  INDEX `menu_id_order_idx` (`menu_id` ASC) VISIBLE,
  INDEX `customer_id_order_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `menu_id_order`
    FOREIGN KEY (`menu_id`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`menu_items_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_order`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDM`.`Customer_Details` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Order_Delivery_Status` (
  `delivery_id` INT NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `delivery_status` VARCHAR(10) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `oder_id_delivery_idx` (`order_id` ASC) INVISIBLE,
  UNIQUE INDEX `delivery_id_UNIQUE` (`delivery_id` ASC) VISIBLE,
  CONSTRAINT `oder_id_delivery`
    FOREIGN KEY (`order_id`)
    REFERENCES `LittleLemonDM`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff_Info` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
