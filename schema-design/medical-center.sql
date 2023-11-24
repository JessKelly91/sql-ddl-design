CREATE TABLE "doctors" (
    "id" SERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "active" BOOLEAN DEFAULT true
);

CREATE TABLE "patients" (
    "id" SERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "birthday" DATE NOT NULL,
    "gender" TEXT NOT NULL,
    "primary_dr_id" INT REFERENCES doctors.id DROP NOT NULL ON DELETE SET NULL
);

CREATE TABLE "illnesses" (
    "id" SERIAL PRIMARY KEY,
    "illness" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "symptoms" TEXT NOT NULL
);

CREATE TABLE "diagnosis" (
    "id" SERIAL PRIMARY KEY,
    "patient_id" INT REFERENCES patients.id ON DELETE CASCADE,
    "diagnosis_id" INT REFERENCES illnesses.id ON DELETE RESTRICT,
    "diagnosing_dr_id" INT REFERENCES doctors.id ON DELETE RESTRICT,
    "diagnosis_date" DATE NOT NULL DEFAULT (SELECT CURRENT_DATE)
);

CREATE INDEX idx_patients_primary_dr_id
    ON patients (primary_dr_id);

CREATE INDEX idx_diagnosis_patient_id
    ON diagnosis (patient_id);

CREATE INDEX idx_diagnosis_diagnosis_id 
    ON diagnosis (diagnosis_id);

CREATE INDEX idx_diagnosis_diagnosing_dr_id 
    ON diagnosis (diagnosing_dr_id);