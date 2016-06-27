select * from member;
alter table member add (allpoint number default 0);

alter table member modify(grade number default 1);

update member set allpoint=0
	    where no=7;
update member set allpoint=500
	    where no=7;
update member set allpoint=3000
	    where no=7;

drop table member;
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

drop sequence member_seq;
create sequence member_seq
     start with 1
     increment by 1
     nocycle
     nocache;