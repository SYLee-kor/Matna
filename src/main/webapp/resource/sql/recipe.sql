drop table precipe;
drop table recipe;

drop sequence recipe_seq;
create sequence recipe_seq
start with 1
increment by 1
nocache
nocycle;

create table recipe(
	no number primary key,
	title varchar2(200) not null,
	content clob,
	regdate date default sysdate,
	writer varchar2(35) not null,
	replyCnt number default 0,
	viewCnt number default 0
);

create table precipe(
	no number references recipe(no),
	ingredient varchar(1000) not null,
	price number not null,
	time number not null,
	levle char(3),
	per number default 2
);