drop table member_order;
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

drop sequence member_order_seq;
create sequence member_order_seq
start with 1
increment by 1
nocycle
nocache;
