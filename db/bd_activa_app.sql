CREATE TABLE `student` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
	`first_surname` varchar(30) NOT NULL,
	`second_surname` varchar(30),
	`email_personal` varchar(60) NOT NULL,
	`email_activa` varchar(60) NOT NULL,
	`phone_number` varchar(14) NOT NULL,
	`avatar` blob,
	`cv` blob,
	`descrtiption` TEXT(500),
	`zip_code` varchar(5) NOT NULL,
	`id_user` INT NOT NULL,
	`prom` INT NOT NULL,
	`activa_points_balance` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `soft_skill` (
	`id` INT NOT NULL,
	`name` varchar(30) NOT NULL,
	`id_student` INT(30) NOT NULL
);

CREATE TABLE `job` (
	`name` varchar(40) NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	`company` varchar(50),
	`start_date` DATE,
	`finish_date` DATE,
	`description` TEXT(100) NOT NULL,
	`current_work` BOOLEAN NOT NULL,
	`id_student` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `activa_work` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`description` TEXT(500) NOT NULL,
	`resume` blob,
	PRIMARY KEY (`id`)
);

CREATE TABLE `activa_work_student_rel` (
	`id_student` INT NOT NULL,
	`id_work` INT NOT NULL,
	`xp_points` INT,
	`feedback` TEXT(1000),
	PRIMARY KEY (`id_student`,`id_work`)
);

CREATE TABLE `tech_skill` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(15) NOT NULL,
	`max_xp_points` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `activa_work_tech_skill_rel` (
	`id_work` INT NOT NULL,
	`id_tech_skill` INT NOT NULL,
	PRIMARY KEY (`id_work`,`id_tech_skill`)
);

CREATE TABLE `training` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(40) NOT NULL,
	`center` varchar(50) NOT NULL,
	`start_date` DATE,
	`finish_date` DATE,
	`description` varchar(100) NOT NULL,
	`duration` INT NOT NULL,
	`regulated` BOOLEAN NOT NULL,
	`id_student` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`email` varchar(100) NOT NULL UNIQUE,
	`password` varchar(30) NOT NULL,
	`role` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `reward` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_user_sender` INT NOT NULL,
	`id_user_rewarded` INT NOT NULL,
	`xp_points` INT NOT NULL,
	`date` DATE NOT NULL,
	`description` varchar(150) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `student` ADD CONSTRAINT `student_fk0` FOREIGN KEY (`id_user`) REFERENCES `user`(`id`);

ALTER TABLE `soft_skill` ADD CONSTRAINT `soft_skill_fk0` FOREIGN KEY (`id_student`) REFERENCES `student`(`id`);

ALTER TABLE `job` ADD CONSTRAINT `job_fk0` FOREIGN KEY (`id_student`) REFERENCES `student`(`id`);

ALTER TABLE `activa_work_student_rel` ADD CONSTRAINT `activa_work_student_rel_fk0` FOREIGN KEY (`id_student`) REFERENCES `student`(`id`);

ALTER TABLE `activa_work_student_rel` ADD CONSTRAINT `activa_work_student_rel_fk1` FOREIGN KEY (`id_work`) REFERENCES `activa_work`(`id`);

ALTER TABLE `activa_work_tech_skill_rel` ADD CONSTRAINT `activa_work_tech_skill_rel_fk0` FOREIGN KEY (`id_work`) REFERENCES `activa_work`(`id`);

ALTER TABLE `activa_work_tech_skill_rel` ADD CONSTRAINT `activa_work_tech_skill_rel_fk1` FOREIGN KEY (`id_tech_skill`) REFERENCES `tech_skill`(`id`);

ALTER TABLE `training` ADD CONSTRAINT `training_fk0` FOREIGN KEY (`id_student`) REFERENCES `student`(`id`);

ALTER TABLE `reward` ADD CONSTRAINT `reward_fk0` FOREIGN KEY (`id_user_sender`) REFERENCES `user`(`id`);

ALTER TABLE `reward` ADD CONSTRAINT `reward_fk1` FOREIGN KEY (`id_user_rewarded`) REFERENCES `user`(`id`);











