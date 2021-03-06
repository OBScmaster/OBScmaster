

/*개인 정보 삭제 트리거 */
drop trigger TRG_PATIENT_DATADEL;

create or replace TRIGGER TRG_PATIENT_DATADEL
after UPDATE of DELETEFLAG ON PATIENT
for each row    
BEGIN   
   if :new.DELETEFLAG='N' THEN
     UPDATE DAILYWASH set DELETEFLAG=:new.DELETEFLAG where DAILYWASH.PT_NO = :old.PT_NO;
     UPDATE DAILYSHOWER set DELETEFLAG=:new.DELETEFLAG where DAILYSHOWER.PT_NO = :old.PT_NO;
     UPDATE DAILYCLEANING set DELETEFLAG=:new.DELETEFLAG where DAILYCLEANING.PT_NO = :old.PT_NO;
     UPDATE meal set DELETEFLAG=:new.DELETEFLAG where meal.PT_NO = :old.PT_NO;
     UPDATE exercise set DELETEFLAG=:new.DELETEFLAG where exercise.PT_NO = :old.PT_NO;
     UPDATE dr_op set DELETEFLAG=:new.DELETEFLAG where dr_op.PT_NO = :old.PT_NO;
     UPDATE bedtime set DELETEFLAG=:new.DELETEFLAG where bedtime.PT_NO = :old.PT_NO;
     UPDATE special set DELETEFLAG=:new.DELETEFLAG where special.PT_NO = :old.PT_NO; 
     end if;
 END;
 
 /* 방 변경 트리거 */
create or replace TRIGGER TRG_PATIENT_RCHASDEL
after INSERT OR UPDATE OR DELETE of DELETEFLAG ON PATIENT
for each row
BEGIN   
   if inserting or updating or deleting THEN
    UPDATE ROOM set PRESENT=(select present from room where room_no=:new.ROOM_NO)+1 where ROOM_NO = :new.ROOM_NO;
    UPDATE ROOM set PRESENT=(select present from room where room_no=:old.ROOM_NO)-1 where ROOM_NO = :old.ROOM_NO;
     end if;
 END;
 
 /*방정보변경 트리거 */
drop trigger TRG_PATIENT_RCH;

create or replace TRIGGER TRG_PATIENT_RCH
after INSERT OR UPDATE OR DELETE of ROOM_NO ON PATIENT
for each row    
BEGIN   
   if inserting or updating or deleting THEN
     UPDATE ROOM set PRESENT=(select present from room where room_no=:new.ROOM_NO)+1 where ROOM_NO = :new.ROOM_NO;
    UPDATE ROOM set PRESENT=(select present from room where room_no=:old.ROOM_NO)-1 where ROOM_NO = :old.ROOM_NO;
     end if;
 END;

/* Drop Tables */

DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE BEDTIME CASCADE CONSTRAINTS;
DROP TABLE DR_OP CASCADE CONSTRAINTS;
DROP TABLE Exercise CASCADE CONSTRAINTS;
DROP TABLE Meal CASCADE CONSTRAINTS;
DROP TABLE Dailycleaning CASCADE CONSTRAINTS;
DROP TABLE Dailywash CASCADE CONSTRAINTS; 
DROP TABLE Dailyshower CASCADE CONSTRAINTS; 
DROP TABLE SENSORLOG CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE NURSE CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE SPECIAL CASCADE CONSTRAINTS;

/* sequence */
 CREATE SEQUENCE PTNO_SEQ

       START WITH 1   
       INCREMENT BY 1 
     
       
 CREATE SEQUENCE NURSENO_SEQ

       START WITH 1   
       INCREMENT BY 1 
       
 CREATE SEQUENCE MEALNO_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
  
 CREATE SEQUENCE EXERCISENO_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
 CREATE SEQUENCE DAILYCLEANINGNO_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
  CREATE SEQUENCE DAILYWASH_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
  CREATE SEQUENCE DAILYSHOWER_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
  CREATE SEQUENCE BEDTIME_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
 	CREATE SEQUENCE DR_OP_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;
 	
 CREATE SEQUENCE SPECIAL_SEQ
 
 	START WITH 1
 	INCREMENT BY 1
 	NOCACHE;

