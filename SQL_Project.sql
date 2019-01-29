Create database elementary_students;

use elementary_students;

create table school
(school_id int(5) not null,
school_name char(50) not null,
addr varchar(50) not null,
county char(20) not null,
city char(20) not null,
state char(20) not null,
zip int(5) not null,
primary key (school_id)
);

insert into school 
(school_id, school_name, addr, county, city, state, zip)
values
(100, 'Graham Elementary School', '11211 Tom Adams Dr', 'Hays', 'Austin', 'Texas', 78753),
(101, 'Live Oak Elementary School', '8607 Anderson Mill Rd', 'Travis', 'Austin', 'Texas', 78729),
(102, 'Lakeway Elementary School', '1701 Lohmans Crossing Rd', 'Travis', 'Austin', 'Texas', 78734),
(103, 'Rosemont Elementary School', '719 N Montclair Ave', 'Dallas', 'Dallas', 'Texas', 75208),
(104, 'Carroll Academy', '423 W Gulf Bank Rd', 'Galveston', 'Houston', 'Texas', 77037);

create table student
(student_id int(5) not null,
student_name char(30) not null,
gender char(6) not null,
grade_level int(5) not null,
school_id int not null,
foreign key (school_id) references school(school_id),
primary key (student_id)
);

create table test
(reg_id int(5) not null,
student_id int not null,
foreign key (student_id) references student(student_id),
school_id int(5) not null,
foreign key (school_id) references school(school_id),
test_date date not null,
grade char(1) not null,
primary key (reg_id)
);

insert into test
(reg_id, student_id, school_id, test_date, grade)
values
(1, 221, 100, '2018-05-18', 'A'),
(2, 222, 100, '2018-05-18', 'B'),
(3, 223, 100, '2018-05-18', 'F'),
(4, 224, 100, '2018-05-18', 'D'),
(5, 225, 100, '2018-05-18', 'A'),
(6, 201, 101, '2018-05-18', 'C'),
(7, 202, 101, '2018-05-18', 'A'),
(8, 203, 101, '2018-05-18', 'F'),
(9, 204, 101, '2018-05-18', 'B'),
(10, 205, 101, '2018-05-18', 'A'),
(11, 206, 102, '2018-05-18', 'A'),
(12, 207, 102, '2018-05-18', 'F'),
(13, 208, 102, '2018-05-18', 'A'),
(14, 209, 102, '2018-05-18', 'F'),
(15, 210, 102, '2018-05-18', 'D'),
(16, 211, 103, '2018-05-21', 'A'),
(17, 212, 103, '2018-05-21', 'F'),
(18, 213, 103, '2018-05-21', 'B'),
(19, 214, 103, '2018-05-21', 'F'),
(20, 215, 103, '2018-05-21', 'F'),
(21, 216, 104, '2018-05-22', 'A'),
(22, 217, 104, '2018-05-22', 'B'),
(23, 218, 104, '2018-05-22', 'C'),
(24, 219, 104, '2018-05-22', 'A'),
(25, 220, 104, '2018-05-22', 'D');

insert into student
(student_id, student_name, gender, grade_level, school_id)
values
(201, 'Everett Thibodeau', 'Male', 5, 101),
(202, 'Gustavo Chavez', 'Male', 5, 101),
(203, 'Terisa Trogdon', 'Female', 5, 101),
(204, 'Brandi Cowans', 'Female', 5, 101),
(205, 'Jesenia Nicoll', 'Female', 5, 101),
(206, 'Shery Eicher', 'Female', 5, 102),
(207, 'Ciara Kunkle', 'Female', 5, 102),
(208, 'Mirna Bremner', 'Female', 5, 102),
(209, 'Herschel Keil', 'Male', 5, 102),
(210, 'Stacey Clampitt', 'Male', 5, 102),
(211, 'Edison Kuether', 'Male', 5, 103),
(212, 'Stanford Amaral', 'Male', 5, 103),
(213, 'Lacy Doom', 'Male', 5, 103),
(214, 'Nikia Cullinan', 'Female', 5, 103),
(215, 'Mike Lapointe', 'Male', 5, 103),
(216, 'Margo Diggins', 'Female', 5, 104),
(217, 'Shirleen Wainright', 'Female', 5, 104),
(218, 'Piedad Mcjunkin', 'Female', 5, 104),
(219, 'Sparkle Silveria', 'Female', 5, 104),
(220, 'Gilda Hanselman', 'Female', 5, 104),
(221, 'Quincy Synder', 'Male', 5, 100),
(222, 'Alberto Vo', 'Male', 5, 100),
(223, 'Jefferson Strassburg', 'Male', 5, 100),
(224, 'Warner Vicini', 'Male', 5, 100),
(225, 'Renato Evert', 'Male', 5, 100);

ALTER TABLE test CHANGE grade test_grade char(1);

#general report of all tables combined
SELECT student_name as 'Student Name', school_name as 'School Name', county as 'County', city as 'City', test_grade as 'Grade'
from student INNER JOIN school using(school_id)
inner join test using(student_id);

#students who passed 5th grade and eligible to advance to 6th grade:
SELECT student_name as 'Student Name', school_name as 'School Name', county as 'County', city as 'City', test_grade as 'Grade'
from student INNER JOIN school using(school_id)
inner join test using(student_id)
where test_grade != 'D' and test_grade !='F';

#count of grade A's in each school:
select school_id as School_ID, school_name as 'School Name', county, city, count(test_grade) as Count_Grade_A
from school inner join test using(school_id)
where test_grade = 'A'
Group by school_id
Order by school_id;


