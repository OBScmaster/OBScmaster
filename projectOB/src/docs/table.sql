
/* 트리거 */

/*개인 정보 삭제 트리거 */
drop trigger TRG_PATIENT_DELETE;

create or replace TRIGGER TRG_PATIENT_DELETE
after UPDATE of DELETEFLAG ON PATIENT
for each row    
BEGIN   
   if :new.DELETEFLAG='N' THEN
     UPDATE DAILY set DELETEFLAG=:NEW.DELETEFLAG where DAILY.PT_NO = :old.PT_NO;
     UPDATE meal set DELETEFLAG=:NEW.DELETEFLAG where meal.PT_NO = :old.PT_NO;
     UPDATE exercise set DELETEFLAG=:NEW.DELETEFLAG where exercise.PT_NO = :old.PT_NO;
     UPDATE dr_op set DELETEFLAG=:NEW.DELETEFLAG where dr_op.PT_NO = :old.PT_NO;
     UPDATE bedtime set DELETEFLAG=:NEW.DELETEFLAG where bedtime.PT_NO = :old.PT_NO;
     end if;
 END;
 
 
 /*방정보변경 트리거 */
drop trigger TRG_PATIENT_RCH;
create or replace TRIGGER TRG_PATIENT_RCH
after UPDATE of ROOM_NO ON PATIENT
for each row    
BEGIN   
   if updating THEN
     UPDATE ROOM set PRESENT=(select present from room where room_no=:new.ROOM_NO)+1 where ROOM_NO = :new.ROOM_NO;
    UPDATE ROOM set PRESENT=(select present from room where room_no=:old.ROOM_NO)-1 where ROOM_NO = :old.ROOM_NO;
     end if;
 END;
 

/* Drop Tables */

DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE BEDTIME CASCADE CONSTRAINTS;
DROP TABLE DR_OP CASCADE CONSTRAINTS;
DROP TABLE Exercise CASCADE CONSTRAINT\S;
DROP TABLE Meal CASCADE CONSTRAINTS;
DROP TABLE Daily CASCADE CONSTRAINTS; 
DROP TABLE SENSORLOG CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE NURSE CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;

/* sequence */
 CREATE SEQUENCE PTNO_SEQ

       START WITH 1   
       INCREMENT BY 1 
     
       
 CREATE SEQUENCE NURSENO_SEQ

       START WITH 1   
       INCREMENT BY 1 
   

/* Create Tables */

CREATE TABLE BEDTIME
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TIME date,
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
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
	DELETEDATE date,
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
	PRIMARY KEY (PT_NO, TODAY)
);


CREATE TABLE DR_OP
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TEXT varchar2(300),
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);


CREATE TABLE Exercise
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	TEXT varchar2(100),
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);


CREATE TABLE Meal
(
	PT_NO number NOT NULL,
	TODAY date DEFAULT SYSDATE NOT NULL,
	BREAKFAST varchar2(150),
	LUNCH varchar2(150),
	DINNER varchar2(150),
	SNACK varchar2(50),
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL 
);

DROP TABLE ADMIN;

CREATE TABLE ADMIN(

	ID varchar2(5) NOT NULL primary key,
	PASSWORD varchar2(5) NOT NULL
);



INSERT INTO ADMIN values('admin', 'admin');


CREATE TABLE NURSE
(
	NURSE_NO number NOT NULL UNIQUE,
	CERT_NO varchar2(20) NOT NULL UNIQUE,
	ID varchar2(13) NOT NULL UNIQUE,
	PASSWORD varchar2(15) NOT NULL,
	NAME varchar2(51) NOT NULL,
	PHONE varchar2(13) NOT NULL,
	ORIGINALPHOTO varchar2(200),
	SAVEDPHOTO varchar2(200),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date,
	DELETEDATE date,
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
	PRIMARY KEY (NURSE_NO)
);



CREATE TABLE PATIENT
(
	PT_NO number NOT NULL UNIQUE,
	NURSE_NO number NOT NULL UNIQUE,
	INS_NO varchar2(20) NOT NULL UNIQUE,
	NAME varchar2(51) NOT NULL,
	BIRTHDATE varchar2(10) NOT NULL,
	DESEASE varchar2(200),
	PHONE varchar2(13),
	ADDRESS varchar2(100),
	ORIGINALPHOTO varchar2(200),
	SAVEDPHOTO varchar2(200),
	ROOM_NO varchar2(5) NOT NULL UNIQUE,
	PPT_ID varchar2(13) UNIQUE,
	PPT_PW varchar2(15),
	PPT_NAME varchar2(51),
	PPT_PHONE varchar2(13),
	PPT_ADD varchar2(100),
	INPUTDATE date DEFAULT SYSDATE NOT NULL,
	UPDATEDATE date,
	DELETEDATE date,
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
	PRIMARY KEY (PT_NO)
);


CREATE TABLE ROOM
(
	ROOM_NO varchar2(5),
	MAXIMUM number NOT NULL,
	PRESENT number NOT NULL,
	DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
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

INSERT INTO ADMIN values('admin', 'admin');

insert into nurse values(2,'222-222','2','2','간호사이름','010-7777-7777','간호사사진','간호사또사진',sysdate);

insert into patient (PT_NO,NURSE_NO,INS_NO,NAME,BIRTHDATE,DESEASE,PHONE,ADDRESS,ORIGINALPHOTO,SAVEDPHOTO,ROOM_NO,
	PPT_ID,PPT_PW,PPT_NAME,PPT_PHONE,PPT_ADD) values(1,3,'INS_NO','이름','생일','병명','폰번호','주소','사진','또사진','101','aaaaa','1','PPT_NAME','PPT_번호','PPT_주소');

insert into Nurse (NURSE_NO,CERT_NO,ID,PASSWORD,NAME,PHONE,ORIGINALPHOTO,SAVEDPHOTO,INPUTDATE,DELETEFLAG) 
values(3,'33','dum','11','dummy','010-000-3333','ORIGINALPHOTO','SAVEDPHOTO',sysdate,1)




