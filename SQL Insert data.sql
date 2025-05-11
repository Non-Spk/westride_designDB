-- insert data into major table
insert into major (major_name, department, description) values
('Computer Science', 'Engineering', 'Study of computation and programming'),
('Data Science', 'Engineering', 'Study of data analysis and machine learning'),
('Information Technology', 'Engineering', 'Study of computer systems and networks'),
('Business Administration', 'Business', 'Study of business principles and management'),
('Marketing', 'Business', 'Study of market analysis and advertising strategies');

-- insert data into student table
insert into student (first_name, last_name, email, phone, date_of_birth, major_id, enrollment_date) values
('John', 'Smith', 'john.smith@email.com', '123-456-7890', '2000-05-15', 1, '2020-08-20'),
('Emily', 'Johnson', 'emily.johnson@email.com', '234-567-8901', '2001-03-22', 2, '2021-08-15'),
('Michael', 'Williams', 'michael.williams@email.com', '345-678-9012', '1999-11-08', 1, '2019-08-25'),
('Jessica', 'Brown', 'jessica.brown@email.com', '456-789-0123', '2000-09-30', 3, '2020-08-20'),
('David', 'Jones', 'david.jones@email.com', '567-890-1234', '2002-01-14', 4, '2022-08-10'),
('Sarah', 'Davis', 'sarah.davis@email.com', '678-901-2345', '2001-07-19', 5, '2021-08-15'),
('Robert', 'Miller', 'robert.miller@email.com', '789-012-3456', '2000-12-03', 2, '2020-08-20'),
('Jennifer', 'Wilson', 'jennifer.wilson@email.com', '890-123-4567', '1999-04-25', 3, '2019-08-25'),
('Matthew', 'Moore', 'matthew.moore@email.com', '901-234-5678', '2001-10-11', 1, '2021-08-15'),
('Lisa', 'Taylor', 'lisa.taylor@email.com', '012-345-6789', '2002-02-28', 4, '2022-08-10');

-- insert data into instructor table
insert into instructor (first_name, last_name, email, phone, department_id, hire_date) values
('James', 'Anderson', 'james.anderson@techinstitute.edu', '123-123-1234', 1, '2015-08-15'),
('Patricia', 'Thomas', 'patricia.thomas@techinstitute.edu', '234-234-2345', 1, '2017-01-10'),
('Robert', 'Jackson', 'robert.jackson@techinstitute.edu', '345-345-3456', 2, '2014-05-20'),
('Mary', 'White', 'mary.white@techinstitute.edu', '456-456-4567', 2, '2016-09-01'),
('Richard', 'Harris', 'richard.harris@techinstitute.edu', '567-567-5678', 3, '2018-03-15');

-- insert data into semester table
insert into semester (semester_name, start_date, end_date, academic_year) values
('Fall', '2023-08-15', '2023-12-15', '2023-2024'),
('Spring', '2024-01-15', '2024-05-15', '2023-2024'),
('Summer', '2024-06-01', '2024-07-31', '2023-2024'),
('Fall', '2024-08-15', '2024-12-15', '2024-2025'),
('Spring', '2025-01-15', '2025-05-15', '2024-2025');

-- insert data into course table
insert into course (course_code, course_name, description, credit_hours, major_id) values
('CS101', 'Introduction to Programming', 'Fundamentals of programming concepts and problem-solving', 3, 1),
('CS201', 'Data Structures', 'Study of data structures and algorithms', 4, 1),
('DS101', 'Data Analysis Fundamentals', 'Introduction to data analysis and visualization', 3, 2),
('DS201', 'Machine Learning Basics', 'Introduction to machine learning algorithms', 4, 2),
('IT101', 'Computer Networks', 'Introduction to computer networking concepts', 3, 3),
('IT201', 'Database Management', 'Design and implementation of database systems', 4, 3),
('BA101', 'Principles of Management', 'Introduction to management concepts', 3, 4),
('BA201', 'Financial Accounting', 'Study of financial accounting principles', 4, 4),
('MK101', 'Marketing Fundamentals', 'Introduction to marketing concepts', 3, 5),
('MK201', 'Digital Marketing', 'Study of digital marketing strategies', 4, 5);

