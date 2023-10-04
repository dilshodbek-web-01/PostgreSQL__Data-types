users_db       // DATABASE
      users                             // success 
            TABLE
      courses                           // success
           FOREIGN KEY user_id
      emails                            // success
           FOREIGN KEY user_id          
      fruits                            // success
           FOREIGN KEY user_id
      animals                           // success
           FOREIGN KEY user_id
      company                           // success
           FOREIGN KEY user_id

      cars                              // success
           FOREIGN KEY user_id
           FOREIGN KEY company_id
      employees                         // success
           FOREIGN KEY user_id
           FOREIGN KEY company_id
      customers                         // success
           FOREIGN KEY employee_id
           FOREIGN KEY company_id
           FOREIGN KEY car_id

CREATE DATABASE users_db;

-- users
CREATE TABLE users(
            user_id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            user_name VARCHAR(50) UNIQUE NOT NULL,
            user_email VARCHAR(50) UNIQUE NOT NULL,
            user_age INT NOT NULL,
            user_role VARCHAR(10) NOT NULL,
            start_at TIME NOT NULL DEFAULT CURRENT_TIME,
            user_password VARCHAR(20) NOT NULL
          );
ALTER TABLE users RENAME COLUMN user_id TO id;

INSERT INTO users(user_name, user_email, user_age, user_role, user_password)
            VALUES('user1', 'user1@gmail.com', 21, 'user', 'user123'),
            ('user2', 'user2@gmail.com', 21, 'user', 'user123'),
            ('user3', 'user3@gmail.com', 21, 'user', 'user123');

SELECT * FROM users;

-- courses
CREATE TABLE courses(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            title VARCHAR(50) NOT NULL,
            price VARCHAR(50) NOT NULL,
            course_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id)
);

INSERT INTO courses(title, price, course_description, created_by_user_id)
            VALUES('react', '800000', 'react lesson', '7f1b60c2-2966-4b0c-b009-16c04e99131f'),
            ('vue', '800000', 'vue lesson', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c'),
            ('angular', '800000', 'angular lesson', '3aed653c-76b4-490d-8e02-2e1e6891e4f6');

SELECT * FROM courses;
DELETE FROM courses WHERE id = '0e8c2fc1-f0bd-4a63-952e-a0a22371f623';
DROP TABLE courses CASCADE;

-- emails
CREATE TABLE emails(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            title VARCHAR(50) UNIQUE NOT NULL,
            email_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id)
);

INSERT INTO emails(title, email_description, created_by_user_id)
            VALUES('user1@gmail.com', 'about email', '7f1b60c2-2966-4b0c-b009-16c04e99131f'),
            ('user2@gmail.com', 'about email', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c'),
            ('user3@gmail.com', 'about email', '3aed653c-76b4-490d-8e02-2e1e6891e4f6');

SELECT * FROM emails;

-- fruits
CREATE TABLE fruits(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            fruit_name VARCHAR(50) NOT NULL,
            fruit_price VARCHAR(50) NOT NULL,
            fruit_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id)
);

INSERT INTO fruits(fruit_name, fruit_price, fruit_description, created_by_user_id)
            VALUES('peach', '7000', 'delicious peach', '7f1b60c2-2966-4b0c-b009-16c04e99131f'),
            ('apple', '5000', 'delicious apple', '59597d98-a230-4065-9d8a-5cb871f02de7'),
            ('pomegranate', '10000', 'delicious pomegranate', '1052777b-b2ae-46f5-92a5-6a5dd6617f0a');

SELECT * FROM fruits;

-- animals
CREATE TABLE animals(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            animal_name VARCHAR(50) NOT NULL,
            animal_type VARCHAR(50) NOT NULL,
            animal_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id)
);

INSERT INTO animals(animal_name, animal_type, animal_description, created_by_user_id)
            VALUES('rabbit', 'pet and wild', 'usually a pet', '7f1b60c2-2966-4b0c-b009-16c04e99131f'),
            ('bear', 'wild', 'usually wild', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c'),
            ('lion', 'wild', 'usually wild', '3aed653c-76b4-490d-8e02-2e1e6891e4f6');

SELECT * FROM animals;

-- company
CREATE TABLE company(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            company_name VARCHAR(50) NOT NULL,
            company_goal VARCHAR(50) NOT NULL,
            company_employees VARCHAR(50) NOT NULL,
            number_of_employees INT NOT NULL,
            company_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id)
);

