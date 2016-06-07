drop table Item;
create table Item(
	no number primary key,
	name varchar2(100) not null,
	price number not null,
	amount number not null,
	state number default 1,
	regdate Date default sysdate,
	content varchar2(500)
)

drop sequence Item_seq;
create sequence Item_seq
start with 1
increment by 1
nocycle
nocache;