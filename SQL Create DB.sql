create database tech_institute;
use tech_institute;


create table major (
    major_id int primary key auto_increment,
    major_name varchar(100) not null,
    department varchar(100) not null,
    description text,
    unique key uk_major_name (major_name)
);


create table student (
    student_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null,
    phone varchar(20),
    date_of_birth date,
    major_id int,
    enrollment_date date not null,
    unique key uk_student_email (email),
    foreign key (major_id) references major(major_id)
);


create table instructor (
    instructor_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null,
    phone varchar(20),
    department_id int,
    hire_date date,
    unique key uk_instructor_email (email)
);


create table semester (
    semester_id int primary key auto_increment,
    semester_name varchar(50) not null,
    start_date date not null,
    end_date date not null,
    academic_year varchar(20) not null,
    unique key uk_semester_name_year (semester_name, academic_year)
);


create table course (
    course_id int primary key auto_increment,
    course_code varchar(20) not null,
    course_name varchar(100) not null,
    description text,
    credit_hours int not null,
    major_id int,
    unique key uk_course_code (course_code),
    foreign key (major_id) references major(major_id),
    check (credit_hours > 0)
);


create table course_section (
    course_section_id int primary key auto_increment,
    course_id int not null,
    instructor_id int not null,
    semester_id int not null,
    section_number varchar(10) not null,
    classroom varchar(50),
    schedule varchar(100),
    max_capacity int not null default 30,
    unique key uk_course_section (course_id, semester_id, section_number),
    foreign key (course_id) references course(course_id),
    foreign key (instructor_id) references instructor(instructor_id),
    foreign key (semester_id) references semester(semester_id),
    check (max_capacity > 0)
);


create table enrollment (
    enrollment_id int primary key auto_increment,
    student_id int not null,
    course_section_id int not null,
    enrollment_date date not null,
    grade varchar(2),
    final_score decimal(5,2),
    unique key uk_student_section (student_id, course_section_id),
    foreign key (student_id) references student(student_id),
    foreign key (course_section_id) references course_section(course_section_id),
    check (final_score is null or (final_score >= 0 and final_score <= 100))
);