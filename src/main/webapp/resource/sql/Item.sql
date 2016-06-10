drop table Item;
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

drop sequence Item_seq;
create sequence Item_seq
start with 1
increment by 1
nocycle
nocache;

insert into ITEM (ino,name,price,amount,state,regdate,content,photo) values
(Item_seq.nextval,'상품명',1000,10,1,sysdate,'설명','사진');