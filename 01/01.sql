use sqlclass1;
create table student
(
	Roll_no int primary key not null,
    S_name varchar(20),
    Marks int,
    Grade varchar(5),
    Cert_no varchar(20),
    Reg_no varchar(20)
);
desc student;
insert into student values(1,'Tanmoy',780,'A','C001','Reg001');
insert into student values(2, 'Arnav', 850, 'A+', 'C002', 'Reg002');
insert into student values(3, 'Riya', 620, 'B', 'C003', 'Reg003');
insert into student values(4, 'Ishaan', 910, 'AA', 'C004', 'Reg004');
insert into student values(5, 'Anika', 470, 'D', 'C005', 'Reg005');
insert into student values(6, 'Vikram', 770, 'A', 'C006', 'Reg006');
insert into student values(7, 'Mira', 550, 'C', 'C007', 'Reg007');
insert into student values(8, 'Shaan', 690, 'B+', 'C008', 'Reg008');
insert into student values(9, 'Priya', 890, 'A+', 'C009', 'Reg009');
insert into student values(10, 'Amit', 300, 'F', '', 'Reg010');
insert into student values(11, 'Nina', 720, 'B', 'C010', 'Reg011');
insert into student values(12, 'Kabir', 640, 'C', 'C011', 'Reg012');
insert into student values(13, 'Zoya', 860, 'A+', 'C012', 'Reg013');
select * from student;
create table teacher
(
	T_id varchar(20),
    T_name varchar(20),
    Address varchar(20),
    Fees int,
    Roll_no int references student (Roll_no)
);
desc teacher;
insert into teacher values('T001','Soumen Das','Salt Lake',900,15);
insert into teacher values('T002','Rajesh Mondal','Teghoria',900,7);
insert into teacher values('T003','Arup Kundu','Ultadanga',900,4);
insert into teacher values('T001','Soumen Das','Salt Lake',900,12);
insert into teacher values('T001','Soumen Das','Salt Lake',900,11);
insert into teacher values('T002','Rajesh Mondal','Teghoria',900,8);
insert into teacher values('T003','Arup Kundu','Ultadanga',900,10);
insert into teacher values('T004','Ashu Sir','Salt Lake',500,1);
insert into teacher values('T004','Ashu Sir','Salt Lake',500,2);
insert into teacher values('T005','Pranab Saha','Kestopur',1000,6);
insert into teacher values('T005','Pranab Saha','Kestopur',1000,9);
insert into teacher values('T001','Soumen Das','Salt Lake',900,8);
insert into teacher values('T002','Rajesh Mondal','Teghoria',900,10);
insert into teacher values('T003','Arup Kundu','Ultadanga',900,11);
insert into teacher values('T003','Arup Kundu','Ultadanga',900,3);
select * from teacher;
update teacher set roll_no=7 where roll_no=15;
select s.s_name,s.Marks,s.grade,t.t_name,t.address,t.fees from student s,teacher t where s.Roll_no=t.Roll_no;
select count(*) from teacher;
select t_name,count(*) as No_of_Student from teacher group by t_name;
select sum(fees) from teacher;
select t_name,sum(fees) as Total_Income from teacher group by t_name;
select t_name,sum(fees) as Total_Income from teacher group by t_name having count(t_id)>2;
select t_name,sum(fees) as Total_Income from teacher group by t_name having count(*)>2;
select t_name,sum(fees) as Total_Income from teacher group by t_name order by Total_Income asc;
select t_name,sum(fees) as Total_Income from teacher group by t_name order by Total_Income desc;
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and s.marks>=800;
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name like 'S%';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name not like 'S%';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name like '%a';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name not like '%a';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name like 'N___';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and (S_name='Tanmoy' or S_name='Kabir');
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and not (S_name='Tanmoy' or S_name='Kabir');
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name in ('Tanmoy','Kabir');
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name not in ('Tanmoy','Kabir');
select s.S_Name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s,teacher t where s.Roll_no=t.Roll_no and s.Marks between 650 and 900;
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name='Tanmoy';
select s.s_name, s.Marks, s.grade, t.t_name, t.fees, t.address from student s, teacher t where s.Roll_no=t.Roll_no and S_name<>'Tanmoy';
select * from teacher where fees>=(select avg(fees) as Average_Income from teacher);