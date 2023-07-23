select table_name FROM user_tables;

select * from user_tbl;
select * from restaurant;
desc restaurant;
select * from review order by rev_idx desc;
select * from review where  rev_id like lower('USER41') order by rev_regdate desc;
desc review;

select a.*, b.rs_name, c.region_name, d.food_name 
  from review a, restaurant b, region c, food d 
 where a.rs_idx=b.rs_idx 
   and b.rs_region_cate=c.region_cate 
   and b.rs_food_cate = d.food_cate 
   and a.rev_id='user41'
order by a.rev_regdate desc
;

SELECT * FROM REVIEW WHERE REV_ID='user41' order by rev_regdate desc;

desc region;

--insert into review values(1001, '1', '테스트리뷰1', 5, 'user41', null, '테스트리뷰1입니다.', default);
--delete from review where rev_idx = 1008;
commit;

-- 가게 평점순 정렬
select round(AVG(a.rev_score), 2) as avgScore, b.rs_idx, b.rs_name
from review a, restaurant b 
where a.rs_idx = b.rs_idx 
group by b.rs_idx, b.rs_name 
order by avgScore desc
;
--having round(AVG(a.rev_score), 2) >= 3

-- 가게 별 리뷰
select * from review where rs_idx = 1 order by rev_regdate desc;
select count(rev_idx) from review where rs_idx=1;

-- 지역 별 리뷰
select a.* from review a, restaurant b where b.rs_region_cate = '01' and a.rs_idx = b.rs_idx order by a.rev_regdate desc;

-- 리뷰 많은 순 가게 정렬
select a.rs_idx, COUNT(a.rev_id) as cnt from review a group by a.rs_idx order by cnt desc;

select a.*, b.rs_name
from (select a.rs_idx, COUNT(a.rev_id) as cnt from review a group by a.rs_idx order by cnt desc) a,
      restaurant b
where a.rs_idx = b.rs_idx
;



insert into region values('01', '서귀포');
insert into region values('02', '제주');
select * from region order by region_cate;

insert into food values('01', '식사');
insert into food values('02', '디저트');
select * from food order by food_cate;

-- delete from user_tbl where user_id = 'test01';

commit;

--select * from review;
--desc review;
--insert into review values(
--    REV_SEQ.nextval, 
--);