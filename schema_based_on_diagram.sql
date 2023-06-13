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

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
)

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
)

ALTER TABLE invoice_items
ADD FOREIGN KEY (invoice_id)
REFERENCES invoices (id)
