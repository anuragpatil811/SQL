Create database exam;
USE exam;
CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10)
);
CREATE TABLE exams(
exam_id INT PRIMARY KEY,
exam_name VARCHAR(100),
exam_date date
);
CREATE TABLE subjects(
subject_id INT PRIMARY KEY,
subject_name VARCHAR(100)
);
CREATE TABLE results(
result_id INT PRIMARY KEY,
exam_id INT,
student_id INT,
subject_id INT,
marks INT,
total_marks INT,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(exam_id) REFERENCES exams(exam_id),
FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
);
INSERT INTO students (student_id, name, age, gender) VALUES
(1, 'Alice', 20, 'Female'),
(2, 'Bob', 21, 'Male'),
(3, 'Charlie', 22, 'Male'), 
(4, 'Anurag', 21, 'Male'),
(5, 'Ritesh', 20, 'Male'),
(6, 'Anil', 24, 'Male');


INSERT INTO exams (exam_id, exam_name, exam_date) VALUES
(1, 'Mid Term Exam', '2024-11-28'),
(2, 'Final Exam', '2024-11-28'),
(3, 'Final Exam',  '2024-11-28'),
(4, 'Final Exam',  '2024-11-28'),
(5, 'Final Exam',  '2024-11-28'),
(6, 'Final Exam',  '2024-11-28');
INSERT INTO subjects (subject_id, subject_name) VALUES
(1, 'Mathematics'),
(2, 'DWDM'),
(3, 'Computer Networks'), 
(4, 'Data Structures'),
(5, 'Design & Analysis of Algorithms'),
(6, 'Machine Learning');
INSERT INTO results (result_id, student_id, exam_id, subject_id, marks, total_marks) VALUES
(1, 1, 1, 1, 85, 100),
(2, 2, 1, 2, 78, 100),
(3, 3, 3, 3, 90, 100),
(4, 4, 4, 4, 88, 100),
(5, 5, 5, 5, 82, 100),
(6, 6, 6, 6, 87, 100);
SELECT students.name, AVG(marks) AS average_marks
FROM results
JOIN students ON results.student_id = students.student_id
GROUP BY students.name;

SELECT subjects.subject_name, MAX(marks) AS highest_marks
FROM results
JOIN subjects ON results.subject_id = subjects.subject_id
GROUP BY subjects.subject_name;

SELECT students.name, SUM(marks) AS total_marks
FROM results
JOIN students ON results.student_id = students.student_id
GROUP BY students.name;

SELECT exams.exam_name, AVG(marks) AS average_marks
FROM results
JOIN exams ON results.exam_id = exams.exam_id
GROUP BY exams.exam_name;

SELECT students.name, exams.exam_name, subjects.subject_name, marks
FROM results
JOIN students ON results.student_id = students.student_id
JOIN exams ON results.exam_id = exams.exam_id
JOIN subjects ON results.subject_id = subjects.subject_id
WHERE marks > 85;
