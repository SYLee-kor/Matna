-- 최초기본 설정으로 해둬야 할 테이블 및 시퀀스들.. ================================================
-- matnaAddr (주소입력시 나오는 구 동 정보) 를 위한 테이블
-- 이것을 위해 ds_zip이라는 테이블(수업중에 받은 주소 테이블) 이 있어야 함..
drop table matnaAddr;

create table matnaAddr
as (select ds_gugun,ds_dong from ds_zip where ds_sido='서울');
 
alter table matnaAddr
rename column ds_gugun to gu;

alter table matnaAddr
rename column ds_dong to dong;

-- 테이블 및 시퀀스 삭제!!! ============================================================================ 
-- => reference로 묶여있는 테이블이 많기 때문에 순서에 신경써야함..(시퀀스는 예외)

-- 회원관리기능 및 상품관련 .......................................................
-- 회원 주문(member_order) drop
drop sequence member_order_seq;
drop table member_order;

-- 상품(item) drop  ※ 반드시 회원 주문 테이블 먼저 삭제해야함..!!
drop table Item;
drop sequence Item_seq;

-- 광고 (ad) drop
drop sequence ad_seq;
drop table ad;

-- 메세지(message) drop
drop sequence message_seq;
drop table message;

-- 여러 게시판 (board_free, meeting, noname, notice, sugges, faq) drop .................
-- 자유게시판(free)
drop sequence board_free_reply_seq;
drop sequence board_free_seq;
drop table board_free_reply;
drop table board_free; 

-- 만남게시판(meeting)
drop table board_meeting_reply;
drop table board_meeting;
drop sequence board_meeting_seq;
drop sequence board_meeting_reply_seq;

-- 익명게시판(noname)
drop table board_noname_reply;
drop table board_noname;
drop sequence board_noname_seq;
drop sequence board_noname_reply_seq;

-- 공지 게시판(notice)
drop table board_notice_reply;
drop table board_notice;
drop sequence board_notice_seq;
drop sequence board_notice_reply_seq;

-- 건의게시판(sugges)
drop table board_suggest_reply;
drop table board_suggest;
drop sequence board_suggest_seq;
drop sequence board_suggest_reply_seq;

-- FAQ 게시판(faq)
drop table board_faq_reply;
drop table board_faq;
drop sequence board_faq_seq;
drop sequence board_faq_reply_seq;

-- 리뷰 및 레시피 (review & recipe)..........................................
-- 리뷰 게시판(review)
drop sequence review_seq;
drop sequence review_reply_seq;

drop table gbCheck;
drop table preview;
drop table review_reply;
drop table review;

-- 레시피 게시판(recipe)
drop table precipe;
drop table recipeLikes;
drop table recipe;
drop sequence recipe_seq;

-- 회원(member) .............................................................
-- ※ 반드시 회원 주문, 여러 게시판, 리뷰 & 레시피 테이블 먼저 삭제해야함..!!
drop sequence member_seq;
drop table member;


-- 테이블 및 시퀀스 생성!!!! =============================================================================================
-- 회원관련 기능(member)============================================
-- 멤버 시퀀스
create sequence member_seq
     start with 1
     increment by 1
     nocycle
     nocache;

-- 멤버 테이블
create table member(
	no number primary key,
	id varchar2(20) not null,
	pw varchar2(20) not null,
	name varchar2(35) not null,
	nickname varchar2(35) not null,
	birth varchar2(6) not null,
	gender varchar2(5) not null,
	email varchar2(50) not null,
	phone varchar2(15) not null,
	post varchar2(5) not null,
	addr varchar2(200) not null,
	point number default 0,
	regdate date default sysdate,
	grade number default 1,
	allpoint number default 0
);

-- 상품(item) 관련 및 회원 주문(member_order) 기능 ============================================
-- 상품 테이블
create table Item(
	ino number primary key,
	name varchar2(100) not null,
	price number not null,
	amount number not null,
	state number default 1,
	regdate Date default sysdate,
	content varchar2(500),
	photo varchar2(100)
);

-- 상품 시퀀스
create sequence Item_seq
start with 1
increment by 1
nocycle
nocache;

-- 회원 주문 관련 (member_order)----------------
-- 멤버 주문 시퀀스
create sequence member_order_seq
start with 1
increment by 1
nocycle
nocache;

-- 멤버 주문 테이블
create table member_order(
	ono number primary key,
	giver number references member (no) on delete cascade,
	taker number references member (no) on delete cascade,
	item number references item(ino) on delete cascade,
	cnt number default 1,
	orderDate Date default sysdate,
	state number default 0,
	addr varchar2(200)
);

-- 광고(ad) 관련 기능 ==============================================
-- 광고 시퀀스
create sequence ad_seq
start with 1
increment by 1
nocycle
nocache;

-- 광고 테이블
create table ad(
	no number primary key,
	photo  varchar(100),
	title varchar(100),
	comments  varchar(300),
	link  varchar(100)
);

-- 메세지(message) 관련 기능 ============================================
-- 메세지 시퀀스
create sequence message_seq
     start with 1
     increment by 1
     nocycle
     nocache;

     
-- 메세지 테이블
create table message(
	no number primary key,
	senderNo number not null,
	receiverNo number not null,
	title varchar(100) not null,
	content varchar(1000) not null,
	sendDate date default sysdate,
	state number default 0,
	sendDelete number default 0,
	receiverDelete number default 0
);
-- 게시판(board) 관련 기능 ============================================
-- 자유게시판 (board_free)
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

-- 만남게시판 (board_meeting)
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

-- 익명게시판(board_noname)
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

-- 공지게시판 (board_notice)
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

-- 건의게시판(board_suggest)
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

--FAQ 게시판(board_faq)
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

-- 리뷰 관련 기능 ==============================================
-- 리뷰테이블 시퀀스
create sequence review_seq
start with 1
increment by 1
nocache
nocycle;

-- 리뷰의 댓글 시퀀스
create sequence review_reply_seq
start with 1
increment by 1
nocache
nocycle;

-- 리뷰 테이블
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

-- 프리뷰 테이블
create table preview(
	no number references review(no) on delete cascade,
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

-- 리뷰 댓글 테이블
create table review_reply(
	no number primary key,
	rNo number references review(no) on delete cascade,
	writer number,
	content varchar2(300),
	regdate date default sysdate
);

-- 리뷰 좋아요 싫어요 체크 테이블
create table gbCheck(
	rNo number references review(no) on delete cascade,
	userNo number references member(no) on delete cascade,
	gbType varchar2(5)
);

-- 레시피(recipe) 관련 기능 ===================================================
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
	viewCnt number default 0,
	likes number default 0,
	photo varchar2(200) not null
);

create table precipe(
	no number references recipe(no) on delete cascade,
	ingredient varchar2(1000) not null,
	foodName varchar2(30) not null,
	price number not null,
	time number not null,
	difficulty char(3),
	per number default 2
);

create table recipeLikes(
	no number references recipe(no) on delete cascade,
	userno number not null
);


