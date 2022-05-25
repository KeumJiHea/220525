create table testfunc(id number, num varchar2(20));
insert into testfunc values(1, '34.5678');
select * from testfunc where id = 1;

select round(num, 2) from testfunc where id = 1;
-- round(num,n) num을 소숫점 n자리까지 표시(반올림됨)
select round(num/2, 1) from testfunc where id = 1;
-- num을 2로 나누고 소숫점 1자리까지 표시

select trunc(num, 2) from testfunc where id = 1;
-- trunc(num, n) num을 소숫점 n자리까지 표시(버림 처리 됨)

insert into testfunc values(2, '55');
select mod(num, 2) from testfunc where id = 2;
-- mod(num, n) num을 n로 나눈 나머지 값을 보여줌

-- id 1~10까지 총 10명을 저장하시오
insert into testfunc values(3, '68536');
insert into testfunc values(4, '784531');
insert into testfunc values(5, '32684');
insert into testfunc values(6, '685332');
insert into testfunc values(7, '11832');
insert into testfunc values(8, '2558');
insert into testfunc values(9, '753285');
insert into testfunc values(10, '36821');

-- id 1~10 사이에 있는 홀수 id 값을 모두 출력하시오
select * from testfunc where mod(id, 2)=1;

-- id 1~10 사이에 있는 짝수 id의 값(num)들을 2로 나눈 후
-- 소수점 2자리까지 표현하시오(버려지는 소수점은 반올림으로 진행하시오)

select round(num/2,2) from testfunc where mod(id, 2) = 0;

-- upper: 모든 문자를 대문자로 변환
-- lower: 모든 문자를 소문자로 변환
-- initcap: 모든 문자의 첫번째(&공백 다음) 문자를 대문자로 변환

insert into testfunc values(11, 'welcome To oracle');
select * from testfunc where id = 11;
select upper(num) from testfunc where id = 11;
select lower(num) from testfunc where id = 11;
select initcap(num) from testfunc where id = 11;

create table testCompany(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);
insert into testCompany values('hong gil dong_M','3600','Manager');
insert into testCompany values('kim gea ddong_M','2555','ManaGer');
insert into testCompany values('Go gil dong_M','2800','ManaGER');
insert into testCompany values('hong gil dong_E','3111','EmpLoyee');
insert into testCompany values('kim gea ddong_E','2600','EmpLoYee');
insert into testCompany values('Go gil dong_E','2950','employee');

-- 직급이 manager인 사원을 검색하여 출력
select * from testCompany where lower(class) = 'manager'; 

-- 직급이 employee이면서 연봉이 2800 이상인 사람을 모두 출력
select * from testcompany
where lower(class) = 'employee' and "연봉" >= 2800; 

-- 모든사원의 이름 첫번째 글자는 대문자로 출력하고 한 달 급여를 출력
-- 소수점 이하는 버림
select initcap(name), trunc("연봉"/12) from testcompany;

create table testClass(class varchar2(10), score number);
insert into testClass values('A반',11);
insert into testClass values('A반',12);
insert into testClass values('A반',13);
insert into testClass values('B반',21);
insert into testClass values('B반',22);
insert into testClass values('B반',23);
insert into testClass values('1',31);
insert into testClass values('1',32);
insert into testClass values('1',33);
insert into testClass values('',40);

select * from testclass;
select sum(score) from testclass;
select avg(score) from testclass;
select max(score), min(score) from testclass;
select count(class) from testclass; -- 비어있는 값은 세지 않음
select count(*) from testclass; -- 현재 저장 되어있는 모두를 세어줌

select class, sum(score) from testclass group by class;
-- class라는 값으로 그룹 지어서 score의 합을 보여줌
select class, sum(score) from testclass group by class
                                             having sum(score) > 40;
-- group에서 조건을 달기 위해서는 having 사용(where와 비슷하게 사용)


-- 각 클래스 개수를 출력
select class, count(*) from testclass group by class;

-- 각 클래스 별로 평균을 구하고 평균 별 내림차순으로 정렬하려 출력
select class, avg(score) from testclass -- 클래스와 평균 출력
group by class -- 클래스 별로
order by avg(score) desc; -- 평균 별 내림차순 정렬

-- 각 클래스 별로 가장 큰 값과 가장 작은 값 출력
select class, max(score), min(score) from testclass group by class;


create table testName(id varchar2(20), class varchar2(20));
insert into testName values('홍길동','A반');
insert into testName values('김개똥','B반');
insert into testName values('고길동','C반');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('홍길동','python',80);
insert into testLesson values('홍길동','java',90);
insert into testLesson values('홍길동','c언어',70);
insert into testLesson values('김개똥','server2012',70);
insert into testLesson values('김개똥','linux',90);
insert into testLesson values('고길동','jsp',100);

