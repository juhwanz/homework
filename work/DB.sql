CREATE DATABASE IF NOT EXISTS daDB;
USE boardDB;
CREATE TABLE IF NOT EXISTS poste(
	id INT auto_increment primary KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    file_name VARCHAR(255)
);