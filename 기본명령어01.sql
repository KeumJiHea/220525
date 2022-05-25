create TABLE person(
    num number,
    name VARCHAR2(10),
    birth VARCHAR2(10),
    tel VARCHAR2(20),
    primary key(num)
);

insert into person values(1002, '박유덕', '19830317', '01019830317');
insert into person(num, tel, name, birth) 
values(1001, '01041100072', '금지혜', '19970820');
insert into person values(1000, '박정원', '19871109', '01019871109');

select * from person;
select name, tel from person;
-- 주석
-- select 조회를 할 때 이용한다
-- 특정 정보만 보고 싶을 때는 where 절 사용
select * from person where num=1000;
select * from person where name = '박유덕';

delete from person;
delete from person where num = 1001;

select * from person;

update person set name = '박날치', birth = '1212' where num = 1002;
-- 정보 수정할 때 쓰는 구문 update

commit; -- 커밋 전에는 실질적인 db에 올라가지 않음(cmd 창에서 확인 불가)

rollback; -- 직전 커밋으로 돌아감


create table student(
    id varchar2(10), -- id varchar2(10) primary key, 로 만들어도 됨
    name VARCHAR2(10),
    kor VARCHAR2(10),
    eng VARCHAR2(10),
    math VARCHAR2(10),
    PRIMARY KEY(id)
);

insert into student values(1000, '박유덕', '100', '90', '80');
insert into student values(1001, '박정원', '90', '100', '80');
insert into student values(1002, '박좌헌', '80', '90', '100');

update student set kor = '100', eng = '100', math = '100' where id = 1000;

commit;

delete from student;

rollback;

select * from student;


create table test_table(num number);

desc test_table;
-- 테이블 확인
alter table test_table add(name varchar2(20)); -- 칼럼 추가
alter table test_table modify(name number); --칼럼 유형 변경
alter table test_table rename column name to nane_nnn; --칼럼 이름 변경
alter table test_table drop column nane_nnn; --칼럼 삭제

drop table test_table; --해당 테이블 삭제
drop user melonar; --해당 계정 삭제(사용 중인 계정은 사용 불가)

create user test123 IDENTIFIED by 1234;
select * from all_users; --현재 존재하는 계정 전부 보여줌
drop user test123;
--만약 계정 내에 table이 있을 경우 삭제 불가
drop user test123 cascade; --이걸 하면 삭제할 수 있음

select * from student;
select * from student where eng <= 90;
select * from student where math != 90;
select * from student;
select math+10 from student;
select id, name, math, math/2 from student where id = '1000';
select mod(math, 3) from student; -- mod 연산자는 %연산자와 같다. (나머지를 구해줌)

select * from student;
select * from student where kor<=80 and math=100;
select * from student where kor<=80 or math=100;
select * from student where not kor=100;

select * from student where eng>=50 and eng<=90;
select * from student where eng between 50 and 90; --위와 아래는 동일

create table test_number(
    numps number(5,2), --전체 자리수 5칸, 소숫점 2번째 자리까지 쓸 거임
    -- => 세 자리는 정수 부분 두 자리는 소수 부분이라는 뜻
    nump number(3), -- 소숫점 안 씀. 3 자리 정수라는 뜻
    num number -- 입력하는 값 그대로 칸을 만들어줌
);

insert into test_number values(1.123456, 1.123456, 1.123456);
select * from test_number; --결과 1.12, 1, 1.123456

insert into test_number values(1234.123456, 1.123456, 1.123456);
insert into test_number values(123.12, 1234, 1.123456);
--범위를 넘어서 입력 안 됨 123.123456과 123은 가능


create table test_date(my_date date);
insert into test_date values(sysdate);
insert into test_date values('1983/03/17');
insert into test_date values( '1983/03/17 2:46:53' );
select * from test_date;
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
select * from test_date where my_date < '2022/01/01';


create table employee(
name varchar2(15),
salary number,
job varchar2(20),
join_company date
);

insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');

insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현',  2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');

select * from employee;
alter session set nls_date_format = 'YYYY/MM//DD';
-- 연봉 1억 넘는 사람 출력
select * from employee where salary*12>100000000;

-- 15년도 이전에 입사한 사람의 이름과 입사년도 출력
select name, join_company from employee where join_company<'2015/01/01';

-- 급여가 280~300만원 사이에 있는 사람들 출력
select * from employee where 2800000<=salary and salary<=3000000;

-- 입사년도가 15년 이후이며 연봉이 6000만원 이상인 사람들 출력
select * from employee where join_company >= '2015/01/01' and salary*12>=60000000;

-- 회사가 삼성이거나 엘지이며 연봉이 5000만원 이상인 사람들 출력
select * from employee where (job = '삼성' or job = '엘지') and salary*12 >= 50000000;


select * from employee where name like '김%';
select * from employee where name like '%똥';
select * from employee where name like '%이%';

-- desc: 내림차순 asc: 오름차순
select * from employee order by join_company desc;
select * from employee order by join_company asc;

select * from employee order by join_company asc, name desc;


-- 회사는 오름차순으로 정렬하고 연봉은 내림차순으로 정렬
-- 이름에 '김'이 들어가며 연봉은 3000만원 이상인 사람 출력

select * from employee where name like '%김%' and salary*12 >= 30000000
order by job asc, salary desc;





