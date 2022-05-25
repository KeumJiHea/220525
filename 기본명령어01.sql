create TABLE person(
    num number,
    name VARCHAR2(10),
    birth VARCHAR2(10),
    tel VARCHAR2(20),
    primary key(num)
);

insert into person values(1002, '������', '19830317', '01019830317');
insert into person(num, tel, name, birth) 
values(1001, '01041100072', '������', '19970820');
insert into person values(1000, '������', '19871109', '01019871109');

select * from person;
select name, tel from person;
-- �ּ�
-- select ��ȸ�� �� �� �̿��Ѵ�
-- Ư�� ������ ���� ���� ���� where �� ���
select * from person where num=1000;
select * from person where name = '������';

delete from person;
delete from person where num = 1001;

select * from person;

update person set name = '�ڳ�ġ', birth = '1212' where num = 1002;
-- ���� ������ �� ���� ���� update

commit; -- Ŀ�� ������ �������� db�� �ö��� ����(cmd â���� Ȯ�� �Ұ�)

rollback; -- ���� Ŀ������ ���ư�


create table student(
    id varchar2(10), -- id varchar2(10) primary key, �� ���� ��
    name VARCHAR2(10),
    kor VARCHAR2(10),
    eng VARCHAR2(10),
    math VARCHAR2(10),
    PRIMARY KEY(id)
);

insert into student values(1000, '������', '100', '90', '80');
insert into student values(1001, '������', '90', '100', '80');
insert into student values(1002, '������', '80', '90', '100');

update student set kor = '100', eng = '100', math = '100' where id = 1000;

commit;

delete from student;

rollback;

select * from student;


create table test_table(num number);

desc test_table;
-- ���̺� Ȯ��
alter table test_table add(name varchar2(20)); -- Į�� �߰�
alter table test_table modify(name number); --Į�� ���� ����
alter table test_table rename column name to nane_nnn; --Į�� �̸� ����
alter table test_table drop column nane_nnn; --Į�� ����

drop table test_table; --�ش� ���̺� ����
drop user melonar; --�ش� ���� ����(��� ���� ������ ��� �Ұ�)

create user test123 IDENTIFIED by 1234;
select * from all_users; --���� �����ϴ� ���� ���� ������
drop user test123;
--���� ���� ���� table�� ���� ��� ���� �Ұ�
drop user test123 cascade; --�̰� �ϸ� ������ �� ����

select * from student;
select * from student where eng <= 90;
select * from student where math != 90;
select * from student;
select math+10 from student;
select id, name, math, math/2 from student where id = '1000';
select mod(math, 3) from student; -- mod �����ڴ� %�����ڿ� ����. (�������� ������)

select * from student;
select * from student where kor<=80 and math=100;
select * from student where kor<=80 or math=100;
select * from student where not kor=100;

select * from student where eng>=50 and eng<=90;
select * from student where eng between 50 and 90; --���� �Ʒ��� ����

create table test_number(
    numps number(5,2), --��ü �ڸ��� 5ĭ, �Ҽ��� 2��° �ڸ����� �� ����
    -- => �� �ڸ��� ���� �κ� �� �ڸ��� �Ҽ� �κ��̶�� ��
    nump number(3), -- �Ҽ��� �� ��. 3 �ڸ� ������� ��
    num number -- �Է��ϴ� �� �״�� ĭ�� �������
);

insert into test_number values(1.123456, 1.123456, 1.123456);
select * from test_number; --��� 1.12, 1, 1.123456

insert into test_number values(1234.123456, 1.123456, 1.123456);
insert into test_number values(123.12, 1234, 1.123456);
--������ �Ѿ �Է� �� �� 123.123456�� 123�� ����


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

