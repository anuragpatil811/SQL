Create database exam;
USE exam;
CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10)
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(100),
    exam_date DATE
);

-- Create the subjects dimension table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Create the exam_results fact table
CREATE TABLE exam_results (
    result_id INT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    subject_id INT,
    marks_obtained INT,
    total_marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Insert data into students table
INSERT INTO students (student_id, name, age, gender) VALUES
(1, 'Alice', 20, 'Female'),
(2, 'Bob', 21, 'Male'),
(3, 'Charlie', 22, 'Male');

-- Insert data into exams table
INSERT INTO exams (exam_id, exam_name, exam_date) VALUES
(1, 'Mid Term Exam', '2024-06-01'),
(2, 'Final Exam', '2024-12-01');

-- Insert data into subjects table
INSERT INTO subjects (subject_id, subject_name) VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry');

-- Insert data into exam_results table
INSERT INTO exam_results (result_id, student_id, exam_id, subject_id, marks_obtained, total_marks) VALUES
(1, 1, 1, 1, 85, 100),
(2, 2, 1, 2, 78, 100),
(3, 3, 1, 3, 90, 100),
(4, 1, 2, 1, 88, 100),
(5, 2, 2, 2, 82, 100),
(6, 3, 2, 3, 87, 100);
SELECT students.name, AVG(marks_obtained) AS average_marks
FROM exam_results
JOIN students ON exam_results.student_id = students.student_id
GROUP BY students.name;

SELECT subjects.subject_name, MAX(marks_obtained) AS highest_marks
FROM exam_results
JOIN subjects ON exam_results.subject_id = subjects.subject_id
GROUP BY subjects.subject_name;

SELECT students.name, SUM(marks_obtained) AS total_marks
FROM exam_results
JOIN students ON exam_results.student_id = students.student_id
GROUP BY students.name;

SELECT exams.exam_name, AVG(marks_obtained) AS average_marks
FROM exam_results
JOIN exams ON exam_results.exam_id = exams.exam_id
GROUP BY exams.exam_name;

SELECT students.name, exams.exam_name, subjects.subject_name, marks_obtained
FROM exam_results
JOIN students ON exam_results.student_id = students.student_id
JOIN exams ON exam_results.exam_id = exams.exam_id
JOIN subjects ON exam_results.subject_id = subjects.subject_id
WHERE marks_obtained > 85;
