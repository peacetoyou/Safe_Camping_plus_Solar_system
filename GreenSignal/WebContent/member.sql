select * from web_member;  

drop table web_member;
create table web_member(
   email varchar(30),
   pw varchar(30)
);

insert into web_member values('admin@naver.com','1234');
