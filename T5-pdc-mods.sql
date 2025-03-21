--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-pdc-mods.sql

-- ITO Assignment 2 Task 5

--Student ID: 35484306
--Student Name: Conrad Guo

/* Comments for your marker:




*/

-- ENSURE that your SQL code is formatted and has a semicolon (;)
-- at the end of every statement. When marked this will be run as
-- a script.

/*
(a)
*/
ALTER TABLE patient ADD (
    patient_totalappointmentno NUMBER(2) DEFAULT 0 NOT NULL
);

UPDATE patient p
SET patient_totalappointmentno = (
    SELECT count(appt_no)
    FROM APPOINTMENT a
    WHERE a.PATIENT_NO = p.patient_no
);

desc patient;

SELECT 
    patient_no,
    patient_fname || ' ' || patient_lname AS patient_name,
    patient_totalappointmentno
FROM 
    patient
ORDER BY 
    patient_no;

/*
(b)
*/
drop TABLE patient_emergencycontact CASCADE CONSTRAINTS;

CREATE TABLE patient_emergencycontact (
    PATIENT_NO   number(4) NOT NULL,
    ec_id       number(4) NOT NULL,
    PRIMARY KEY (patient_no, ec_id),
    FOREIGN KEY (patient_no) REFERENCES Patient(patient_no),
    FOREIGN KEY (ec_id) REFERENCES Emergency_Contact(ec_id)
);

INSERT INTO patient_emergencycontact (patient_no, ec_id)
SELECT PATIENT_NO, ec_id
FROM PATIENT;

ALTER TABLE PATIENT DROP COLUMN ec_id;

desc patient_emergencycontact;

SELECT 
    *
FROM 
    patient_emergencycontact
ORDER BY 
    patient_no;

/*
(c)
*/
--nurse training log table.

drop table trainer CASCADE CONSTRAINTS;

CREATE TABLE trainer(
    trainer_no number(4) Not null,
    trainer_fname varchar2(30) not null,
    trainer_lname varchar2(30) not null,
    PRIMARY KEY (trainer_no)
);

drop table nt_log CASCADE CONSTRAINTS;

CREATE TABLE nt_log(
    NURSE_NO number(3) NOT NULL,
    trainer_no number(4) not null,
    nt_start_date_time date not null,
    nt_end_date_time date not null,
    nt_description varchar2(300) not null,
    PRIMARY KEY (nurse_no, trainer_no, nt_start_date_time),
    FOREIGN KEY (NURSE_NO) REFERENCES nurse,
    FOREIGN KEY (trainer_no) references trainer
);

desc trainer;
desc nt_log;


