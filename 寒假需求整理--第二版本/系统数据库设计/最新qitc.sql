CREATE DATABASE qitc;

USE qitc;

CREATE TABLE t_admin (
		u_id CHAR(8) NOT NULL PRIMARY KEY,
		PASSWORD VARCHAR(40)
);

CREATE TABLE t_alarm(
	alarm_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	countries VARCHAR(20),
	mechanism VARCHAR(40),
	rel_date DATE,
	enterprise VARCHAR(40),
	brand VARCHAR(50),
	origin VARCHAR(40),
	description VARCHAR(1000),
	reject_des VARCHAR(40),
	measures VARCHAR(10),
	category VARCHAR(40),
	mbrsort VARCHAR(40),
	document VARCHAR(150),
	editor VARCHAR(60),
	category_id CHAR(2)
);

CREATE TABLE t_mbr(
	mbr_id INT(7) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cas_id VARCHAR(100),
	mbr_cname VARCHAR(50),
	mbr_ename VARCHAR(120)
);

CREATE TABLE t_product(
	p_id INT(7) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	p_name VARCHAR(50),
	p_category VARCHAR(50)
);

CREATE TABLE t_sta(
	sta_id INT(7) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	m_id VARCHAR(30),
	m_name VARCHAR(50),
	sta_class VARCHAR(20),
	rel_date DATETIME,
	imp_date DATETIME,
	dra_unit VARCHAR(150),
	sta_state VARCHAR(15),
	principle VARCHAR(150),
	document VARCHAR(150),
	met_profile VARCHAR(150),
	category_id CHAR(2)
);