insert into employee values('����ġ',1800000,'�Ｚ','2017/10/24');
insert into employee values('�ι�Ʈ',1850000,'����','2019/01/04');
insert into employee values('����',2200000,'����','2017/11/06');
insert into employee values('�谳��',2500000,'SK','2017/04/14');
insert into employee values('�����',2410000,'������','2018/01/09');
insert into employee values('����',1900000,'�Ｚ','2019/10/24');
insert into employee values('�Ҹ�',1800000,'����','2019/12/04');
insert into employee values('�ɽ���',4630000,'����','2015/04/02');
insert into employee values('�����',2770000,'SK','2017/01/24');
insert into employee values('�ո���',3650000,'������','2016/08/04');
insert into employee values('�Ӹ���',4210000,'�Ｚ','2015/03/18');
insert into employee values('������',2720000,'����','2017/01/04');
insert into employee values('��ġ��',4320000,'����','2015/06/07');
insert into employee values('�ȱ��',3490000,'SK','2015/09/07');
insert into employee values('��¯',2200000,'������','2017/05/04');
insert into employee values('����',1920000,'�Ｚ','2018/11/24');
insert into employee values('���',3420000,'����','2016/07/29');
insert into employee values('������',1800000,'����','2018/12/24');
insert into employee values('������',2230000,'SK','2018/01/05');
insert into employee values('�Ұ��',1800000,'������','2019/01/09');
insert into employee values('¥���',2100000,'�Ｚ','2017/10/24');
insert into employee values('�Ұ�â',2200000,'����','2017/11/04');
insert into employee values('���̽�',1950000,'����','2017/10/24');
insert into employee values('����',1800000,'SK','2018/10/24');
insert into employee values('������',1800000,'������','2019/12/07');
insert into employee values('�ϰ��',1880000,'�Ｚ','2018/11/14');
insert into employee values('���̽�',1970000,'����','2019/06/04');
insert into employee values('�ڵ���',7200000,'����','2010/01/27');
insert into employee values('�򽺺�',3570000,'SK','2015/02/17');
insert into employee values('�����',3200000,'������','2015/11/24');
insert into employee values('���̴�',2400000,'�Ｚ','2017/09/26');
insert into employee values('�踻��',7000000,'����','2010/01/21');
insert into employee values('������',6230000,'����','2011/08/19');

insert into employee values('������',3710000,'SK','2015/08/19');
insert into employee values('ȭ����',1770000,'������','2019/04/28');
insert into employee values('��ȭ��',1920000,'�Ｚ','2019/10/07');
insert into employee values('��ȿ��',2670000,'����','2017/11/24');
insert into employee values('�Ǻ���',3120000,'����','2016/05/19');
insert into employee values('�����',4190000,'SK','2015/01/02');
insert into employee values('������',4280000,'������','2015/01/02');
insert into employee values('���߱�',3700000,'�Ｚ','2016/02/17');
insert into employee values('��ȫ��',2220000,'����','2018/02/04');
insert into employee values('������',2760000,'����','2017/10/14');
insert into employee values('��â��',2620000,'SK','2017/09/04');
insert into employee values('���ڶ�',2500000,'������','2017/11/20');
insert into employee values('�߽���',1970000,'�Ｚ','2017/10/30');
insert into employee values('����',  2720000,'����','2018/11/11');
insert into employee values('������',2600000,'����','2015/11/19');
insert into employee values('������',5670000,'SK','2017/10/16');
insert into employee values('��ȿ��',3750000,'������','2015/09/15');
insert into employee values('��ä��',3400000,'�Ｚ','2016/02/09');
insert into employee values('�ְ��',8900000,'����','2010/01/04');
insert into employee values('��ȭ��',1860000,'����','2017/10/24');
insert into employee values('���빮',1790000,'SK','2017/10/24');
insert into employee values('���빮',2880000,'������','2016/02/27');
insert into employee values('�����',2320000,'�Ｚ','2016/05/24');
insert into employee values('������',1780000,'����','2019/01/09');
insert into employee values('���ҹ�',2900000,'����','2016/10/22');
insert into employee values('���ʿ�',3000000,'SK','2015/10/10');
insert into employee values('���ѱ�',3200000,'������','2015/11/11');
insert into employee values('���ѱ�',2500000,'�Ｚ','2016/12/19');
insert into employee values('¥����',1850000,'����','2018/04/03');
insert into employee values('�̽±�',1900000,'����','2018/01/01');
insert into employee values('������',1790000,'SK','2018/05/02');
insert into employee values('��Ÿ�',2700000,'������','2016/07/20');

select * from employee;
alter session set nls_date_format = 'YYYY/MM//DD';
-- ���� 1�� �Ѵ� ��� ���
select * from employee where salary*12>100000000;

-- 15�⵵ ������ �Ի��� ����� �̸��� �Ի�⵵ ���
select name, join_company from employee where join_company<'2015/01/01';

-- �޿��� 280~300���� ���̿� �ִ� ����� ���
select * from employee where 2800000<=salary and salary<=3000000;

-- �Ի�⵵�� 15�� �����̸� ������ 6000���� �̻��� ����� ���
select * from employee where join_company >= '2015/01/01' and salary*12>=60000000;

-- ȸ�簡 �Ｚ�̰ų� �����̸� ������ 5000���� �̻��� ����� ���
select * from employee where (job = '�Ｚ' or job = '����') and salary*12 >= 50000000;


select * from employee where name like '��%';
select * from employee where name like '%��';
select * from employee where name like '%��%';

-- desc: �������� asc: ��������
select * from employee order by join_company desc;
select * from employee order by join_company asc;

select * from employee order by join_company asc, name desc;


-- ȸ��� ������������ �����ϰ� ������ ������������ ����
-- �̸��� '��'�� ���� ������ 3000���� �̻��� ��� ���

select * from employee where name like '%��%' and salary*12 >= 30000000
order by job asc, salary desc;





