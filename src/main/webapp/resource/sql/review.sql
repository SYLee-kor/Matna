drop table gbCheck;
drop table preview;
drop table review_reply;
drop table review;

drop sequence review_seq;
create sequence review_seq
start with 1
increment by 1
nocache
nocycle;

drop sequence review_reply_seq;
create sequence review_reply_seq
start with 1
increment by 1
nocache
nocycle;

create table review(
	no number primary key,
	title varchar2(200) not null,
	content clob not null,
	writer number not null,
	regdate date default sysdate,
	replyCnt number default 0,
	viewCnt number default 0,
	good number default 0,
	bad number default 0,
	photo varchar2(200) default 'basePhoto.jpg'
);

create table preview(
	no number references review(no),
	parking number default 0,
	price varchar(10) not null,
	score number not null,
	recommend varchar2(100),
	menu varchar2(15) not null,
	gu varchar2(60) not null,
	dong varchar2(60) not null,
	addr varchar2(60) not null,
	phone varchar2(20) not null
);

create table review_reply(
	no number primary key,
	rNo number references review(no),
	writer number,
	content varchar2(300),
	regdate date default sysdate
);

create table gbCheck(
	rNo number references review(no) on delete cascade,
	userNo number references member(no) on delete cascade,
	gbType varchar2(5)
);

drop table matnaAddr;
create table matnaAddr
as (select ds_gugun,ds_dong from ds_zip where ds_sido='¼­¿ï');
 
alter table matnaAddr
rename column ds_gugun to gu;

alter table matnaAddr
rename column ds_dong to dong;
