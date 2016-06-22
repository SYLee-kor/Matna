drop sequence ad_seq;
create sequence ad_seq
start with 1
increment by 1
nocycle
nocache;

drop table ad;
create table ad(
	no number primary key,
	photo  varchar(100),
	title varchar(100),
	comments  varchar(300),
	link  varchar(100)
);