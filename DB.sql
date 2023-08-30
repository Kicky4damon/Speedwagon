-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`board` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `writer` VARCHAR(100) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnt` INT NOT NULL DEFAULT '0',
  `like` VARCHAR(45) NOT NULL,
  `category` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`num`),
  INDEX `fk_board_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `speedwagon`.`member` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_m_id` VARCHAR(30) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_article_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `speedwagon`.`board` (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`art_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`art_like` (
  `id` INT NOT NULL,
  `like` INT NULL DEFAULT NULL,
  `article_id` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`, `article_id`, `member_id`),
  INDEX `fk_art_like_article1_idx` (`article_id` ASC) VISIBLE,
  INDEX `fk_art_like_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_art_like_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `speedwagon`.`article` (`id`),
  CONSTRAINT `fk_art_like_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `speedwagon`.`member` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`cartegory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`cartegory` (
  `id` INT NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cartegory_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_cartegory_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `speedwagon`.`board` (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`interest` (
  `id` INT NOT NULL,
  `cartegory_id` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ interest_cartegory1_idx` (`cartegory_id` ASC) VISIBLE,
  INDEX `fk_ interest_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_ interest_cartegory1`
    FOREIGN KEY (`cartegory_id`)
    REFERENCES `speedwagon`.`cartegory` (`id`),
  CONSTRAINT `fk_ interest_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `speedwagon`.`member` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`like` (
  `hit` INT NULL DEFAULT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`member_id`, `board_num`),
  INDEX `fk_like_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_like_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_like_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `speedwagon`.`board` (`num`),
  CONSTRAINT `fk_like_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `speedwagon`.`member` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `speedwagon`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speedwagon`.`role` (
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `part` VARCHAR(45) NULL DEFAULT NULL,
  `member_m_id` VARCHAR(30) NOT NULL,
  INDEX `fk_role_member1` (`member_m_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_member1`
    FOREIGN KEY (`member_m_id`)
    REFERENCES `speedwagon`.`member` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
