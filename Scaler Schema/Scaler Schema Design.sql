--  Create Scaler Database
Create Database Scaler;
use scaler;

-- 1. Basic Table : Students
Create table stundets(
	students_id INT NOT NULL auto_increment,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL unique,
    phone INT NOT NULL UNIQUE,
    curr_batch_id INT NOT NULL,
    psp INT NOT NULL,
    attendance INT NOT NULL,
    primary key (students_id),
    foreign key (curr_batch_id) references batches(batch_id)
);

-- 2. Basic Table : Batches
Create Table batches(
	batch_id INT NOT NULL auto_increment,
    batch_name VARCHAR(255) NOT NULL,
    primary key(batch_id)
);

-- 3. Basic Table : Classses
Create Table classes(
	class_id INT NOT NULL auto_increment,
    class_topic varchar(255) NOT NULL,
    primary key (class_id)
);

-- 4. Baosc Table : Instructor 
create table instructor(
	instructor_id INT NOT NULL auto_increment,
    instructor_name VARCHAR(255) NOT NULL,
    primary key(instructor_id)
);

-- 5. Basic Table : Assignment
create table assignment(
	assignment_id INT NOT NULL auto_increment,
    questions_name VARCHAR(255) NOT NULL,
    primary key(assignment_id)
);

-- 6. Basic Table : Assignment
create table homework(
	homework_id INT NOT NULL auto_increment,
    questions_name VARCHAR(255) NOT NULL,
    primary key(homework_id)
);

-- 7. Basic Table : Prelecture Content
create table prelecture_content(
	prelecture_id INT NOT NULL auto_increment,
    file_name VARCHAR(255) NOT NULL,
    primary key(prelecture_id)
);

-- 8. Baisc Table : Prelecture Notes
create table lecture_notes(
	notes_id INT NOT NULL auto_increment,
    file_name VARCHAR(255) NOT NULL,
    primary key(notes_id)
);


-- Mapping Table : Previous Batch
create table previous_batch(
	student_id INT NOT NULL,
    batch_id INT NOT NULL,
    primary key(student_id, batch_id),
    foreign key(student_id) references students(students_id),
    foreign key(batch_id) references batches(batch_id)
);

-- Mapping Table : batch_class
create table batch_class(
	batch_class_id INT NOT NULL auto_increment,
    batch_id INT NOT NULL,
    class_id INT NOT NULL,
    primary key(batch_class_id),
    foreign key(batch_id) references batches(batch_id),
    foreign key(class_id) references classes(class_id)
);

-- Mapping Table : batch_class_instructor
create table batch_class_instructor(
	batch_class_id INT NOT NULL,
    instructor_id INT NOT NULL,
    primary key(batch_class_id, instructor_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(instructor_id) references instructor(instructor_id)
);

-- Mapping Table : batch_class_assignment
create table batch_class_assignment(
	batch_class_assignment_id INT NOT NULL auto_increment,
    batch_class_id INT NOT NULL,
    assignment_id INT NOT NULL,
    primary key(batch_class_assignment_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(assignment_id) references assignment(assignment_id)
);

-- Mapping Table : batch_class_homework
create table batch_class_homework(
	batch_class_homework_id INT NOT NULL auto_increment,
    batch_class_id INT NOT NULL,
    homework_id INT NOT NULL,
    primary key(batch_class_homework_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(homework_id) references homework(homework_id)
);

-- Mapping Table : prelecture_content
create table batch_class_prelecture_content(
    batch_class_id INT NOT NULL,
    prelecture_id INT NOT NULL,
    primary key(batch_class_id, prelecture_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(prelecture_id) references prelecture_content(prelecture_id)
);

-- Mapping Table : lecture_notes
create table batch_class_lecture_notes(
    batch_class_id INT NOT NULL,
    notes_id INT NOT NULL,
    primary key(batch_class_id, notes_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(notes_id) references lecture_notes(notes_id)
);

-- LookUp table for status of assignment, homework
create table status_lookup(
	id INT NOT NULL auto_increment,
    status VARCHAR(255) NOT NULL,
    primary key(id)
);

-- Mapping Table : Assignmnet Status
create table status_assignment(
	student_id INT NOT NULL,
    batch_class_assignment_id INT NOT NULL,
    status_id INT NOT NULL,
    primary key(student_id, batch_class_assignment_id),
    foreign key(student_id) references students(students_id),
    Foreign key(batch_class_assignment_id) references batch_class_assignment(batch_class_assignment_id),
    Foreign Key(status_id) references status_lookup(id)
);

-- Mapping Table : Homework Status
create table status_homework(
	student_id INT NOT NULL,
    batch_class_homework_id INT NOT NULL,
    status_id INT NOT NULL,
    primary key(student_id, batch_class_homework_id),
    foreign key(student_id) references students(students_id),
    Foreign key(batch_class_homework_id) references batch_class_homework(batch_class_homework_id),
    foreign key(status_id) references status_lookup(id)
);

-- Mapping Table : Feedback Rating 
create table feedback_rating(
	batch_class_id INT NOT NULL,
    student_id INT NOT NULL,
    rating INT check (rating Between 1 and 10),
    feedback VARCHAR(255),
    primary key(batch_class_id, student_id),
    foreign key(batch_class_id) references batch_class(batch_class_id),
    foreign key(student_id) references students(students_id)
);