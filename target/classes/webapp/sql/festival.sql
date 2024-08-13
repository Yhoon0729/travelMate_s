drop table festival;

drop sequence festivalSeq;

create sequence festivalseq
increment by 1
start with 1000;

create table festival (

code varchar2 (300) PRIMARY KEY,
season varchar2 (30),
countryCode varchar2 (3),
country varchar2 (300),

festivalName varchar2 (300),
startDay date,
endDay date,

info1 varchar2 (4000),
info2 varchar2 (4000),
info3 varchar2 (4000),

url1 varchar2 (4000),
url2 varchar2 (4000),
url3 varchar2 (4000)

);

 insert into festival values (  concat( 'JPNspr20240317', festivalseq.nextval ), 'spr', 'JPN', '일본', '우에노 벚꽃 축제', '20240317', '20240409', '20240319상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'ESPspr20240315', festivalseq.nextval ), 'spr', 'ESP', '스페인', '라스 파야스 축제', '20240315', '20240319', '20240324상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'DEUspr20240301', festivalseq.nextval ), 'spr', 'DEU', '독일', '슈타르크비어차이트 맥주 축제', '20240301', '20240324', '20240731상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'JPNsum20240701', festivalseq.nextval ), 'sum', 'JPN', '일본', '교토 기온마츠리', '20240701', '20240731', '20240815상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'VNMsum20240611', festivalseq.nextval ), 'sum', 'VNM', '베트남', '다낭 여름 축제', '20240611', '20240815', '20240819상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'PHLsum20240817', festivalseq.nextval ), 'sum', 'PHL', '필리핀', '카다야완 사 다보 축제', '20240817', '20240819', '20241106상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'JPNfal20241102', festivalseq.nextval ), 'fal', 'JPN', '일본', '국제 열기구 축제', '20241102', '20241106', '20241031상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'USAfal20240916', festivalseq.nextval ), 'fal', 'USA', '미국', '뉴욕 허수아비와 호박 축제', '20240916', '20241031', '20241115상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'CHNfal20240915', festivalseq.nextval ), 'fal', 'CHN', '중국', '베이징 국화문화제', '20240915', '20241115', '20240310상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'JPNwin20240128', festivalseq.nextval ), 'win', 'JPN', '일본', '나고야 킨테츠 철도 축제', '20240128', '20240310', '20240125상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'NORwin20241225', festivalseq.nextval ), 'win', 'NOR', '노르웨이', '트롬쇠 오로라 축제', '20241225', '20240125', '20240222상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );
 insert into festival values (  concat( 'CANwin20240215', festivalseq.nextval ), 'win', 'CAN', '캐나다', '오타와 윈터루드', '20240215', '20240222', '상세내역1', '상세내역2', '상세내역3', 'URL1', 'URL2', 'URL3' );

commit;

select * from festival;