 insert into BOARD_free (no,title,content,writer) (select board_free_seq.nextval, title,content,writer from BOARD_free);
 insert into ad (no,photo,title,comments,link) (select ad_seq.nextval,photo,title,comments,link from ad);

drop sequence board_free_reply_seq;
drop sequence board_free_seq;
drop table board_free_reply;
drop table board_free; 


create sequence board_free_seq
start with 1
increment by 1
nocycle
nocache;
create table board_free(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_free_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_free_reply(
	no number primary key,
	bno number references board_free (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);

drop table board_meeting_reply;
drop table board_meeting;
drop sequence board_meeting_seq;
drop sequence board_meeting_reply_seq;

create sequence board_meeting_seq
start with 1
increment by 1
nocycle
nocache;
create table board_meeting(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_meeting_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_meeting_reply(
	no number primary key,
	bno number references board_meeting (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);

drop table board_noname_reply;
drop table board_noname;
drop sequence board_noname_seq;
drop sequence board_noname_reply_seq;

create sequence board_noname_seq
start with 1
increment by 1
nocycle
nocache;
create table board_noname(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_noname_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_noname_reply(
	no number primary key,
	bno number references board_noname (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);

drop table board_notice_reply;
drop table board_notice;
drop sequence board_notice_seq;
drop sequence board_notice_reply_seq;

create sequence board_notice_seq
start with 1
increment by 1
nocycle
nocache;
create table board_notice(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_notice_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_notice_reply(
	no number primary key,
	bno number references board_notice (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);

drop table board_suggest_reply;
drop table board_suggest;
drop sequence board_suggest_seq;
drop sequence board_suggest_reply_seq;

create sequence board_suggest_seq
start with 1
increment by 1
nocycle
nocache;
create table board_suggest(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_suggest_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_suggest_reply(
	no number primary key,
	bno number references board_suggest (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);
drop table board_faq_reply;
drop table board_faq;
drop sequence board_faq_seq;
drop sequence board_faq_reply_seq;

create sequence board_faq_seq
start with 1
increment by 1
nocycle
nocache;
create table board_faq(
	no number primary key,
	title varchar(200) not null,
	writer number references member (no) on delete cascade,
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);
create sequence board_faq_reply_seq
start with 1
increment by 1
nocycle
nocache;
create table board_faq_reply(
	no number primary key,
	bno number references board_faq (no) on delete cascade,
	writer number references member (no) on delete cascade,
	content varchar(300),
	regdate date default sysdate
);