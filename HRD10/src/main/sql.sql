commit;
truncate table TBL_vote_202005;
select * from TBL_vote_202005;
select * from TBL_member_202005;
select * from TBL_party_202005;

CREATE table TBL_vote_202005( --v
v_jumin char(13) primary key,
v_name varchar(20),
m_no char(1),
v_time char(4),
v_area char(20),
v_confirm char(1)
);
CREATE table TBL_member_202005( --m
m_no char(1) primary key,
m_name varchar2(20),
p_code char(2),
p_school char(1),
m_jumin char(13),
m_city varchar2(20)
);
CREATE table TBL_party_202005( --p
p_code char(2) primary key,
p_name varchar2(20),
p_indate date,
p_reader varchar2(20),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4)
);

insert into TBL_member_202005 values('1','김후보','P1','1','6603011999991','수선화동');
insert into TBL_member_202005 values('2','이후보','P2','3','5503011999991','민들레동');
insert into TBL_member_202005 values('3','박후보','P3','2','7703011999991','나팔꽃동');
insert into TBL_member_202005 values('4','조후보','P4','2','8803011999991','진달래동');
insert into TBL_member_202005 values('5','최후보','P5','3','9903011999991','개나리동');

insert into TBL_party_202005 values('P1','A정당',to_date(20100101),'위대표','02','1111','0001');
insert into TBL_party_202005 values('P2','B정당',to_date(20100201),'명대표','02','1111','0002');
insert into TBL_party_202005 values('P3','C정당',to_date(20100301),'기대표','02','1111','0003');
insert into TBL_party_202005 values('P4','D정당',to_date(20100401),'옥대표','02','1111','0004');
insert into TBL_party_202005 values('P5','E정당',to_date(20100501),'임대표','02','1111','0005');
---------------------------------------------------------------------------------------

select m.m_no,p.p_name,decode(m.p_school,'1','고졸','2','학사','3','석사','4','박사'),substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,7),m.m_city,RTRIM(p.p_tel1)||'-'||p.p_tel2||'-'||p.p_tel3 from TBL_member_202005 m join TBL_party_202005 p on m.p_code = p.p_code;

insert into TBL_vote_202005 values(?,?,?,?,?,?);

select v_name,'19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일','만 '||(2020-TO_NUMBER('19'||substr(v_jumin,1,2)))||'세',decode(substr(v_jumin,7,1),'1','남','2','여'),m_no,substr(v_time,1,2)||':'||substr(v_time,3,2),decode(v_confirm,'y','확인','n','미확인') from TBL_vote_202005 where v_area = '제1투표장';

select m.m_no,m.m_name,count(v.m_no) from TBL_member_202005 m left join TBL_vote_202005 v on m.m_no = v.m_no group by m.m_no,m.m_name order by count(v.m_no);
