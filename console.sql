CREATE TABLE subject(
    id INT PRIMARY KEY ,
    name VARCHAR(40),
    surname VARCHAR(40)
);
INSERT INTO subject(id, name, surname)
VALUES (1,'Dilbara','Asanalieva'),
       (2,'Nargiza','Sultanmuratova'),
       (3,'Gulzina','Arzykulova'),
       (4,'Tursunai','Arzykulova');
SELECT * FROM  subject;

ALTER TABLE subject RENAME TO students_info; --Renamed

CREATE TABLE subjects(
    id INT PRIMARY KEY ,
    name varchar(25)

);
INSERT INTO subjects (id, name)
VALUES (1,'Mathematics'),
       (2,'Physics'),
       (3,'Chemistry'),
       (4,'Kyrgyz Language'),
       (5,'History'),
       (6,'Culinary');


CREATE TABLE teachers(
    id INT PRIMARY KEY,
    name VARCHAR(25)           --ADD TEACHER'S SUBJECT
);
INSERT INTO teachers(id, name)
VALUES (1,'Mavluda'),
       (2,'Penelope'),
       (3,'Chynara'),
       (4,'Kenny'),
       (5,'Hanna'),
       (6,'Chen');

CREATE TABLE students_subjects(
    student_id INT REFERENCES students_info(id),
    subject_id INT REFERENCES subjects(id)
);
INSERT INTO students_subjects(student_id, subject_id)
VALUES (1,1),
       (1,2),
       (1,3);

SELECT * FROM students_info;
SELECT * FROM students_subjects;

SELECT student_id,subject_id FROM students_subjects;

ALTER TABLE students_info ADD COLUMN subjects_id INT REFERENCES subjects(id);

UPDATE students_info
SET subjects_id = 1
WHERE id = 1;

UPDATE students_info
SET subjects_id = 2
WHERE id = 3;

ALTER TABLE students_info ADD COLUMN teachers_id INT REFERENCES teachers(id);

UPDATE students_info
SET teachers_id = 1
WHERE id = 2;

ALTER TABLE teachers ADD COLUMN students_id INT REFERENCES students_info(id);

UPDATE teachers
SET students_id = 2
WHERE id = 1;

CREATE TABLE rooms(
    id INT PRIMARY KEY ,
    name VARCHAR(25),
    floor INT NOT NULL
);
INSERT INTO rooms(id, name, floor)
VALUES (1,'Google',3),
       (2,'Space X',1),
       (3,'Mark Zuckerberg',2),
       (4,'Staff',2);

ALTER TABLE  students_info ADD COLUMN students_rooms INT REFERENCES rooms(id);

--ALTER TABLE students_info DROP COLUMN studemts_rooms ; DROPED BECAUSE MADE A TYPO

UPDATE students_info
SET students_rooms = 3
WHERE id = 4;

ALTER TABLE teachers ADD COLUMN teachers_room INT REFERENCES rooms(id);

UPDATE teachers
SET teachers_room = 4
WHERE id = 1 ;

CREATE TABLE staff_room(
    staff_id INT REFERENCES teachers(id),
    rooms_id INT REFERENCES rooms(id)

);
INSERT INTO staff_room(staff_id, rooms_id)
VALUES (1,4),
       (2,4),
       (3,4),
       (4,4),
       (5,4),
       (6,4);

SELECT * FROM staff_room;

CREATE TABLE tuition_fee_discounts(
    id INT PRIMARY KEY ,
    discount INT
);
INSERT INTO tuition_fee_discounts(id, discount)
VALUES (1,50),
       (2,100),
       (3,75),
       (4,0),
       (5,20),
       (6,10);

ALTER TABLE students_info ADD COLUMN discounts INT REFERENCES tuition_fee_discounts;


UPDATE  students_info
SET discounts = 1
WHERE id = 1;

UPDATE  students_info
SET discounts = 2
WHERE id = 3;

UPDATE  students_info
SET discounts = 4
WHERE id = 2;

UPDATE  students_info
SET discounts = 5
WHERE id = 4;

CREATE TABLE activities(
    id INT PRIMARY KEY ,
    name VARCHAR(20)
);

INSERT INTO activities(id, name) VALUES (1,'Dance'),
                                        (2,'Guitar'),
                                        (3,'Volleyball'),
                                        (4,'Robotics'),
                                        (5,'Sewing');

CREATE TABLE favorite_foods(
    id INT PRIMARY KEY ,
    name VARCHAR(30),
    fatness VARCHAR CHECK ( fatness = 'LOW' OR fatness = 'HIGH' )

);
INSERT INTO favorite_foods(id, name, fatness)
VALUES (1,'Manty','HIGH'),
       (2,'Lagman','HIGH'),
       (3,'Porridge','LOW'),
       (4,'Puree','LOW');

