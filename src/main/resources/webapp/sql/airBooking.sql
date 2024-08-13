drop table airBooking;
drop sequence airBookingSeq;

create table airBooking (

airBookingId varchar2 (20),

outFlightCode varchar2 (20),
depDate varchar2 (10),
depDay Date,

inFlightCode varchar2 (20),
rtnDate varchar2 (10),
rtnDay date,

adult int,
child int,
baby int
);


create sequence airBookingSeq
increment by 1
start with 1000;

commit;
select * from airbooking;
