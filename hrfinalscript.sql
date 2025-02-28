CREATE DATABASE job_portal1;
USE job_portal1;

drop database job_portal;

CREATE TABLE job_position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255),
    department VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email_id_1 VARCHAR(255),
    email_id_2 VARCHAR(255),
    phone_number_1 VARCHAR(50),
    phone_number_2 VARCHAR(50),
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    home_town_city VARCHAR(255),
    pin_code VARCHAR(10),
    date_of_birth DATE,
    permanent_address TEXT
);

select * from applicants;
select * from job_position;

delete from applicants;

CREATE TABLE experience (
    exp_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    total_experience INT,
    curr_company_name VARCHAR(255),
    curr_company_designation VARCHAR(255),
    industry VARCHAR(255),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE
);

CREATE TABLE education (
    edu_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    ug_degree VARCHAR(255),
    ug_specialization VARCHAR(255),
    ug_university VARCHAR(255),
    ug_graduation_year INT,
    pg_degree VARCHAR(255),
    pg_specialization VARCHAR(255),
    pg_university VARCHAR(255),
    pg_graduation_year INT,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE
);

CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    key_skills TEXT,
    resume_headline TEXT,
    summary TEXT,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id),
    FOREIGN KEY (position_id) REFERENCES job_position(position_id)
);

select * from skills;

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    date_of_application DATE,
    current_location VARCHAR(255),
    preferred_location VARCHAR(255),
    annual_salary INT,
    notice_period VARCHAR(50),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id),
    FOREIGN KEY (position_id) REFERENCES job_position(position_id)
);

DESC applicants;

set foreign_key_checks = 0;
alter table applicants
modify column phone_number_1 varchar(20);
set foreign_key_checks = 1;

