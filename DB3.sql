-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema speedwagon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema speedwagon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `speedwagon` DEFAULT CHARACTER SET utf8mb3 ;
USE `speedwagon` ;

-- -----------------------------------------------------
-- Table `speedwagon`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`member` (
  `id` VARCHAR(30) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userrole` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`nickname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`board` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `member_nickname` VARCHAR(20) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnt` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`, `member_nickname`),
  INDEX `fk_board_member_idx` (`member_nickname` ASC) VISIBLE,
  CONSTRAINT `fk_board_member`
    FOREIGN KEY (`member_nickname`)
    REFERENCES `speedwagon`.`member` (`nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `board_member_nickname` VARCHAR(20) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `board_num` INT NOT NULL,
  `article_like` INT NULL,
  PRIMARY KEY (`id`, `board_member_nickname`, `board_num`),
  INDEX `fk_article_board1_idx` (`board_num` ASC, `board_member_nickname` ASC) VISIBLE,
  CONSTRAINT `fk_article_board1`
    FOREIGN KEY (`board_num` , `board_member_nickname`)
    REFERENCES `speedwagon`.`board` (`num` , `member_nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`art_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`art_like` (
  `article_id` INT NOT NULL,
  `article_board_member_nickname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`article_id`, `article_board_member_nickname`),
  CONSTRAINT `fk_art_like_article1`
    FOREIGN KEY (`article_id` , `article_board_member_nickname`)
    REFERENCES `speedwagon`.`article` (`id` , `board_member_nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`board_cartegory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`board_cartegory` (
  `id` INT NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`id`, `board_num`),
  INDEX `fk_board_cartegory_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_board_cartegory_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `speedwagon`.`board` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`interest` (
  `id` INT NOT NULL,
  `member_nickname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`, `member_nickname`),
  INDEX `fk_interest_member1_idx` (`member_nickname` ASC) VISIBLE,
  CONSTRAINT `fk_interest_member1`
    FOREIGN KEY (`member_nickname`)
    REFERENCES `speedwagon`.`member` (`nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`board_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`board_like` (
  `board_num` INT NOT NULL,
  `board_member_nickname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`board_num`, `board_member_nickname`),
  CONSTRAINT `fk_board_like_board1`
    FOREIGN KEY (`board_num` , `board_member_nickname`)
    REFERENCES `speedwagon`.`board` (`num` , `member_nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`role` (
  `member_nickname` VARCHAR(20) NOT NULL,
  `part` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`member_nickname`),
  CONSTRAINT `fk_role_member1`
    FOREIGN KEY (`member_nickname`)
    REFERENCES `speedwagon`.`member` (`nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
