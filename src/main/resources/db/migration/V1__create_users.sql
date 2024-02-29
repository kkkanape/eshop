-- Create the table 'users'
CREATE TABLE users
(
    id        BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    archive   BIT    NOT NULL,
    bucket_id BIGINT,
    email     VARCHAR(255),
    name      VARCHAR(255),
    password  VARCHAR(255),
    phone     VARCHAR(255),
    role      ENUM('CLIENT', 'MANAGER', 'ADMIN')
) ENGINE=InnoDB;

