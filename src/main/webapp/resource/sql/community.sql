 insert into BOARD_free (no,title,content,writer) (select board_free_seq.nextval, title,content,writer from BOARD_free);

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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_free_reply_seq;
create sequence board_free_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_free_reply;
create table board_free_reply(
	no number primary key,
	bno number references board_free (no),
	writer number references member (no),
	content varchar(300),
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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_meeting_reply_seq;
create sequence board_meeting_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_meeting_reply;
create table board_meeting_reply(
	no number primary key,
	bno number references board_meeting (no),
	writer number references member (no),
	content varchar(300),
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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_noname_reply_seq;
create sequence board_noname_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_noname_reply;
create table board_noname_reply(
	no number primary key,
	bno number references board_noname (no),
	writer number references member (no),
	content varchar(300),
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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_notice_reply_seq;
create sequence board_notice_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_notice_reply;
create table board_notice_reply(
	no number primary key,
	bno number references board_notice (no),
	writer number references member (no),
	content varchar(300),
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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_suggest_reply_seq;
create sequence board_suggest_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_suggest_reply;
create table board_suggest_reply(
	no number primary key,
	bno number references board_suggest (no),
	writer number references member (no),
	content varchar(300),
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
	writer number references member (no),
	content clob,
	viewCnt number default 0,
	replyCnt number default 0,
	regdate date default sysdate
);

drop sequence board_faq_reply_seq;
create sequence board_faq_reply_seq
start with 1
increment by 1
nocycle
nocache;

drop table board_faq_reply;
create table board_faq_reply(
	no number primary key,
	bno number references board_faq (no),
	writer number references member (no),
	content varchar(300),
	regdate date default sysdate
);

--
--drop sequence board_free_reply_seq;
--create sequence board_free_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_free_reply(
--	no number primary key,
--	bno number references board_free(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);
--
--drop sequence board_meeting_reply_seq;
--create sequence board_meeting_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_meeting_reply(
--	no number primary key,
--	bno number references board_meeting(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);
--
--drop sequence board_noname_reply_seq;
--create sequence board_noname_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_noname_reply(
--	no number primary key,
--	bno number references board_noname(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);
--
--drop sequence board_notice_reply_seq;
--create sequence board_notice_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_notice_reply(
--	no number primary key,
--	bno number references board_notice(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);
--
--drop sequence board_suggest_reply_seq;
--create sequence board_suggest_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_suggest_reply(
--	no number primary key,
--	bno number references board_suggest(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);
--
--drop sequence board_faq_reply_seq;
--create sequence board_faq_reply_seq
--start with 1
--increment by 1
--nocache
--nocycle;
--
--create table board_faq_reply(
--	no number primary key,
--	bno number references board_faq(no),
--	writer number references member (no),
--	content varchar2(300),
--	regdate date default sysdate
--);