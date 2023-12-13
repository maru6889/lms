DROP TABLE STUDENT 
	CASCADE CONSTRAINTS;

DROP TABLE COURSE 
	CASCADE CONSTRAINTS;

DROP TABLE LECTURE 
	CASCADE CONSTRAINTS;

DROP TABLE Major 
	CASCADE CONSTRAINTS;

DROP TABLE PROFESSOR 
	CASCADE CONSTRAINTS;

DROP TABLE ROLE 
	CASCADE CONSTRAINTS;

DROP TABLE LECTURECOMMENT 
	CASCADE CONSTRAINTS;

DROP TABLE COMMENTS 
	CASCADE CONSTRAINTS;

CREATE TABLE STUDENT (
	student_id NUMBER NOT NULL,
	student_name VARCHAR2(20),
	student_email VARCHAR2(20),
	student_address VARCHAR2(50),
	student_phone_number VARCHAR2(20),
	student_grade NUMBER,
	student_admission_year DATE,
	major_id NUMBER
);

ALTER TABLE STUDENT
	ADD
		CONSTRAINT PK_STUDENT
		PRIMARY KEY (
			student_id
		);

CREATE TABLE COURSE (
	student_id NUMBER NOT NULL,
	lecture_id NUMBER NOT NULL
);

ALTER TABLE COURSE
	ADD
		CONSTRAINT PK_COURSE
		PRIMARY KEY (
			student_id,
			lecture_id
		);

CREATE TABLE LECTURE (
	lecture_id NUMBER NOT NULL,
	lecture_name VARCHAR2(20),
	lecture_location VARCHAR2(20),
	lecture_time VARCHAR2(20),
	lecture_credit NUMBER,
	lecture_date VARCHAR2(20),
	grade VARCHAR2(20),
	professor_id NUMBER,
	major_id NUMBER
);

ALTER TABLE LECTURE
	ADD
		CONSTRAINT PK_LECTURE
		PRIMARY KEY (
			lecture_id
		);

CREATE TABLE Major (
	major_id NUMBER NOT NULL,
	major_name VARCHAR2(20)
);

ALTER TABLE Major
	ADD
		CONSTRAINT PK_Major
		PRIMARY KEY (
			major_id
		);

CREATE TABLE PROFESSOR (
	professor_id NUMBER NOT NULL,
	professor_name VARCHAR2(20),
	professor_phone_number VARCHAR2(20),
	professor_fax VARCHAR2(20),
	lab_location VARCHAR2(20),
	lab_tel VARCHAR2(20),
	major_id NUMBER
);

ALTER TABLE PROFESSOR
	ADD
		CONSTRAINT PK_PROFESSOR
		PRIMARY KEY (
			professor_id
		);

CREATE TABLE ROLE (
	role_id NUMBER NOT NULL,
	role_name VARCHAR2(30),
	student_id NUMBER,
	professor_id NUMBER
);

ALTER TABLE ROLE
	ADD
		CONSTRAINT PK_ROLE
		PRIMARY KEY (
			role_id
		);

CREATE TABLE LECTURECOMMENT (
	lecture_comment_id NUMBER NOT NULL,
	lecture_comment_content VARCHAR2(100),
	lecture_star_score NUMBER,
	student_id NUMBER,
	lecture_id NUMBER
);

ALTER TABLE LECTURECOMMENT
	ADD
		CONSTRAINT PK_LECTURECOMMENT
		PRIMARY KEY (
			lecture_comment_id
		);

CREATE TABLE COMMENTS (
	comments_id NUMBER NOT NULL,
	comments_content VARCHAR2(100),
	lecture_comment_id NUMBER
);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT PK_COMMENTS
		PRIMARY KEY (
			comments_id
		);

ALTER TABLE STUDENT
	ADD
		CONSTRAINT FK_Major_TO_STUDENT
		FOREIGN KEY (
			major_id
		)
		REFERENCES Major (
			major_id
		);

ALTER TABLE COURSE
	ADD
		CONSTRAINT FK_STUDENT_TO_COURSE
		FOREIGN KEY (
			student_id
		)
		REFERENCES STUDENT (
			student_id
		);

ALTER TABLE COURSE
	ADD
		CONSTRAINT FK_LECTURE_TO_COURSE
		FOREIGN KEY (
			lecture_id
		)
		REFERENCES LECTURE (
			lecture_id
		);

ALTER TABLE LECTURE
	ADD
		CONSTRAINT FK_PROFESSOR_TO_LECTURE
		FOREIGN KEY (
			professor_id
		)
		REFERENCES PROFESSOR (
			professor_id
		);

ALTER TABLE LECTURE
	ADD
		CONSTRAINT FK_Major_TO_LECTURE
		FOREIGN KEY (
			major_id
		)
		REFERENCES Major (
			major_id
		);

ALTER TABLE PROFESSOR
	ADD
		CONSTRAINT FK_Major_TO_PROFESSOR
		FOREIGN KEY (
			major_id
		)
		REFERENCES Major (
			major_id
		);

ALTER TABLE ROLE
	ADD
		CONSTRAINT FK_STUDENT_TO_ROLE
		FOREIGN KEY (
			student_id
		)
		REFERENCES STUDENT (
			student_id
		);

ALTER TABLE ROLE
	ADD
		CONSTRAINT FK_PROFESSOR_TO_ROLE
		FOREIGN KEY (
			professor_id
		)
		REFERENCES PROFESSOR (
			professor_id
		);

ALTER TABLE LECTURECOMMENT
	ADD
		CONSTRAINT FK_COURSE_TO_LECTURECOMMENT
		FOREIGN KEY (
			student_id,
			lecture_id
		)
		REFERENCES COURSE (
			student_id,
			lecture_id
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_LECTURECOMMENT_TO_COMMENTS
		FOREIGN KEY (
			lecture_comment_id
		)
		REFERENCES LECTURECOMMENT (
			lecture_comment_id
		);