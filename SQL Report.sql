-- 1. รายชื่อนักศึกษาที่ลงทะเบียนในรายวิชา "Introduction to Programming"
select 
    s.student_id,
    concat(s.first_name, ' ', s.last_name) as student_name,
    s.email,
    e.enrollment_date,
    e.grade,
    e.final_score,
    sem.semester_name,
    sem.academic_year
from 
    student s
join 
    enrollment e on s.student_id = e.student_id
join 
    course_section cs on e.course_section_id = cs.course_section_id
join 
    course c on cs.course_id = c.course_id
join
    semester sem on cs.semester_id = sem.semester_id
where 
    c.course_name = 'Introduction to Programming'
order by 
    sem.academic_year, sem.semester_name, s.last_name, s.first_name;


-- 2. รายวิชาที่สอนโดยอาจารย์ชื่อ James Anderson
select 
    c.course_id,
    c.course_code,
    c.course_name,
    c.credit_hours,
    m.major_name,
    cs.section_number,
    cs.classroom,
    cs.schedule,
    sem.semester_name,
    sem.academic_year,
    count(e.student_id) as enrolled_students
from 
    instructor i
join 
    course_section cs on i.instructor_id = cs.instructor_id
join 
    course c on cs.course_id = c.course_id
join 
    major m on c.major_id = m.major_id
join
    semester sem on cs.semester_id = sem.semester_id
left join
    enrollment e on cs.course_section_id = e.course_section_id
where 
    i.first_name = 'James' and i.last_name = 'Anderson'
group by
    c.course_id, c.course_code, c.course_name, c.credit_hours, m.major_name, 
    cs.section_number, cs.classroom, cs.schedule, sem.semester_name, sem.academic_year
order by 
    sem.academic_year, sem.semester_name, c.course_code;


-- 3. รายงานผลการเรียนของนักศึกษาในภาค Fall 2023
select 
    s.student_id,
    concat(s.first_name, ' ', s.last_name) as student_name,
    m.major_name,
    c.course_code,
    c.course_name,
    c.credit_hours,
    concat(i.first_name, ' ', i.last_name) as instructor_name,
    e.grade,
    e.final_score
from 
    student s
join 
    enrollment e on s.student_id = e.student_id
join 
    course_section cs on e.course_section_id = cs.course_section_id
join 
    course c on cs.course_id = c.course_id
join 
    instructor i on cs.instructor_id = i.instructor_id
join 
    semester sem on cs.semester_id = sem.semester_id
join
    major m on s.major_id = m.major_id
where 
    sem.semester_name = 'Fall' and sem.academic_year = '2023-2024'
order by 
    s.last_name, s.first_name, c.course_code;


-- 4. คะแนนเฉลี่ยของแต่ละรายวิชา
select 
    c.course_id,
    c.course_code,
    c.course_name,
    count(e.enrollment_id) as total_enrollments,
    round(avg(e.final_score), 2) as average_score,
    (
        select count(*) 
        from enrollment e2
        join course_section cs2 on e2.course_section_id = cs2.course_section_id
        where cs2.course_id = c.course_id and e2.grade = 'A'
    ) as a_count,
    (
        select count(*) 
        from enrollment e2
        join course_section cs2 on e2.course_section_id = cs2.course_section_id
        where cs2.course_id = c.course_id and e2.grade like 'B%'
    ) as b_count,
    (
        select count(*) 
        from enrollment e2
        join course_section cs2 on e2.course_section_id = cs2.course_section_id
        where cs2.course_id = c.course_id and e2.grade like 'C%'
    ) as c_count
from 
    course c
join 
    course_section cs on c.course_id = cs.course_id
join 
    enrollment e on cs.course_section_id = e.course_section_id
group by 
    c.course_id, c.course_code, c.course_name
order by 
    average_score desc;


-- 5. นักศึกษาที่ยังไม่ลงทะเบียนเรียนในภาค Spring 2025
select 
    s.student_id,
    concat(s.first_name, ' ', s.last_name) as student_name,
    s.email,
    m.major_name,
    s.enrollment_date
from 
    student s
left join 
    major m on s.major_id = m.major_id
where 
    s.student_id not in (
        select distinct e.student_id
        from enrollment e
        join course_section cs on e.course_section_id = cs.course_section_id
        join semester sem on cs.semester_id = sem.semester_id
        where sem.semester_name = 'Spring' and sem.academic_year = '2024-2025'
    )
order by 
    s.last_name, s.first_name;


-- 6. สถิติการลงทะเบียนของแต่ละวิชาแยกตามภาคการศึกษา
select 
    sem.semester_name,
    sem.academic_year,
    c.course_code,
    c.course_name,
    count(e.enrollment_id) as enrolled_students,
    cs.max_capacity,
    round((count(e.enrollment_id) / cs.max_capacity) * 100, 2) as fill_percentage,
    round(avg(e.final_score), 2) as average_score
from 
    course c
join 
    course_section cs on c.course_id = cs.course_id
join 
    semester sem on cs.semester_id = sem.semester_id
left join 
    enrollment e on cs.course_section_id = e.course_section_id
group by 
    sem.semester_name, sem.academic_year, c.course_code, c.course_name, cs.max_capacity
order by 
    sem.academic_year, sem.semester_name, c.course_code;


-- 7. ภาระงานของอาจารย์แยกตามภาคการศึกษา
select 
    concat(i.first_name, ' ', i.last_name) as instructor_name,
    sem.semester_name,
    sem.academic_year,
    count(distinct cs.course_section_id) as sections_taught,
    sum(c.credit_hours) as total_credit_hours,
    count(distinct e.student_id) as total_students
from 
    instructor i
join 
    course_section cs on i.instructor_id = cs.instructor_id
join 
    course c on cs.course_id = c.course_id
join 
    semester sem on cs.semester_id = sem.semester_id
left join 
    enrollment e on cs.course_section_id = e.course_section_id
group by 
    i.instructor_id, sem.semester_name, sem.academic_year
order by 
    sem.academic_year, sem.semester_name, total_credit_hours desc;


-- 8. ผลการเรียนของนักศึกษาแยกตามสาขาวิชา
select 
    m.major_name,
    count(distinct s.student_id) as total_students,
    round(avg(e.final_score), 2) as average_score,
    (
        select round(avg(e2.final_score), 2)
        from enrollment e2
        join student s2 on e2.student_id = s2.student_id
        where s2.major_id = m.major_id
    ) as major_average,
    (
        select count(*) 
        from enrollment e2
        join student s2 on e2.student_id = s2.student_id
        where s2.major_id = m.major_id and e2.grade = 'A'
    ) as a_count,
    (
        select count(*) 
        from enrollment e2
        join student s2 on e2.student_id = s2.student_id
        where s2.major_id = m.major_id and e2.grade like 'B%'
    ) as b_count,
    (
        select count(*) 
        from enrollment e2
        join student s2 on e2.student_id = s2.student_id
        where s2.major_id = m.major_id and e2.grade like 'C%'
    ) as c_count
from 
    major m
join 
    student s on m.major_id = s.major_id
join 
    enrollment e on s.student_id = e.student_id
group by 
    m.major_id, m.major_name
order by 
    average_score desc;
