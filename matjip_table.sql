-- CREATE USER test7 IDENTIFIED BY 1234;
-- GRANT connect, resource, dba TO test7;
-- CONN test7/1234;
select table_name
  FROM user_tables
;

CREATE TABLE user_tbl(user_id VARCHAR2(20) PRIMARY KEY not null,   --아이디
                    user_pw VARCHAR2(300) not null,  --비밀번호
                    user_name VARCHAR2(20),  --이름
                    user_phone VARCHAR2(13), --전화번호
                    user_email VARCHAR2(50)    --이메일
);

insert into user_tbl(user_id, user_pw) values('test01', 'pw01');

--select * from user_tbl;
--update user_tbl set user_name = '테스트01' where user_id = 'test01';
--select user_name from user_tbl where user_id = 'test01';
                    
CREATE TABLE notice (noti_idx NUMBER(20) PRIMARY KEY NOT NULL,   --공지사항idx
                     noti_title VARCHAR2(100) NOT NULL,  --제목
                     noti_content VARCHAR2(1000) NOT NULL,   -- 내용
                     noti_author VARCHAR2(20),  -- 작성자id
                     noti_file VARCHAR2(200),   -- 첨부파일
                     noti_regdate date DEFAULT current_timestamp,   -- 작성일
                     CONSTRAINT noti_author_fk foreign key(noti_author) REFERENCES user_tbl(user_id) 
);

CREATE SEQUENCE NOTI_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE TABLE region (region_cate varchar(10) primary key,  --{01 : 서귀포, 02 : 제주}
                     region_name varchar(50) not null 
);

CREATE TABLE food (food_cate varchar(10) primary key,    --{01 : 식사, 02 : 디저트}
                   food_name varchar(50) not null
);


CREATE TABLE restaurant (rs_idx VARCHAR2(20) PRIMARY KEY NOT NULL, -- 레스토랑idx
                         rs_food_cate VARCHAR(10), -- 음식분류  식사/디저트
                         rs_name VARCHAR2(50), -- 이름
                         rs_phone VARCHAR2(13),    -- 전화번호
                         rs_region_cate VARCHAR(10),    -- 지역분류 서귀포/제주
                         rs_addr VARCHAR2(200),    -- 주소  
                         rs_file VARCHAR2(200), -- 이미지
                         rs_content VARCHAR2(1000),  --소개
                         constraint rs_food_cate_fk foreign key(rs_food_cate) references food(food_cate),
                         constraint rs_region_cate_fk foreign key(rs_region_cate) references region(region_cate)
);


CREATE SEQUENCE REST_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE ;

CREATE TABLE review (rev_idx NUMBER(20) PRIMARY KEY NOT NULL,   -- 리뷰 idx
                     rs_idx VARCHAR2(20) NOT NULL, --레스토랑 idx,
                     rev_title VARCHAR2(100) NOT NULL,  --제목
                     rev_score NUMBER(1) NOT NULL,   --평점 1~5
                     rev_id VARCHAR2(20) NOT NULL,   --리뷰자id
                     rev_file VARCHAR2(200),    --첨부파일
                     rev_content VARCHAR2(1000) NOT NULL,      --리뷰
                     rev_regdate date DEFAULT current_timestamp,    --작성일
                     constraint review_idx_fk foreign key(rs_idx) references restaurant(rs_idx),
                     constraint review_user_fk foreign key(rev_id) references user_tbl(user_id)
);

alter table review add rev_like number default 0;
alter table review drop column rev_like;

create sequence rev_seq start with 1 INCREMENT by 1 nocycle;

CREATE TABLE qna (
  qna_idx NUMBER(20) PRIMARY KEY NOT NULL,   
  qna_title VARCHAR2(100) NOT NULL,
  qna_content VARCHAR2(1000) NOT NULL,
  qna_id VARCHAR2(20),
  qna_answer VARCHAR2(500),
  qna_resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  lev NUMBER(5),
  parno VARCHAR2(8),
  qna_file VARCHAR2(200)
);

commit;


