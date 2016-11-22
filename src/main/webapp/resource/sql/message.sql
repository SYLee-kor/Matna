select * from message;
select nickname from member where member.no=1;
select count(*) no from message where senderNo=2 and sendDelete=0;

select no,senderNo,receiverNo,(select nickname from member where no=senderNo) senderNickname, title,content,sendDate,state,sendDelete,receiverDelete
		 from message where senderNo=2;
		 
select no,senderNo,receiverNo, title,content,sendDate,state,
		(select nickname from member where no=receiverNo) receiverNickname,
		(select nickname from member where no=senderNo) senderNickname,
		 sendDelete,receiverDelete
		from message
		where content like '%����%' order by no desc;

select sendDate from message where (sysdate-sendDate)>2;
delete from message where (sysdate-sendDate)>2;

		
drop table message;
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

drop sequence message_seq;
create sequence message_seq
     start with 1
     increment by 1
     nocycle
     nocache;
     
		
select no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rn
		from (select  no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rownum rn 
			from (select no,senderNo,receiverNo, title,content,sendDate,state,
				(select nickname from member where no=receiverNo) receiverNickname,
				(select nickname from member where no=senderNo) senderNickname,
		 		sendDelete,receiverDelete 
			     from message order by no desc) where senderNo=2 and sendDelete=0)
		where rn between 1 and 10
		
select no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rn
		from (select  no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rownum rn 
			from (select no,senderNo,receiverNo, title,content,sendDate,state,
				(select nickname from member where no=receiverNo) receiverNickname,
				(select nickname from member where no=senderNo) senderNickname,
		 		sendDelete,receiverDelete 
			     from message order by no desc) where receiverNo=4 and receiverDelete=0)
		where rn between 1 and 10
		
		
select no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rn
		from
    		(select  no,senderNo,receiverNo, title,content,sendDate,state,
			(select nickname from member where no=receiverNo) receiverNickname,
			(select nickname from member where no=senderNo) senderNickname,
		 	sendDelete,receiverDelete, rownum rn
			from (select no,senderNo,receiverNo, title,content,sendDate,state,
				(select nickname from member where no=receiverNo) receiverNickname,
				(select nickname from member where no=senderNo) senderNickname,
		 		sendDelete,receiverDelete 
			     from message order by no desc)
			where senderNo=2 and sendDelete=0 and title like '%��%' )
		where rn between 1 and 10