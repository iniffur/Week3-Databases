TRUNCATE TABLE cohorts RESTART IDENTITY;
TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (cohort_name, starting_date) VALUES ('Pineapple', 'Aug 2022');
INSERT INTO students (name, cohort_id) VALUES ('James Ruffini', '1');
INSERT INTO students (name, cohort_id) VALUES ('James Davis', '1');