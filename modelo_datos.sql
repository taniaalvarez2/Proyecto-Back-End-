-- MySQL Workbench Synchronization
-- Generated: 2023-10-27 13:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: HP

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `mydb`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `mydb`.`Users` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `mydb`.`Feed Back` (
  `idFeed Back` INT(11) NOT NULL,
  `User CC qualified` INT(11) NULL DEFAULT NULL,
  `Score` INT(11) NULL DEFAULT NULL,
  `Coment` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFeed Back`),
  INDEX `CC_idx` (`User CC qualified` ASC) VISIBLE,
  CONSTRAINT `CC`
    FOREIGN KEY (`User CC qualified`)
    REFERENCES `mydb`.`Users` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Skills` (
  `idSkills` INT(11) NOT NULL,
  `Skill Name` VARCHAR(45) NULL DEFAULT NULL,
  `CC` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idSkills`),
  INDEX `CC_idx` (`CC` ASC) VISIBLE,
  CONSTRAINT `CC`
    FOREIGN KEY (`CC`)
    REFERENCES `mydb`.`Users` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Transactions` (
  `idTransactions` INT(11) NOT NULL,
  `idPots` INT(11) NULL DEFAULT NULL,
  `CC Shopper - offer` INT(11) NULL DEFAULT NULL,
  `Amount` VARCHAR(45) NULL DEFAULT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Offer` VARCHAR(2) NULL DEFAULT NULL,
  `Buy` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`idTransactions`),
  INDEX `idJobs_idx` (`idPots` ASC) VISIBLE,
  INDEX `CC shopper_idx` (`CC Shopper - offer` ASC) VISIBLE,
  CONSTRAINT `idPost`
    FOREIGN KEY (`idPots`)
    REFERENCES `mydb`.`Post` (`idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CC shopper`
    FOREIGN KEY (`CC Shopper - offer`)
    REFERENCES `mydb`.`Users` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `idPost` INT(11) NOT NULL,
  `CC` INT(11) NULL DEFAULT NULL,
  `Post name` VARCHAR(45) NULL DEFAULT NULL,
  `idSkills` INT(11) NULL DEFAULT NULL,
  `Price per hour` DECIMAL(1) NULL DEFAULT NULL,
  `Description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  INDEX `CC_idx` (`CC` ASC) VISIBLE,
  INDEX `idskills_idx` (`idSkills` ASC) INVISIBLE,
  CONSTRAINT `CCpost`
    FOREIGN KEY (`CC`)
    REFERENCES `mydb`.`Users` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idskills`
    FOREIGN KEY (`idSkills`)
    REFERENCES `mydb`.`Skills` (`idSkills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


