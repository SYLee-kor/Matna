drop table member_order;
create table member_order(
	ono number primary key,
	giver number references member (no),
	taker number references member (no),
	item varchar2(100) not null,
	cnt number default 1,
	orderDate Date default sysdate,
	state number default 0,
	addr varchar2(200)
);

drop sequence member_order_seq;
create sequence member_order_seq
start with 1
increment by 1
nocycle
nocache;
