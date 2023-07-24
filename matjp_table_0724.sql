-- CREATE USER test7 IDENTIFIED BY 1234;
-- GRANT connect, resource, dba TO test7;
-- CONN test7/1234;

-- matjip_table_최종본
-- 수정사항 있으신분은 수정사항 기입 후 본인 파트 CTRL C+V 후 업로드해주세요
-- 수정사항 없으신분은 본인 파트 CTRL C+V 후 업로드 해주세요

-- 0724 수정
--  restaurant table : rs_idx varchar -> number
--  review table : rs_idx varchar -> number
--  헤당 부분 VARCHAR2 이신 분들만 table 날리고 다시 create 해주세요



-- RESTAURANT + REVIEW

drop sequence rev_seq;
drop table review;

drop table restaurant;
drop sequence REST_SEQ;

CREATE TABLE restaurant (rs_idx number PRIMARY KEY NOT NULL, -- 레스토랑idx
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

CREATE SEQUENCE REST_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE TABLE review (rev_idx NUMBER(20) PRIMARY KEY NOT NULL,   -- 리뷰 idx
                     rs_idx number NOT NULL, --레스토랑 idx,
                     rev_title VARCHAR2(100) NOT NULL,  --제목
                     rev_score NUMBER(1) NOT NULL,   --평점 1~5
                     rev_id VARCHAR2(20) NOT NULL,   --리뷰자id
                     rev_file VARCHAR2(200),    --첨부파일
                     rev_content VARCHAR2(1000) NOT NULL,      --리뷰
                     rev_regdate date DEFAULT current_timestamp,    --작성일
                     constraint review_idx_fk foreign key(rs_idx) references restaurant(rs_idx),
                     constraint review_user_fk foreign key(rev_id) references user_tbl(user_id)
);

create sequence rev_seq start with 1 INCREMENT by 1 nocycle;

-- RESTAURANT + REVIEW 끝

-- region + food

CREATE TABLE region (region_cate varchar(10) primary key,  --{01 : 서귀포, 02 : 제주}
                     region_name varchar(50) not null 
);

CREATE TABLE food (food_cate varchar(10) primary key,    --{01 : 식사, 02 : 디저트}
                   food_name varchar(50) not null
);

insert into region values('01', '서귀포');
insert into region values('02', '제주');

insert into food values('01', '식사');
insert into food values('02', '디저트');

-- region + food 끝