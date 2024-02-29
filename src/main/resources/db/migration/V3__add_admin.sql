-- Вставка данных
INSERT INTO users (archive, bucket_id, id, email, name, password, phone, role)
VALUES (false, null, 1, 'admin@gmail.com', 'admin', 'admin_pass', '00', 'ADMIN');

-- Изменение AUTO_INCREMENT
ALTER TABLE users AUTO_INCREMENT = 2;