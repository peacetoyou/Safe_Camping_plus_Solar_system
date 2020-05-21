drop table CAMP_RESERVE2;
create table CAMP_RESERVE2(
   name varchar(30),
   tel varchar(30),
   id number,
   deck_num number,
   in_date varchar(30),
   out_date varchar(30)
);

commit;
insert into camp_reserve2 values('sang chul','8128',4,1, '2020.05.01', '2020.05.20');
select * from camp_reserve2;

delete from CAMP_RESERVE where id=1;