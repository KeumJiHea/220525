create table testfunc(id number, num varchar2(20));
insert into testfunc values(1, '34.5678');
select * from testfunc where id = 1;

select round(num, 2) from testfunc where id = 1;
-- round(num,n) num�� �Ҽ��� n�ڸ����� ǥ��(�ݿø���)
select round(num/2, 1) from testfunc where id = 1;
-- num�� 2�� ������ �Ҽ��� 1�ڸ����� ǥ��

select trunc(num, 2) from testfunc where id = 1;
-- trunc(num, n) num�� �Ҽ��� n�ڸ����� ǥ��(���� ó�� ��)

insert into testfunc values(2, '55');
select mod(num, 2) from testfunc where id = 2;
-- mod(num, n) num�� n�� ���� ������ ���� ������

-- id 1~10���� �� 10���� �����Ͻÿ�
insert into testfunc values(3, '68536');
insert into testfunc values(4, '784531');
insert into testfunc values(5, '32684');
insert into testfunc values(6, '685332');
insert into testfunc values(7, '11832');
insert into testfunc values(8, '2558');
insert into testfunc values(9, '753285');
insert into testfunc values(10, '36821');

-- id 1~10 ���̿� �ִ� Ȧ�� id ���� ��� ����Ͻÿ�
select * from testfunc where mod(id, 2)=1;

-- id 1~10 ���̿� �ִ� ¦�� id�� ��(num)���� 2�� ���� ��
-- �Ҽ��� 2�ڸ����� ǥ���Ͻÿ�(�������� �Ҽ����� �ݿø����� �����Ͻÿ�)

select round(num/2,2) from testfunc where mod(id, 2) = 0;

-- upper: ��� ���ڸ� �빮�ڷ� ��ȯ
-- lower: ��� ���ڸ� �ҹ��ڷ� ��ȯ
-- initcap: ��� ������ ù��°(&���� ����) ���ڸ� �빮�ڷ� ��ȯ

insert into testfunc values(11, 'welcome To oracle');
select * from testfunc where id = 11;
select upper(num) from testfunc where id = 11;
select lower(num) from testfunc where id = 11;
select initcap(num) from testfunc where id = 11;

create table testCompany(
  name varchar2(20),
  ���� varchar2(20),
  class varchar2(20)
);
insert into testCompany values('hong gil dong_M','3600','Manager');
insert into testCompany values('kim gea ddong_M','2555','ManaGer');
insert into testCompany values('Go gil dong_M','2800','ManaGER');
insert into testCompany values('hong gil dong_E','3111','EmpLoyee');
insert into testCompany values('kim gea ddong_E','2600','EmpLoYee');
insert into testCompany values('Go gil dong_E','2950','employee');

-- ������ manager�� ����� �˻��Ͽ� ���
select * from testCompany where lower(class) = 'manager'; 

-- ������ employee�̸鼭 ������ 2800 �̻��� ����� ��� ���
select * from testcompany
where lower(class) = 'employee' and "����" >= 2800; 

-- ������� �̸� ù��° ���ڴ� �빮�ڷ� ����ϰ� �� �� �޿��� ���
-- �Ҽ��� ���ϴ� ����
select initcap(name), trunc("����"/12) from testcompany;

create table testClass(class varchar2(10), score number);
insert into testClass values('A��',11);
insert into testClass values('A��',12);
insert into testClass values('A��',13);
insert into testClass values('B��',21);
insert into testClass values('B��',22);
insert into testClass values('B��',23);
insert into testClass values('1',31);
insert into testClass values('1',32);
insert into testClass values('1',33);
insert into testClass values('',40);

select * from testclass;
select sum(score) from testclass;
select avg(score) from testclass;
select max(score), min(score) from testclass;
select count(class) from testclass; -- ����ִ� ���� ���� ����
select count(*) from testclass; -- ���� ���� �Ǿ��ִ� ��θ� ������

select class, sum(score) from testclass group by class;
-- class��� ������ �׷� ��� score�� ���� ������
select class, sum(score) from testclass group by class
                                             having sum(score) > 40;
-- group���� ������ �ޱ� ���ؼ��� having ���(where�� ����ϰ� ���)


-- �� Ŭ���� ������ ���
select class, count(*) from testclass group by class;

-- �� Ŭ���� ���� ����� ���ϰ� ��� �� ������������ �����Ϸ� ���
select class, avg(score) from testclass -- Ŭ������ ��� ���
group by class -- Ŭ���� ����
order by avg(score) desc; -- ��� �� �������� ����

-- �� Ŭ���� ���� ���� ū ���� ���� ���� �� ���
select class, max(score), min(score) from testclass group by class;