INSERT INTO company(company_name, company_goal, company_employees, number_of_employees,
                    company_description, created_by_user_id)
            VALUES('najot ta`lim', 'sharing knowledge and experience', 'teachers and employees', 150, 'best of the best', '7f1b60c2-2966-4b0c-b009-16c04e99131f'),
            ('IT House', 'sharing knowledge and experience', 'teachers and employees', 15, 'best', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c'),
            ('Education', 'sharing knowledge and experience', 'teachers and employees', 30, 'best', '3aed653c-76b4-490d-8e02-2e1e6891e4f6');

SELECT * FROM company;
SELECT * FROM company JOIN users 

-- cars
CREATE TABLE cars(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            car_name VARCHAR(50) NOT NULL,
            car_price VARCHAR(50) NOT NULL,
            car_color VARCHAR(50) NOT NULL,
            car_type VARCHAR(50) NOT NULL,
            car_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            company_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id),
            CONSTRAINT fk_created_by_company
            FOREIGN KEY(company_id) 
	       REFERENCES company(id)
);

INSERT INTO cars(car_name, car_price, car_color, car_type, car_description,
               created_by_user_id, company_id)
            VALUES('malibu', '35000$', 'white and black', 'light', 'good', '7f1b60c2-2966-4b0c-b009-16c04e99131f', 'c73a2088-0f97-42b8-9fdc-b16acdf60041' ),
            ('cobalt', '10000$', 'white and black', 'light', 'good', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c', 'b8105f27-0aee-48fe-9a03-0944f80eba4c'),
            ('mercedes-benz', '50000$', 'white and black', 'light', 'best', '3aed653c-76b4-490d-8e02-2e1e6891e4f6', 'c768752d-2d85-479a-b1de-aab7b17f81cc');

SELECT * FROM cars;
  
-- employees
CREATE TABLE employees(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            employee_name VARCHAR(50) UNIQUE NOT NULL,
            employee_email VARCHAR(50) UNIQUE NOT NULL,
            employee_salary NUMERIC(8, 6) NOT NULL,
            employee_description TEXT,
            created_by_user_id VARCHAR(50) NOT NULL,
            company_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_user_id) 
	       REFERENCES users(id),
            CONSTRAINT fk_created_by_company
            FOREIGN KEY(company_id) 
	       REFERENCES company(id)
);

INSERT INTO employees(employee_name, employee_email, employee_salary, employee_description,
               created_by_user_id, company_id)
            VALUES('dilshodbek', 'dilshodbek@gmail.com', 25.000000, 'good', '7f1b60c2-2966-4b0c-b009-16c04e99131f', 'c73a2088-0f97-42b8-9fdc-b16acdf60041' ),
            ('lochinbek', 'lochinbek@gmail.com', 25.000000, 'good', '4835791c-b9a8-4b4b-aaf5-fef1f82f1f2c', 'b8105f27-0aee-48fe-9a03-0944f80eba4c'),
            ('ismoil', 'ismoil@gmil.com', 25.000000, 'best', '3aed653c-76b4-490d-8e02-2e1e6891e4f6', 'c768752d-2d85-479a-b1de-aab7b17f81cc');

SELECT * FROM employees;

-- customers
CREATE TABLE customers(
            id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
            customer_name VARCHAR(50) UNIQUE NOT NULL,
            customer_email VARCHAR(50) UNIQUE NOT NULL,
            customer_price NUMERIC(8, 6) NOT NULL,
            customer_description TEXT,
            created_by_employee_id VARCHAR(50) NOT NULL,
            company_id VARCHAR(50) NOT NULL,
            car_id VARCHAR(50) NOT NULL,
            CONSTRAINT fk_created_by
            FOREIGN KEY(created_by_employee_id) 
	       REFERENCES employees(id),
            CONSTRAINT fk_created_by_company
            FOREIGN KEY(company_id) 
	       REFERENCES company(id),
            CONSTRAINT fk_created_by_car
            FOREIGN KEY(car_id) 
	       REFERENCES cars(id)
);

INSERT INTO customers(customer_name, customer_email, customer_price, customer_description,
               created_by_employee_id, company_id, car_id)
            VALUES('sherzodbek', 'sherzodbek@gmail.com', 55.000000, 'good', 
            '853bff42-585a-46ae-b02b-c53d8492c9c0', 'c73a2088-0f97-42b8-9fdc-b16acdf60041',
            'a31479fc-80eb-4441-865a-30154583e649'),
            ('oyatilla', 'oyatilla@gmail.com', 55.000000, 'good', 
            '431b57fe-eb46-4b52-aa33-1d80733a7a4f', 'b8105f27-0aee-48fe-9a03-0944f80eba4c',
            '3cbacdd0-ea81-474a-93e0-9ace97a7f362'),
            ('nurullo', 'nurullo@gmil.com', 55.000000, 'good', 
            'df16c0b4-d6a9-4bae-8ef2-7b210961fe4f', 'c768752d-2d85-479a-b1de-aab7b17f81cc',
            'ff685cd4-70b8-478b-9b61-b96195974b9b');

SELECT * FROM customers;
