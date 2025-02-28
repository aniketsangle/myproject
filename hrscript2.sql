create database myhr2;
use myhr2;

CREATE TABLE applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email_id_1 VARCHAR(255) UNIQUE,
    phone_number_1 VARCHAR(20),
    gender ENUM('Male', 'Female', 'Other'),
    marital_status ENUM('Single', 'Married', 'Divorced'),
    home_town_city VARCHAR(100),
    pin_code VARCHAR(10),
    date_of_birth DATE,
    permanent_address TEXT
);


CREATE TABLE experience (
    experience_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    total_experience FLOAT,
    curr_company_name VARCHAR(255),
    curr_company_designation VARCHAR(255),
    department VARCHAR(255),
    role VARCHAR(255),
    industry VARCHAR(255),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE
);


CREATE TABLE education (
    education_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    degree VARCHAR(100),
    specialization VARCHAR(100),
    university VARCHAR(255),
    graduation_year YEAR,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE
);



CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    resume_headline TEXT,
    summary TEXT,
    key_skills TEXT,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES job_position(position_id) ON DELETE SET NULL
);


CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    date_of_application DATE,
    current_location VARCHAR(100),
    preferred_location VARCHAR(100),
    current_salary FLOAT,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES job_position(position_id) ON DELETE SET NULL
);


#master table for hr jobs
CREATE TABLE job_position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255),
    department VARCHAR(255),
    location VARCHAR(100),
    required_experience INT
);


CREATE TABLE offer_issued (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    offer_date DATE,
    joining_date DATE,
    salary_offered FLOAT,
    status ENUM('Accepted', 'Pending', 'Rejected'),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES job_position(position_id) ON DELETE SET NULL
);


#rejected_candidates
CREATE TABLE rejected_applicants (
    rejection_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    position_id INT,
    rejection_reason TEXT,
    rejection_date DATE,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES job_position(position_id) ON DELETE SET NULL
);


SELECT * FROM applicants;
SELECT * FROM offer_letter;
SELECT * FROM rejected_applicants;


 SQL Query to Retrieve Applicants by Job Title
sql
Copy
Edit
SELECT a.applicant_id, a.name, a.email_id_1, a.phone_number_1, 
       j.position_name AS job_title, ap.date_of_application
FROM applicants a
JOIN applications ap ON a.applicant_id = ap.applicant_id
JOIN job_position j ON ap.position_id = j.position_id
WHERE j.position_name = 'Data Analyst';