select * from testName;
select * from testLesson;
select * from testname, testlesson;

select n.*, l.lesson, l.score -- n의 모든 것과 l의 레슨, 스코어 보여줌
from testname N inner join testlesson L on N.id=L.id;
-- N(testname의 별칭)과 L(testlesson의 별칭)에서 id가 같은 것들을 가져옴

-- id가 홍길동인 사람의 인적사항 출력
select N.*, l.lesson, l.score -- n의 모든 것과 l의 레슨, 스코어 출력
from testname N inner join testlesson L -- testname은 N으로 testlesson은 L로 별칭 부여
on n.id='홍길동' and l.id = '홍길동'; -- n의 id가 홍길동이고 l의 id도 홍길동이면 출력

-- 각 이름, 클래스 별 합계와 평균 출력
-- id는 testname 테이블에서 받아오며 나머지는 testlesson의 조인을 이용해서 표현
select N.*, sum(L.score), avg(L.score)
-- n의 모든 항목과 l.score의 합계, 평균 볼 거임
from testname N inner join testlesson L on n.id=l.id
-- testname->N, testlesson->L로 별칭 붙이고 join함 그 중 id가 같은 것만
group by N.id, N.class order by n.class asc;
-- id랑 class로 그룹화해서 보여주고 class 이름 오름차순으로 보여줘

select * from testlesson;
select * from testname where id= -- 결과적으로 홍길동과 이름이 같은 모든 내용 가져옴
    (select id from testlesson where lesson='python'); -- 처리 결과: 홍길동
    -- 쿼리문 안에 다른 쿼리문을 사용하는 것 -> 서브쿼리
    
-- employee 테이블 사용해서 평균 급여보다 많이 받는 사람들을 출력
select * from employee where salary > (select avg(salary) from employee);

-- 평균 급여보다 작은 사람들을 출력(단, 삼성을 다니며 월급 오름차순으로 정렬된 모든 값 출력)
select * from employee where salary <(select avg(salary) from employee)
and job = '삼성' order by salary asc;


CREATE TABLE membership
(
    m_id      VARCHAR2(20)    NOT NULL, -- primary key는 무조건 not null
    m_pwd     VARCHAR2(20)    NOT NULL, -- 이 값은 비워둘 수 없음
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    , -- null일 결우 생략 가능
     PRIMARY KEY (m_id)
);

CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(20)    NULL, 
    b_title      VARCHAR2(20)    NULL, 
    b_content    VARCHAR2(20)    NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

CREATE SEQUENCE board_SEQ -- 시퀀스 이름
START WITH 1 -- 시작 값 1
INCREMENT BY 1; -- AI(Auto Increment)에 체크해서 생긴 것(순서대로 1씩 증가)

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date)
            values(board_seq.nextval,'aaa','제목','내용',sysdate);
            
select * from membership;
select * from board;

delete from board;

ALTER TABLE board -- board 테이블 수정
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
    -- 제약 조건 추가 ------조건 이름--------        b_id를 외래키로 둠
        REFERENCES membership (m_id) on delete cascade;
        -- 외래키가 참조하는 대상은 membership 테이블의 m_id
-- => membership의 m_id에 존재하는 값만 board에 생성 가능

delete from membership where m_id = 'aaa';
delete from board where b_id = 'aaa';

alter table board drop constraint FK_board_b_id_membership_m_id;


CREATE TABLE member
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE goods
    ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) on delete cascade;
        
alter table goods drop constraint g_id_m_id;

insert into member values('aaa', 'aaa', '홍길동', '산골짜기');
insert into member values('bbb', 'bbb', '김개똥', '개똥별');
insert into member values('ccc', 'ccc', '고길동', '마포구');
insert into member values('ddd', 'ddd', '김말이', '분식집');

select * from member;
select * from goods;

insert into goods values(goods_seq.nextval, 'aaa', '운동화', 75000, 2, 150000, sysdate);
insert into goods values(goods_seq.nextval, 'aaa', '티셔츠', 15000, 5, 75000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', '가방', 450000, 1, 450000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', '책', 35000, 2, 70000, sysdate);

select * from member M inner join goods G on m.m_id=g.g_id;

select m.m_id, m.m_name, g.g_name, g.g_price_sum
    from member m inner join goods g on m.m_id=g.g_id;

select m.m_id, m.m_name, m.m_addr, sum(g.g_price_sum)
    from member m inner join goods g on m.m_id=g.g_id
        group by m.m_id, m.m_name, m.m_addr;











