-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema speedwagon
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`member` (
  `id` VARCHAR(30) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userrole` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`board` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT(2200) NULL DEFAULT NULL,
  `writer` VARCHAR(100) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnt` INT NOT NULL DEFAULT 0,
  `like` VARCHAR(45) NOT NULL,
  `category` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`num`),
  INDEX `fk_board_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`like` (
  `hit` INT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`member_id`, `board_num`),
  INDEX `fk_like_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_like_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_like_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `mydb`.`board` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article` (
  `id` INT NOT NULL,
  `member_m_id` VARCHAR(30) NOT NULL,
  `content` TEXT(300) NULL DEFAULT NULL,
  `board_board_num` INT NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_article_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `mydb`.`board` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`art_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`art_like` (
  `id` INT NOT NULL,
  `like` INT NULL,
  `article_id` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`, `article_id`, `member_id`),
  INDEX `fk_art_like_article1_idx` (`article_id` ASC) VISIBLE,
  INDEX `fk_art_like_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_art_like_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_art_like_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `name` VARCHAR(45) NULL,
  `part` VARCHAR(45) NULL,
  `member_m_id` VARCHAR(30) NOT NULL,
  CONSTRAINT `fk_role_member1`
    FOREIGN KEY (`member_m_id`)
    REFERENCES `mydb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cartegory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cartegory` (
  `id` INT NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cartegory_board1_idx` (`board_num` ASC) VISIBLE,
  CONSTRAINT `fk_cartegory_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `mydb`.`board` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.` interest` (
  `id` INT NOT NULL,
  `cartegory_id` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ interest_cartegory1_idx` (`cartegory_id` ASC) VISIBLE,
  INDEX `fk_ interest_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_ interest_cartegory1`
    FOREIGN KEY (`cartegory_id`)
    REFERENCES `mydb`.`cartegory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ interest_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
