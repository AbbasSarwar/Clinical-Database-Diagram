Create DATABASE Clinical;

Create TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status varchar(100) 
)

Create TABLE patients (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth date
)

ALTER TABLE medical_histories
ADD FOREIGN KEY (patient_id)
REFERENCES patients(id)


Create TABLE treatments (
    id SERIAL PRIMARY KEY,
    type varchar (100),
    name varchar (100)
)

ALTER TABLE treatments 
ADD FOREIGN KEY (id)
REFERENCES medical_histories (id) 