CREATE TABLE t_slink(
	sta_id INT(7),
	mbr_id INT(7),
	p_id INT(7),
	line VARCHAR(40),
	unit VARCHAR(50),
	PRIMARY KEY(sta_id,mbr_id,p_id),
	FOREIGN KEY(sta_id) REFERENCES t_sta(sta_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(mbr_id) REFERENCES t_mbr(mbr_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES t_product(p_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE t_bounds(
	b_id INT(7) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	b_name VARCHAR(50),
	effect_date DATE,
	residue VARCHAR(100),
	e_residue VARCHAR(140),
	limited VARCHAR(40),
	limited_unit VARCHAR(10),
	mea_site VARCHAR(50),
	mbr_id INT(7),
	p_id INT(7),
	category_id CHAR(2),
	FOREIGN KEY(mbr_id) REFERENCES t_mbr(mbr_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES t_product(p_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE t_bslink(
	b_id INT(7),
	sta_id INT(7),
	is_consult TINYINT DEFAULT 0, 
	PRIMARY KEY(b_id,sta_id),
  FOREIGN KEY(b_id) REFERENCES t_bounds(b_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY(sta_id) REFERENCES t_sta(sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE t_laws(
	laws_id CHAR(10) NOT NULL PRIMARY KEY,
	proof VARCHAR(50),
	laws_name VARCHAR(60),
	countries VARCHAR(30),
	department VARCHAR(50),
	rel_date DATE,
	act_date DATE,
	laws_state VARCHAR(30),
	document VARCHAR(150),
	category_id CHAR(2)
);

CREATE TABLE t_laboratory(
	lab_id VARCHAR(8) NOT NULL PRIMARY KEY,
	lab_name VARCHAR(60),
	address VARCHAR(63),
	functionary VARCHAR(40),
	contact VARCHAR(40)
);

CREATE TABLE t_apt(
	apt_id INT(7) NOT NULL AUTO_INCREMENT,
	lab_id VARCHAR(8),
	mbr_name VARCHAR(50),
	serial_id VARCHAR(30),
	limit_scope VARCHAR(30),
	explaination VARCHAR(200),
	aptutide VARCHAR(40),
	project_id VARCHAR(40),
	mbr_id INT(7),
	demain_code VARCHAR(70),
	p_id INT(7),
	sta_id INT(7),
	PRIMARY KEY(apt_id,lab_id),
	FOREIGN KEY(lab_id) REFERENCES t_laboratory(lab_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(mbr_id) REFERENCES t_mbr(mbr_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES t_product(p_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(sta_id) REFERENCES t_sta(sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE t_dete(
	dete_id INT(7) NOT NULL AUTO_INCREMENT,
	lab_id VARCHAR(8),
	country VARCHAR(20),
	technology VARCHAR(50),
	person VARCHAR(40),
	depart VARCHAR(40),
	mbr_workdate VARCHAR(30),
	cycle VARCHAR(40),
	charge VARCHAR(50),
	isApprove VARCHAR(20),
	subcontractor VARCHAR(50),
	sub_charge VARCHAR(50),
	sub_lab VARCHAR(40),
	mbr_stop VARCHAR(50),
	mbr_reason VARCHAR(60),
	p_id INT(7),
	mbr_id INT(7),
	sta_id INT(7),
	standby VARCHAR(30),
	PRIMARY KEY(dete_id,lab_id),
	FOREIGN KEY(lab_id) REFERENCES t_laboratory(lab_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES t_product(p_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(mbr_id) REFERENCES t_mbr(mbr_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(sta_id) REFERENCES t_sta(sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE t_typical(
	t_id INT(7) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	lab_id VARCHAR(8),
	title VARCHAR(200),
	introduction VARCHAR(1000),
	author VARCHAR(40),
	document VARCHAR(150),
	doc_date DATE,
	FOREIGN KEY(lab_id) REFERENCES t_laboratory(lab_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE t_user(
	u_id CHAR(8) NOT NULL PRIMARY KEY,
	u_name VARCHAR(30),
	sex CHAR(2),
	PASSWORD VARCHAR(40),
	email VARCHAR(25),
	phone VARCHAR(13),
	photo VARCHAR(150),
	department VARCHAR(50),
	pspb1 VARCHAR(32),
	pspb2 VARCHAR(32),
	pspb3 VARCHAR(32),
	answer1 VARCHAR(40),
	answer2 VARCHAR(40),
	answer3 VARCHAR(40)
);

CREATE TABLE t_power(
	p_id CHAR(2) NOT NULL PRIMARY KEY,
	NAME VARCHAR(15) NOT NULL
);
INSERT  INTO `t_power`(`p_id`,`NAME`) VALUES ('00','查看风险预警'),('01','管理风险预警'),('02','审核风险预警'),('10','查看标准库表'),('11','管理标准库表'),('12','审核标准库表'),('20','查看危害物限量库表'),('21','管理危害物限量库表'),('22','审核危害物限量库表'),('30','查看实验室表'),('31','管理实验室表'),('32','审核实验室'),('40','查看法律法规表'),('41','管理法律法规表'),('42','审核法律法规表'),('50','查看检测情况统计分析'),('51','管理查看检测情况统计分析'),('52','审核检测情况统计分析'),('60','查看检测能力评估'),('61','管理检测能力评估'),('62','审核检测能力评估');

CREATE TABLE t_userpower(
	u_id CHAR(8),
	p_id CHAR(2),
	PRIMARY KEY(u_id,p_id),
	FOREIGN KEY(u_id) REFERENCES t_user(u_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES t_power(p_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE t_audit(
	audit_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	u_id CHAR(8),
	audit_info VARCHAR(100),
	FOREIGN KEY(u_id) REFERENCES t_user(u_id) ON DELETE CASCADE ON UPDATE CASCADE
);

#创建操作日志表
CREATE TABLE t_operate
(
	log_id INT(8) PRIMARY KEY AUTO_INCREMENT,
	u_id CHAR(8),
	u_name VARCHAR(40),
	createtime VARCHAR(20),
	log_level VARCHAR(5),
	log_msg VARCHAR(30),
	ip_address CHAR(15)
);

CREATE INDEX alarm_index2 ON t_alarm(origin);

CREATE INDEX sta_index1 ON t_sta(m_id);
  
CREATE INDEX mbr_index1 ON t_mbr(mbr_cname,mbr_ename);

CREATE INDEX product_index1 ON t_product(p_name , p_category);
