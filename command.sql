show DATABASES;


use facebookdb;

CREATE TABLE USERS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO USERS (username, password, email)
VALUES
('logu','logu123','logu@gmail.com'),
('arun', 'arun123','arun@gamil.com');

SELECT * FROM USERS;
   