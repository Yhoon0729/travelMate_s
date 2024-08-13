drop table admActLog;
drop sequence admActLogSeq;

create table admActLog (
no int,
userId varchar2 (20),
act varchar2 (100),
logDate date
);


create sequence admActLogSeq
increment by 1
start with 1000;

commit;
select * from admActLog;