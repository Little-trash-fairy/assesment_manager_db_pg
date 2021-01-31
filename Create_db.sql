CREATE DATABASE Assessment_manager;
Go

USE Assessment_manager;
Go

CREATE TABLE Condition_candidate_list
(
 id_condition SERIAL PRIMARY KEY NOT NULL,
 condition    varchar(20) NOT NULL
);


CREATE TABLE Type_of_chart
(
 id_type_of_chart SERIAL PRIMARY KEY NOT NULL,
 chart            text NOT NULL
);


CREATE TABLE Employee
(
 id_employee SERIAL PRIMARY KEY NOT NULL,
 name        varchar(50) NOT NULL,
 surname     varchar(50) NOT NULL,
 second_name varchar(50) NULL,
 Position    varchar(50) NOT NULL,
 zip         boolean NOT NULL
);

CREATE TABLE Condition_event_list
(
 id_condition_event_list SERIAL PRIMARY KEY NOT NULL,
 condition               varchar(20) NOT NULL,
);

CREATE TABLE Candidate
(
 id_candidate     serial PRIMARY KEY NOT NULL,
 name             varchar(50) NOT NULL,
 surname          varchar(50) NOT NULL,
 second_name      varchar(50) NULL,
 list_of_skills   text NULL,
 work_experience  text NULL,
 projects         text NULL,
 personal_quality text NULL,
 desired_salary   money NULL,
 position         text NULL,
 education        text NULL,
 id_condition     integer NOT NULL REFERENCES Condition_candidate_list ( id_condition ),
 phone_number     int NULL,
 e_mail           text NULL,
 criminal_record  text NOT NULL,
 Age              integer NOT NULL
);

CREATE TABLE Vacancy
(
 Id_vacancy               serial PRIMARY KEY NOT NULL,
 proposed_position        integer NOT NULL,
 salary                   money NOT NULL,
 required_skills          text NOT NULL,
 list_of_responsibilities text NOT NULL,
 id_type_of_chart         integer NOT NULL REFERENCES Type_of_chart ( id_type_of_chart ),
 required_work_experience integer NOT NULL,
 zip                      boolean NOT NULL
);

CREATE TABLE List_of_recruits
(
 id_candidate           integer  REFERENCES Candidate ( id_candidate )  NOT NULL,
 id_in_list_of_recruits serial PRIMARY KEY NOT NULL,
 Id_vacancy             integer NOT NULL REFERENCES Vacancy ( Id_vacancy )
);
CREATE TABLE Event
(
 id_event                serial PRIMARY KEY NOT NULL,
 event_data              date NOT NULL,
 Id_vacancy              integer NOT NULL REFERENCES Vacancy ( Id_vacancy ),
 id_condition_event_list integer NOT NULL REFERENCES Condition_event_list ( id_condition_event_list ),
 event_time              time NOT NULL,
 Venue                   text NOT NULL
);
CREATE TABLE List_of_recruiters
(
 id_employee integer NOT NULL REFERENCES Employee ( id_employee ),
 id_event    integer NOT NULL REFERENCES Event ( id_event )
);
CREATE TABLE List_of_ratings
(
 id_in_list_of_recruits integer REFERENCES List_of_recruits ( id_in_list_of_recruits ) NOT NULL,
 id_employee            integer REFERENCES Employee ( id_employee ) NOT NULL,
 id_condition           integer REFERENCES Condition_candidate_list ( id_condition ) NOT NULL,
 id_event				integer REFERENCES Event ( id_event ) NOT NULL
 PRIMARY KEY(id_in_list_of_recruits, id_employee,id_event)
);