CREATE TABLE marital_status(
    id INT PRIMARY KEY ,
    status varchar CHECK ( status = 'Single' OR status = 'Married' or status = 'Divorced' or status = 'Widower')
);
INSERT INTO marital_status(id, status)
VALUES (1,'Married'),
       (2,'Divorced'),
       (3,'Single'),
       (4,'Widower'),
       (5,'Married');



CREATE TABLE cars(
    id INT PRIMARY KEY,
    model VARCHAR(30),
    year DATE,
    color VARCHAR(30)
);
INSERT INTO cars(id, model, year, color)
VALUES (1,'Lexus','2004-01-14','white'),
       (2,'BMW','2020-09-04','black'),
       (3,'Range Rover','2019-10-21','red');

CREATE TABLE teachers_car(
    teachers_id INT REFERENCES teachers(id),
    cars_id INT REFERENCES cars(id)

);
INSERT INTO teachers_car(teachers_id, cars_id)
VALUES (1,1),
       (3,2),
       (4,3),
       (1,3);

ALTER TABLE teachers ADD COLUMN marital_status INT REFERENCES marital_status(id);

UPDATE teachers
SET marital_status = 2
WHERE id = 5;

UPDATE teachers
SET marital_status = 3
WHERE id = 1;

UPDATE teachers
SET marital_status = 1
WHERE id = 6;

UPDATE teachers
SET marital_status = 4
WHERE id = 3;

UPDATE teachers
SET marital_status = 4
WHERE id = 2;

UPDATE teachers
SET marital_status = 3
WHERE id = 4;

ALTER TABLE students_info ADD COLUMN students_activity INT REFERENCES activities(id);

UPDATE students_info
SET students_activity = 1
WHERE id = 4;

UPDATE students_info
SET students_activity = 2
WHERE id = 3;

UPDATE students_info
SET students_activity = 3
WHERE id = 2;

UPDATE students_info
SET students_activity = 4
WHERE id = 1;

ALTER TABLE teachers ADD COLUMN teachers_food INT REFERENCES favorite_foods(id);

UPDATE teachers
SET teachers_food = 1
WHERE id = 2;

UPDATE teachers
SET teachers_food = 1
WHERE id = 1;

UPDATE teachers
SET teachers_food = 3
WHERE id = 4;

ALTER TABLE students_info ADD COLUMN students_food INT REFERENCES favorite_foods(id);

UPDATE students_info
SET students_food = 1
WHERE id = 1;

UPDATE students_info
SET students_food = 2
WHERE id = 2;

UPDATE students_info
SET students_food = 3
WHERE id = 3;

UPDATE students_info
SET students_food = 4
WHERE id = 4;


CREATE TABLE style(
    id INT PRIMARY KEY ,
    style VARCHAR(25)
);
INSERT INTO style(id, style)
VALUES (1,'sport'),
       (2,'casual'),
       (3,'formal');



CREATE TABLE house(
    id INT PRIMARY KEY ,
    address VARCHAR,
    price INT
);
INSERT INTO house(id, address,price)
VALUES (1,'Djal 29',500000),
       (2,'Grajdanskaya 112',75600);

CREATE TABLE additional_info (
                 id INT,
                 city VARCHAR(50),
                 website VARCHAR(50),
                 email VARCHAR(50)
);
INSERT INTO additional_info (id, city, website, email)
 VALUES (1, 'Greda', 'answers.com', 'asalaman0@latimes.com'),
        (2, 'Arţās', 'infoseek.co.jp', 'kgueste1@hatena.ne.jp'),
        (3, 'Semypolky', 'oracle.com', 'alangthorn2@wordpress.org'),
        (4, 'Minokamo', 'php.net', 'drollinshaw3@state.gov'),
        (5, 'Zabłocie', 'livejournal.com', 'bmacgille4@dell.com'),
        (6, 'Muhur', 'bluehost.com', 'dsima5@nydailynews.com');

CREATE TABLE current_info (
          id INT PRIMARY KEY ,
          studying VARCHAR(50),
          year_of_study INT
);
INSERT INTO current_info (id, studying, year_of_study)
VALUES (1, true, 4),
       (2, false, 1),
       (3, false, 3),
       (4, true, 3),
       (5, false, 2),
       (6, false, 4);

CREATE TABLE time (
              id INT PRIMARY KEY ,
              studying_time VARCHAR(50)
);
INSERT INTO time (id, studying_time) VALUES (1, '9:29 PM');
INSERT INTO time (id, studying_time) VALUES (2, '3:00 PM');
INSERT INTO time (id, studying_time) VALUES (3, '12:30 AM');
INSERT INTO time (id, studying_time) VALUES (4, '4:41 PM');
INSERT INTO time (id, studying_time) VALUES (5, '10:00 AM');


ALTER TABLE time ADD COLUMN students_name INT REFERENCES students_info;

UPDATE time
SET students_name = 1
WHERE id = 2;


UPDATE time
SET students_name = 2
WHERE id = 4;