drop table randomid;


create table camp_member (
	id number PRIMARY KEY,
	pw varchar(30) NOT NULL,
	deck_num number NOT NULL
);

select * from camp_member
select * from deck_sensors

create sequence randomid_num start with 1000 increment by 1;

insert into camp_member values(randomid_num.nextval,'1234',1);

create table deck_sensors (
	deck_num number PRIMARY KEY,
	invade_ck number NOT NULL,
	fire_ck number NOT NULL
);

insert into deck_sensors values(1,0,140);
insert into deck_sensors values(2,0,220);
insert into deck_sensors values(3,0,140);


