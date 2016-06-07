select * from member;

drop table member;
create table member(
	no number primary key,
	id varchar(20) not null,
	pw varchar(20) not null,
	name varchar(35) not null,
	birth varchar(6) not null,
	gender varchar(5) not null,
	email varchar(50) not null,
	phone varchar(15) not null,
	post varchar(5) not null,
	addr varchar(200) not null,
	point number not null,
	regdate varchar(10) not null
);

drop sequence member_seq;
create sequence member_seq
     start with 1
     increment by 1
     nocycle
     nocache;