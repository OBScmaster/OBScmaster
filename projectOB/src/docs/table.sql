/* 트리거 */

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

/* sequence */
 CREATE SEQUENCE PTNO_SEQ

       START WITH 1   
       INCREMENT BY 1 
     
       
 CREATE SEQUENCE NURSENO_SEQ

       START WITH 1   
       INCREMENT BY 1 
   

/* Create Tables */

CREATE TABLE ADMIN(
   ID varchar2(5) NOT NULL primary key,
   PASSWORD varchar2(5) NOT NULL
);

CREATE TABLE BEDTIME
(
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE,
   TIMETOBED date,
   DELETEFLAG varchar2(1) DEFAULT 'Y'
);


CREATE TABLE DAILYCLEANING
(
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   CLEANING date,
   CLEANINGREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
   PRIMARY KEY (PT_NO, TODAY)
);

TRUNCATE TABLE DAILYCLEANING;

INSERT INTO DAILYCLEANING(PT_NO, TODAY, CLEANING, CLEANINGREPORT) VALUES(1, TO_DATE('2017/04/03'), TO_DATE('2017/04/03 16:17', 'YYYY-MM-DD HH24:MI'), '방청소, 욕실청소');
INSERT INTO DAILYCLEANING(PT_NO, TODAY, CLEANING, CLEANINGREPORT) VALUES(1, TO_DATE('2017/04/03'), TO_DATE('2017/04/03 20:30', 'YYYY-MM-DD HH24:MI'), '방청소, 욕실청소');

SELECT TO_CHAR(CLEANING, 'HH24:MI') AS CLEANING, CLEANINGREPORT FROM DAILYCLEANING;

CREATE TABLE DAILYWASH
(
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   WASH date,
   WASHREPORT varchar2(300),
   INPUTDATE date DEFAULT SYSDATE NOT NULL,
   UPDATEDATE date,
   DELETEDATE date,
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL,
   PRIMARY KEY (PT_NO, TODAY)
);

CREATE TABLE DAILYSHOWER
(
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   SHOWER date,
   SHOWERREPORT varchar2(300),
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
   EXERCISETIME date DEFAULT SYSDATE,
   EXERCISETEXT varchar2(100),
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL
);

insert into exercise(PT_NO, today, EXERCISETIME, EXERCISETEXT) VALUES(1,TO_DATE('2017-04-04'),TO_DATE('2017-03-28 14:28', 'YYYY/MM/DD HH24:MI'), '줄넘기 3000번');

CREATE TABLE Meal
(
   PT_NO number NOT NULL,
   TODAY date DEFAULT SYSDATE NOT NULL,
   TYPEEAT varchar2(10),
   MEALTIME varchar2(10),
   WHATEAT VARCHAR2(150),
   DELETEFLAG varchar2(1) DEFAULT 'Y' NOT NULL 
);

TRUNCATE TABLE MEAL;

INSERT INTO MEAL(PT_NO, TODAY, TYPEEAT, MEALTIME, WHATEAT) VALUES(1, TO_DATE('2017/04/04','YYYY/MM/DD'),'아침', '10:10', '콘푸로스트');
INSERT INTO MEAL(PT_NO, TODAY, TYPEEAT, MEALTIME, WHATEAT) VALUES(1, TO_DATE('2017/04/04','YYYY/MM/DD'),'점심', '14:28', '밥, 김치찌개');
INSERT INTO MEAL(PT_NO, TODAY, TYPEEAT, MEALTIME, WHATEAT) VALUES(1, TO_DATE('2017/04/04','YYYY/MM/DD'),'저녁', '18:40', '연어초밥');

SELECT * FROM MEAL WHERE TODAY = TO_DATE('2017/04/04','YYYY-MM-DD');

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
   TIMEONLOG date NOT NULL,
   TEXT varchar2(100) NOT NULL,
   GRADE number NOT NULL
);

/* Create Foreign Keys */

ALTER TABLE BEDTIME
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;


ALTER TABLE DR_OP
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;


ALTER TABLE Exercise
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;


ALTER TABLE Meal
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;

ALTER TABLE DailyCleaning
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;

ALTER TABLE DailyWash
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;

ALTER TABLE DailyShower
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;

ALTER TABLE SENSORLOG
   ADD FOREIGN KEY (PT_NO)
   REFERENCES PATIENT (PT_NO)
;


/*room data*/

insert into room(room_no,maximum,present) values('101',4,0);
insert into room(room_no,maximum,present) values('102',4,0);
insert into room(room_no,maximum,present) values('103',4,0);
insert into room(room_no,maximum,present) values('104',4,0);
insert into room(room_no,maximum,present) values('105',4,0);
insert into room(room_no,maximum,present) values('201',6,0);
insert into room(room_no,maximum,present) values('202',6,0);
insert into room(room_no,maximum,present) values('203',6,0);
insert into room(room_no,maximum,present) values('204',6,0);
insert into room(room_no,maximum,present) values('205',6,0);
insert into room(room_no,maximum,present) values('301',8,0);
insert into room(room_no,maximum,present) values('302',8,0);
insert into room(room_no,maximum,present) values('303',8,0);
insert into room(room_no,maximum,present) values('304',8,0);
insert into room(room_no,maximum,present) values('305',8,0);
insert into room(room_no,maximum,present) values('401',2,0);
insert into room(room_no,maximum,present) values('402',2,0);
insert into room(room_no,maximum,present) values('403',2,0);
insert into room(room_no,maximum,present) values('404',2,0);
insert into room(room_no,maximum,present) values('405',2,0);


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