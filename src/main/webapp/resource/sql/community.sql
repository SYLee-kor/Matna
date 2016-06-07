drop sequence board_free_seq;
create sequence board_free_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_free;
create table board_free(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_meeting_seq;
create sequence board_meeting_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_meeting;
create table board_meeting(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_noname_seq;
create sequence board_noname_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_noname;
create table board_noname(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_notice_seq;
create sequence board_notice_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_notice;
create table board_notice(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_suggest_seq;
create sequence board_suggest_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_suggest;
create table board_suggest(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_faq_seq;
create sequence board_faq_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_faq;
create table board_faq(
	no number primary key,
	title varchar(200) not null,
	writer varchar(35) not null,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);