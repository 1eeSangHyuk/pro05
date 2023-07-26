--------------------------------------------------------
--  파일이 생성됨 - 화요일-7월-25-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "TEST7"."QNA" 
   (	"QNA_IDX" NUMBER(20,0), 
	"QNA_TITLE" VARCHAR2(100 BYTE), 
	"QNA_CONTENT" VARCHAR2(1000 BYTE), 
	"QNA_ID" VARCHAR2(20 BYTE), 
	"QNA_RESDATE" DATE DEFAULT current_timestamp, 
	"LEV" NUMBER(5,0), 
	"PARNO" NUMBER(20,0), 
	"REPLY_CNT" NUMBER(5,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST7.QNA
SET DEFINE OFF;
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (2,'질문글1','질문글1','hny24',to_date('23/07/24','RR/MM/DD'),1,2,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (8,'질문글3 의 답글2','질문글3 의 답글2','hny24',to_date('23/07/24','RR/MM/DD'),2,6,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (4,'질문글1 의 답변글1','질문글1 의 답변글1','lys24',to_date('23/07/24','RR/MM/DD'),2,2,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (5,'질문글1 의 답변글2','질문글1 의 답변글2','lys24',to_date('23/07/24','RR/MM/DD'),2,2,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (6,'질문글3','질문글3','lys24',to_date('23/07/24','RR/MM/DD'),1,6,1);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (7,'질문글3 의 답글1','질문글3 의 답글1','hny24',to_date('23/07/24','RR/MM/DD'),2,6,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (9,'질문글3 의 답글3','질문글3 의 답글3','hny24',to_date('23/07/24','RR/MM/DD'),2,6,0);
Insert into TEST7.QNA (QNA_IDX,QNA_TITLE,QNA_CONTENT,QNA_ID,QNA_RESDATE,LEV,PARNO,REPLY_CNT) values (3,'답변달기 테스트','444','tyler',to_date('23/07/25','RR/MM/DD'),2,6,0);