-- insert data into course_section table
insert into course_section (course_id, instructor_id, semester_id, section_number, classroom, schedule, max_capacity) values
(1, 1, 1, 'A', 'Room 101', 'Monday, Wednesday 10:00-11:30', 30),
(1, 2, 1, 'B', 'Room 102', 'Tuesday, Thursday 14:00-15:30', 30),
(2, 1, 2, 'A', 'Room 201', 'Monday, Wednesday 13:00-14:30', 25),
(3, 3, 1, 'A', 'Room 103', 'Monday, Wednesday 15:00-16:30', 30),
(4, 3, 2, 'A', 'Room 202', 'Tuesday, Thursday 10:00-11:30', 25),
(5, 4, 1, 'A', 'Room 104', 'Tuesday, Thursday 13:00-14:30', 30),
(6, 4, 2, 'A', 'Room 203', 'Monday, Wednesday 10:00-11:30', 25),
(7, 5, 1, 'A', 'Room 105', 'Monday, Wednesday 16:00-17:30', 35),
(8, 5, 2, 'A', 'Room 204', 'Tuesday, Thursday 15:00-16:30', 30),
(9, 5, 1, 'A', 'Room 106', 'Tuesday, Thursday 16:00-17:30', 35),
(10, 5, 2, 'A', 'Room 205', 'Monday, Wednesday 14:00-15:30', 30),
(1, 1, 2, 'A', 'Room 101', 'Monday, Wednesday 10:00-11:30', 30),
(3, 3, 2, 'A', 'Room 103', 'Monday, Wednesday 15:00-16:30', 30),
(5, 4, 2, 'A', 'Room 104', 'Tuesday, Thursday 13:00-14:30', 30),
(7, 5, 2, 'A', 'Room 105', 'Monday, Wednesday 16:00-17:30', 35),
(9, 5, 2, 'A', 'Room 106', 'Tuesday, Thursday 16:00-17:30', 35);

-- insert data into enrollment table
insert into enrollment (student_id, course_section_id, enrollment_date, grade, final_score) values
(1, 1, '2023-08-10', 'A', 92.5),
(1, 4, '2023-08-10', 'B+', 87.0),
(1, 7, '2023-08-10', 'A-', 90.0),
(2, 1, '2023-08-11', 'B', 85.5),
(2, 6, '2023-08-11', 'A', 94.0),
(2, 9, '2023-08-11', 'B+', 88.5),
(3, 2, '2023-08-09', 'C+', 78.0),
(3, 5, '2023-08-09', 'B-', 82.0),
(3, 8, '2023-08-09', 'B', 84.5),
(4, 2, '2023-08-12', 'A-', 91.0),
(4, 6, '2023-08-12', 'B+', 87.5),
(4, 9, '2023-08-12', 'A', 95.0),
(5, 3, '2024-01-10', 'B+', 88.0),
(5, 12, '2024-01-10', 'A-', 90.5),
(5, 14, '2024-01-10', 'B', 85.0),
(6, 3, '2024-01-09', 'A', 93.5),
(6, 13, '2024-01-09', 'B-', 82.5),
(6, 16, '2024-01-09', 'B+', 87.0),
(7, 3, '2024-01-11', 'B', 84.0),
(7, 13, '2024-01-11', 'A', 96.0),
(7, 15, '2024-01-11', 'A-', 91.5),
(8, 3, '2024-01-08', 'C', 75.0),
(8, 14, '2024-01-08', 'B+', 88.0),
(8, 16, '2024-01-08', 'B', 86.5),
(9, 3, '2024-01-12', 'A', 95.5),
(9, 12, '2024-01-12', 'A-', 92.0),
(9, 15, '2024-01-12', 'B+', 89.0),
(10, 3, '2024-01-07', 'B-', 81.5),
(10, 13, '2024-01-07', 'C+', 79.0),
(10, 16, '2024-01-07', 'B', 83.5);
