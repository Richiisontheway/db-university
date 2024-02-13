--ho fatto questo file perché non mi piaceva la tabella grafica che avevo fatto

-- creazione tabella departements

CREATE TABLE departements (
    id_departement INT PRIMARY KEY,
    departement_name VARCHAR(50) NOT NULL,
),

-- creazione tabella corsi_di_laura

CREATE TABLE corsi_di_laura (
    id_corso_di_laura INT PRIMARY KEY,
    corso_laura_name VARCHAR(40) NOT NULL,

    FOREIGN KEY (id_departement) REFERENCES departements(id_departement)
),

-- creazione tabella corsi

CREATE TABLE corsi (
    id_corso INT PRIMARY KEY,
    corso_name VARCHAR(40) NOT NULL,

    FOREIGN KEY (id_corso_di_laura) REFERENCES corsi_di_laura(id_corso_di_laura)
)

-- creazione tabella insegnanti

CREATE TABLE teachers (
    id_teacher INT PRIMARY KEY,
    teacher_name VARCHAR(40) NULL,
    teacher_lastname VARCHAR(40) NOT NULL UNIQUE,

    FOREIGN KEY (id_corso) REFERENCES corsi(id_corso)
)

-- creazione tabella appelli esami

CREATE TABLE appelli_esami (
    id_appelli_esami INT PRIMARY KEY,
    esami_name VARCHAR(40) NOT NULL,
    esami_date DATE NOT NULL UNIQUE,

    FOREIGN KEY (id_corso) REFERENCES corsi(id_corso)
)

-- creazione tabella studenti

CREATE TABLE students (
    id_student INT PRIMARY KEY,
    student_name VARCHAR(40) NOT NULL,
    student_lastname VARCHAR(40) NOT NULL,
    student_tessera NUMBER(8) NOT NULL UNIQUE,

    FOREIGN KEY (id_corso_di_laura) REFERENCES corsi_di_laura(id_corso_di_laura),
    FOREIGN KEY (id_appelli_esami) REFERENCES appelli_esami(id_appelli_esami)
)

--creazione tabella iscrizioni

CREATE TABLE iscrizioni (
    id_iscrizione INT PRIMARY KEY,
    id_student INT NOT NULL,
    id_appelli_esami INT NOT NULL,

    FOREIGN KEY (id_appelli_esami) REFERENCES appelli_esami(id_appelli_esami),
    FOREIGN KEY (id_student) REFERENCES students (id_student)
)

--creazione tabella voti

CREATE TABLE votes (
    id_vote INT PRIMARY KEY,
    id_iscrizioni INT NOT NULL,
    vote NUMBER(2) INT NOT NULL,
    esito VARCHAR(5)

    FOREIGN KEY (id_iscrizione) REFERENCES iscrizioni(id_iscrizione)
)