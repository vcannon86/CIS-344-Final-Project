create database hospital_portal;

create table patients (
 patient_id int not null auto_increment primary key,
 patient_name varchar(45) not null,
 age int(3),
 admission_date date,
 discharge_date date
);
insert into patients (patient_name,age,admission_date,discharge_date)
values ("Wayne Rooney", 38, "2023/10/24", "2023/11/05"),
("Nemanja Vidic", 41, "2023/11/20", "2023/12/01"),
("Serafin Gonzalez", 98, "2023/05/19", "2023/12/12");
Select * from patients;

create table appointments (
 appointment_id int(10) not null auto_increment primary key,
 patient_id int(3) not null,
 doctor_id int(10) not null,
 appointment_date date not null,
 appointment_time decimal(10, 2) not null,
 foreign key (patient_id) references patients(patient_id),
 foreign key (doctor_id) references doctors(doctor_id)
);
insert into appointments (patient_id, doctor_id, appointment_date,appointment_time)
values (1, 2, 45, "2023/11/21", "13.30" );

create table doctors (
 doctor_id int not null auto_increment primary key,
 doctor_name varchar(45) not null,
 specialty varchar(45)
);

insert into doctors (doctor_id, doctor_name,specialty)
values (72, "Tim Corey", "Neurology"),
(45, "Alex John", "Orthopedics");

SELECT * FROM doctors;


DELIMITER //
create procedure schedule_appointment(
in app_patient_id int, 
in p_doctor_id int, 
in p_appointment_date date,
in p_appointment_time decimal (10,2)
)
begin
insert into appointments(patient_id, doctor_id, appointment_date, appointment_time) 
values (app_patient_id, app_doctor_id, app_appointment_date, app_appointment_time);
end//
DELIMITER ;

DELIMITER //
create procedure updatePatientDetails(
    in p_patient_id int,
    in p_patient_name varchar(45),
    in p_age int,
    in p_admission_date date,
    in p_discharge_date date
)
begin
    update patients
    set
        patient_name = p_patient_name,
        age = p_age,
        admission_date = p_admission_date,
        discharge_date = p_discharge_date
	where patient_id = p_patient_id;
end //

DELIMITER ;

DELIMITER //
create procedure discharge_patient(in app_patient_id int)
begin
update patients
set discharge_date = current_date()
where patient = app_patient_id;
end//

DELIMITER ;

select * from doctors;

