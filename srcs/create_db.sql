-- cree une base de donnee nommee wordpress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- cree un compte utilisateur MySQL nommee wordpress
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'password';
-- donne le controle total sur la BD wordpress a l'utilisateur safernan
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;

-- cree un compte utilisateur MySQL nommee safernan
CREATE USER 'safernan' @'localhost' IDENTIFIED BY 'password';
-- donne tout les privileges
GRANT ALL PRIVILEGES ON *.* TO  'safernan' @'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