/* Create Tables */

CREATE TABLE ADMIN(
   ID varchar2(5) NOT NULL primary key,
   PASSWORD varchar2(5) NOT NULL
);

CREATE TABLE BEDTIME
(
   BEDTIME_NO number PRIMARY KEY,
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE,
   TIMETOSLEEP varchar2(10),
   TIMETOGETUP varchar2(10),
   report varchar2(30),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y'
);

INSERT INTO BEDTIME(PT_NO, TODAY, TIMETOSLEEP, TIMETOGETUP, REPORT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '13:00', '14:30', '낮잠');
INSERT INTO BEDTIME(PT_NO, TODAY, TIMETOSLEEP, TIMETOGETUP, REPORT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '22:00', '06:30', '겨울잠');

CREATE TABLE DAILYCLEANING
(
   DAILYCLEANING_NO number PRIMARY KEY,	
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   CLEANING varchar2(10),
   CLEANINGREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

TRUNCATE TABLE DAILYCLEANING;

INSERT INTO DAILYCLEANING(PT_NO, today, CLEANING, CLEANINGREPORT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '10:10', '방청소, 욕실청소');

SELECT TO_CHAR(CLEANING, 'HH24:MI') AS CLEANING, CLEANINGREPORT FROM DAILYCLEANING;

CREATE TABLE DAILYWASH
(
   DAILYWASH_NO number PRIMARY KEY,	
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   WASH varchar2(10),
   WASHREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

INSERT INTO DAILYWASH(PT_NO, today, WASH, WASHREPORT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '15:28', '속옷, 이불');

CREATE TABLE DAILYSHOWER
(
   DAILYSHOWER_NO number PRIMARY KEY,	
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   SHOWER varchar2(10),
   SHOWERREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

INSERT INTO DAILYSHOWER(PT_NO, TODAY, SHOWER, SHOWERREPORT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '21:28', '간단한 족욕');

CREATE TABLE SPECIAL
(
   SPECIAL_NO number PRIMARY KEY,
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   SREPORTTIME varchar2(10),
   SREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

INSERT INTO SPECIAL(PT_NO, SREPORTTIME, SREPORT) VALUES(3, '14:37', '집에가고싶다하심');
INSERT INTO SPECIAL(PT_NO, SREPORTTIME, SREPORT) VALUES(3, '20:09', '탈출하고싶다하심');

CREATE TABLE DR_OP
(
   DR_OP_NO number PRIMARY KEY,	
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   REPORTTIME varchar2(10),
   REPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

select * from dr_op;

INSERT INTO DR_OP(PT_NO, REPORTTIME, REPORT) VALUES(3, '15:37', '겡끼하심');
INSERT INTO DR_OP(PT_NO, REPORTTIME, REPORT) VALUES(3, '21:09', '감기약 복용하세요');

CREATE TABLE Exercise
(
	EXERCISE_NO number PRIMARY KEY,	
    PT_NO number NOT NULL,
    TODAY date DEFAULT SYSDATE NOT NULL,
    EXERCISETIME varchar2(10),
    EXERCISETEXT varchar2(100),
    INPUTDATE date DEFAULT SYSDATE NOT NULL,
    UPDATEDATE date,
    DELETEDATE date,
    DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

insert into exercise(PT_NO, today, EXERCISETIME, EXERCISETEXT) VALUES(3,TO_DATE(sysdate, 'yy/mm/dd'),TO_DATE('2017-04-04 14:28', 'YYYY/MM/DD HH24:MI'), '줄넘기 3000번');

CREATE TABLE Meal
(
   MEAL_NO number PRIMARY KEY,
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   TYPEEAT varchar2(10),
   MEALTIME varchar2(10),
   WHATEAT VARCHAR2(150),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL 
);

TRUNCATE TABLE MEAL;

INSERT INTO MEAL(PT_NO, today, TYPEEAT, MEALTIME, WHATEAT, INSERTDATE) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '아침', '10:10', '콘푸로스트', sysdate);
INSERT INTO MEAL(PT_NO, today, TYPEEAT, MEALTIME, WHATEAT) VALUES(3, to_date(sysdate, 'yy/mm/dd'), '점심', '14:28', '밥, 김치찌개');
INSERT INTO MEAL(PT_NO, today, TYPEEAT, MEALTIME, WHATEAT) VALUES(3, to_date(sysdate, 'yy/mm/dd'),'저녁', '18:40', '연어초밥');

SELECT * FROM MEAL

SELECT TO_CHAR(INSERTDATE, 'yyyymmdd') FROM MEAL;

SELECT * FROM MEAL WHERE insertdate = to_date('20170411','yyyymmdd');

CREATE TABLE NURSE
(
   NURSE_NO number NOT NULL,
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
   PT_NO number NOT NULL,
   NURSE_NO number,
   INS_NO varchar2(20) NOT NULL UNIQUE,
   NAME varchar2(51) NOT NULL,
   BIRTHDATE varchar2(10) NOT NULL,
   DISEASE varchar2(200),
   PHONE varchar2(13),
   ADDRESS varchar2(100),
   ORIGINALPHOTO varchar2(200),
   SAVEDPHOTO varchar2(200),
   ROOM_NO varchar2(5) NOT NULL,
   IPADDRESS varchar2(20),
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
   IPADDRESS varchar2(20) NOT NULL,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
   PRIMARY KEY (ROOM_NO)
);


CREATE TABLE SENSORLOG
(
   IPADDRESS varchar2(20) NOT NULL,
   TIMEONLOG date default sysdate,
   TEXT varchar2(100) NOT NULL,
   SENSORTYPE varchar2(20) NOT NULL
);

create table AISLESENSOR(
IPADDRESS varchar2(20)
, TIMEONLOG date default sysdate
, TEXT varchar2(20)
);



/*room data*/

insert into room(room_no,maximum,present,ipaddress) values('101',4,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('102',4,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('103',4,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('104',4,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('105',4,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('201',6,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('202',6,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('203',6,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('204',6,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('205',6,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('301',2,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('302',2,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('303',2,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('304',2,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('305',2,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('401',1,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('402',1,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('403',1,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('404',1,0,'10.10.5.32');
insert into room(room_no,maximum,present,ipaddress) values('405',1,0,'10.10.5.32');


INSERT INTO ADMIN values('admin', 'admin');

insert into nurse values(2,'222-222','2','2','간호사이름','010-7777-7777','간호사사진','간호사또사진',sysdate);

insert into patient (PT_NO,NURSE_NO,INS_NO,NAME,BIRTHDATE,DISEASE,PHONE,ADDRESS,ORIGINALPHOTO,SAVEDPHOTO,ROOM_NO,
   PPT_ID,PPT_PW,PPT_NAME,PPT_PHONE,PPT_ADD) values(1,3,'INS_NO','이름','생일','병명','폰번호','주소','사진','또사진','101','aaaaa','1','PPT_NAME','PPT_번호','PPT_주소');

insert into Nurse (NURSE_NO,CERT_NO,ID,PASSWORD,NAME,PHONE,ORIGINALPHOTO,SAVEDPHOTO,INPUTDATE,DELETEFLAG) 
values(3,'33','dum','11','dummy','010-000-3333','ORIGINALPHOTO','SAVEDPHOTO',sysdate,1);

insert into meal(PT_NO,today,breakfast,lunch,dinner,snack) values(1,sysdate,'아','점','저','간식'); 
insert into dr_op(PT_NO,today,text) values(1,sysdate,'의사양반');
insert into exercise(PT_NO,today,text) values(1,'2017/04/03','운동하자');
insert into bedtime(PT_NO, timetobed) values(1, sysdate);