create table testName(id varchar2(20), class varchar2(20));
insert into testName values('ȫ�浿','A��');
insert into testName values('�谳��','B��');
insert into testName values('��浿','C��');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('ȫ�浿','python',80);
insert into testLesson values('ȫ�浿','java',90);
insert into testLesson values('ȫ�浿','c���',70);
insert into testLesson values('�谳��','server2012',70);
insert into testLesson values('�谳��','linux',90);
insert into testLesson values('��浿','jsp',100);

select * from testName;
select * from testLesson;
select * from testname, testlesson;

select n.*, l.lesson, l.score -- n�� ��� �Ͱ� l�� ����, ���ھ� ������
from testname N inner join testlesson L on N.id=L.id;
-- N(testname�� ��Ī)�� L(testlesson�� ��Ī)���� id�� ���� �͵��� ������

-- id�� ȫ�浿�� ����� �������� ���
select N.*, l.lesson, l.score -- n�� ��� �Ͱ� l�� ����, ���ھ� ���
from testname N inner join testlesson L -- testname�� N���� testlesson�� L�� ��Ī �ο�
on n.id='ȫ�浿' and l.id = 'ȫ�浿'; -- n�� id�� ȫ�浿�̰� l�� id�� ȫ�浿�̸� ���

-- �� �̸�, Ŭ���� �� �հ�� ��� ���
-- id�� testname ���̺��� �޾ƿ��� �������� testlesson�� ������ �̿��ؼ� ǥ��
select N.*, sum(L.score), avg(L.score)
-- n�� ��� �׸�� l.score�� �հ�, ��� �� ����
from testname N inner join testlesson L on n.id=l.id
-- testname->N, testlesson->L�� ��Ī ���̰� join�� �� �� id�� ���� �͸�
group by N.id, N.class order by n.class asc;
-- id�� class�� �׷�ȭ�ؼ� �����ְ� class �̸� ������������ ������

select * from testlesson;
select * from testname where id= -- ��������� ȫ�浿�� �̸��� ���� ��� ���� ������
    (select id from testlesson where lesson='python'); -- ó�� ���: ȫ�浿
    -- ������ �ȿ� �ٸ� �������� ����ϴ� �� -> ��������
    
-- employee ���̺� ����ؼ� ��� �޿����� ���� �޴� ������� ���
select * from employee where salary > (select avg(salary) from employee);

-- ��� �޿����� ���� ������� ���(��, �Ｚ�� �ٴϸ� ���� ������������ ���ĵ� ��� �� ���)
select * from employee where salary <(select avg(salary) from employee)
and job = '�Ｚ' order by salary asc;


CREATE TABLE membership
(
    m_id      VARCHAR2(20)    NOT NULL, -- primary key�� ������ not null
    m_pwd     VARCHAR2(20)    NOT NULL, -- �� ���� ����� �� ����
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    , -- null�� ��� ���� ����
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

CREATE SEQUENCE board_SEQ -- ������ �̸�
START WITH 1 -- ���� �� 1
INCREMENT BY 1; -- AI(Auto Increment)�� üũ�ؼ� ���� ��(������� 1�� ����)

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date)
            values(board_seq.nextval,'aaa','����','����',sysdate);
            
select * from membership;
select * from board;

delete from board;

ALTER TABLE board -- board ���̺� ����
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
    -- ���� ���� �߰� ------���� �̸�--------        b_id�� �ܷ�Ű�� ��
        REFERENCES membership (m_id) on delete cascade;
        -- �ܷ�Ű�� �����ϴ� ����� membership ���̺��� m_id
-- => membership�� m_id�� �����ϴ� ���� board�� ���� ����

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

insert into member values('aaa', 'aaa', 'ȫ�浿', '���¥��');
insert into member values('bbb', 'bbb', '�谳��', '���˺�');
insert into member values('ccc', 'ccc', '��浿', '������');
insert into member values('ddd', 'ddd', '�踻��', '�н���');

select * from member;
select * from goods;

insert into goods values(goods_seq.nextval, 'aaa', '�ȭ', 75000, 2, 150000, sysdate);
insert into goods values(goods_seq.nextval, 'aaa', 'Ƽ����', 15000, 5, 75000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', '����', 450000, 1, 450000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', 'å', 35000, 2, 70000, sysdate);

select * from member M inner join goods G on m.m_id=g.g_id;

select m.m_id, m.m_name, g.g_name, g.g_price_sum
    from member m inner join goods g on m.m_id=g.g_id;

select m.m_id, m.m_name, m.m_addr, sum(g.g_price_sum)
    from member m inner join goods g on m.m_id=g.g_id
        group by m.m_id, m.m_name, m.m_addr;











