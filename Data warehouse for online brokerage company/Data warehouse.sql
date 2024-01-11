-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab1test_s4682748
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab1test_s4682748
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab1test_s4682748` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab1test_s4682748` ;

-- -----------------------------------------------------
-- Table `lab1test_s4682748`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1test_s4682748`.`customer` (
  `AccountID` INT NOT NULL,
  `AccountName` VARCHAR(15) NOT NULL,
  `ActivitySegment` INT NOT NULL,
  `ProfitablilityScore` INT NOT NULL,
  `CommissionRate` DECIMAL(5,0) NOT NULL,
  PRIMARY KEY (`AccountID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab1test_s4682748`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1test_s4682748`.`stock` (
  `SecurityID` INT NOT NULL,
  `SecurityName` VARCHAR(30) NOT NULL,
  `PricePerUnit` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`SecurityID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab1test_s4682748`.`trades_fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1test_s4682748`.`trades_fact` (
  `TradeID` INT NOT NULL,
  `TradeDate` DATE NOT NULL,
  `AccountID` INT NOT NULL,
  `SecurityID` INT NOT NULL,
  `TradeType` CHAR(10) NOT NULL,
  `TradeVolume` INT NOT NULL,
  PRIMARY KEY (`TradeID`),
  INDEX `AccountID` (`AccountID` ASC) VISIBLE,
  INDEX `SecurityID` (`SecurityID` ASC) VISIBLE,
  CONSTRAINT `trades_fact_ibfk_1`
    FOREIGN KEY (`AccountID`)
    REFERENCES `lab1test_s4682748`.`customer` (`AccountID`),
  CONSTRAINT `trades_fact_ibfk_2`
    FOREIGN KEY (`SecurityID`)
    REFERENCES `lab1test_s4682748`.`stock` (`SecurityID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
