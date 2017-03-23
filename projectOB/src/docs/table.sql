
/* Drop Tables */

DROP TABLE BEDTIME CASCADE CONSTRAINTS;
DROP TABLE DR_OP CASCADE CONSTRAINTS;
DROP TABLE Exercise CASCADE CONSTRAINTS;
DROP TABLE Meal CASCADE CONSTRAINTS;
DROP TABLE Daily CASCADE CONSTRAINTS;
DROP TABLE SENSORLOG CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE NURSE CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;

/* sequence */



/*room data*/

insert into room values('101',4,0,1);
insert into room values('102',4,0,1);
insert into room values('103',4,0,1);
insert into room values('104',4,0,1);
insert into room values('105',4,0,1);
insert into room values('201',6,0,1);
insert into room values('202',6,0,1);
insert into room values('203',6,0,1);
insert into room values('204',6,0,1);
insert into room values('205',6,0,1);
insert into room values('301',8,0,1);
insert into room values('302',8,0,1);
insert into room values('303',8,0,1);
insert into room values('304',8,0,1);
insert into room values('305',8,0,1);
insert into room values('401',2,0,1);
insert into room values('402',2,0,1);
insert into room values('403',2,0,1);
insert into room values('404',2,0,1);
insert into room values('405',2,0,1);

NURSE_NO number,
	CERT_NO varchar2(20) NOT NULL UNIQUE,
	ID varchar2(13) NOT NULL UNIQUE,
	PASSWORD varchar2(15) NOT NULL,
	NAME varchar2(51) NOT NULL,
	PHONE varchar2(13) NOT NULL,
	ORIGINALPHOTO varchar2(200) NOT NULL,
	SAVEDPHOTO varchar2(200),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date DEFAULT SYSDATE,
	DELETEDATE date DEFAULT SYSDATE,
	DELETEFLAG number NOT NULL,
	PRIMARY KEY (NURSE_NO)

insert into nurse values(2,'222-222','2','2','간호사이름','010-7777-7777','간호사사진','간호사또사진',sysdate,sysdate,sysdate,1);
insert into patient values(1,2,'INS_NO','이름','생일','병명','폰번호','주소','사진','또사진','101','aaaaa','1','1','1','1',sysdate,sysdate,sysdate,1);


/* Create Tables */

CREATE TABLE BEDTIME
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TIME date,
	DELETEDATE date NOT NULL
);


CREATE TABLE Daily
(
	PT_NO number NOT NULL UNIQUE,
	TODAY date DEFAULT SYSDATE NOT NULL UNIQUE,
	CLEANING date,
	WASH date,
	SHOWER date,
	REPORT varchar2(300),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date,
	DELETEDATE date DEFAULT SYSDATE,
	DELETEFLAG number,
	PRIMARY KEY (PT_NO, TODAY)
);


CREATE TABLE DR_OP
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TEXT varchar2(300),
	DELETEFLAG number
);


CREATE TABLE Exercise
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TEXT varchar2(100),
	DELETEDATE date NOT NULL
);


CREATE TABLE Meal
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	BREAKFAST varchar2(150),
	LUNCH varchar2(150),
	DINNER varchar2(150),
	SNACK varchar2(50),
	DELETEFLAG number NOT NULL
);

DROP TABLE ADMIN;

CREATE TABLE ADMIN(
	ID varchar2(5) NOT NULL primary key,
	PASSWORD varchar2(5) NOT NULL
);



INSERT INTO ADMIN values('admin', 'admin');


CREATE TABLE NURSE
(
	NURSE_NO number,
	CERT_NO varchar2(20) NOT NULL UNIQUE,
	ID varchar2(13) NOT NULL UNIQUE,
	PASSWORD varchar2(15) NOT NULL,
	NAME varchar2(51) NOT NULL,
	PHONE varchar2(13) NOT NULL,
	ORIGINALPHOTO varchar2(200) NOT NULL,
	SAVEDPHOTO varchar2(200),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date DEFAULT SYSDATE,
	DELETEDATE date DEFAULT SYSDATE,
	DELETEFLAG number NOT NULL,
	PRIMARY KEY (NURSE_NO)
);



CREATE TABLE PATIENT
(
	PT_NO number,
	NURSE_NO number NOT NULL UNIQUE,
	INS_NO varchar2(20) NOT NULL UNIQUE,
	NAME varchar2(51) NOT NULL,
	BIRTHDATE varchar2(10) NOT NULL,
	DESEASE varchar2(200),
	PHONE varchar2(13),
	ADDRESS varchar2(100),
	ORIGINALPHOTO varchar2(200) NOT NULL,
	SAVEDPHOTO varchar2(200) NOT NULL,
	ROOM_NO varchar2(5) NOT NULL UNIQUE,
	PPT_ID varchar2(13) UNIQUE,
	PPT_PW varchar2(15),
	PPT_NAME varchar2(51),
	PPT_PHONE varchar2(13),
	PPT_ADD varchar2(100),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date DEFAULT SYSDATE,
	DELETEDATE date DEFAULT SYSDATE,
	DELETEFLAG number NOT NULL,
	PRIMARY KEY (PT_NO)
);


CREATE TABLE ROOM
(
	ROOM_NO varchar2(5),
	MAXIMUM number NOT NULL,
	PRESENT number NOT NULL,
	DELETEFLAG number NOT NULL,
	PRIMARY KEY (ROOM_NO)
);


CREATE TABLE SENSORLOG
(
	PT_NO number NOT NULL,
	TIME date NOT NULL,
	TEXT varchar2(100) NOT NULL,
	GRADE number NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE BEDTIME
	ADD FOREIGN KEY (PT_NO, TODAY)
	REFERENCES Daily (PT_NO, TODAY)
;


ALTER TABLE DR_OP
	ADD FOREIGN KEY (PT_NO, TODAY)
	REFERENCES Daily (PT_NO, TODAY)
;


ALTER TABLE Exercise
	ADD FOREIGN KEY (PT_NO, TODAY)
	REFERENCES Daily (PT_NO, TODAY)
;


ALTER TABLE Meal
	ADD FOREIGN KEY (PT_NO, TODAY)
	REFERENCES Daily (PT_NO, TODAY)
;


ALTER TABLE PATIENT
	ADD FOREIGN KEY (NURSE_NO)
	REFERENCES NURSE (NURSE_NO)
;


ALTER TABLE Daily
	ADD FOREIGN KEY (PT_NO)
	REFERENCES PATIENT (PT_NO)
;


ALTER TABLE SENSORLOG
	ADD FOREIGN KEY (PT_NO)
	REFERENCES PATIENT (PT_NO)
;


ALTER TABLE PATIENT
	ADD FOREIGN KEY (ROOM_NO)
	REFERENCES ROOM (ROOM_NO)
;




