# Aplicação PHP com padrão MVC. Autentificação, CRUD, SQL...

Descrição ( Em desenvolvimento ) 

Viso nesse projeto exercitar meus conhecimentos em PHP, por isso é um projeto em PHP puro, sem uso de frameworks. O projeto é uma loja online com autentificação,
CRUD de produtos pelo usuário admin, 3 camadas de tratamento de inputs (bootstrap, javascript e php no backend), envio de emails, rotas e feito no padrão MVC. O projeto se conecta com um banco de dados SQL e faz o uso das principais tecnologias web, como JavaSCript, Bootstrap e Axios, sendo um projeto responsível para dispositivos móveis.

![Badge](https://img.shields.io/badge/PHP-6D42E8)
![Badge](https://img.shields.io/badge/SQL-FFFFFF)
![Badge](https://img.shields.io/badge/JavaScript-FFFF00)
![Badge](https://img.shields.io/badge/Axios-6E2BF2)
![Badge](https://img.shields.io/badge/Bootstrap-6E2BF2)
![Badge](https://img.shields.io/badge/HTML-E34F26)
![Badge](https://img.shields.io/badge/CSS-1572B6)

# Installation (with XAMPP)
- Run XAMPP
- Upload the .sql file located in the root directory into PhpMyAdmin
- Rename the "config_copy.php" located in the root directory to "config.php"
- Create a folder inside "htdocs" from XAMPP, it's recomended to name it as "loja" so you won't have to update the "APP_BASE_URL" and "APP_DOCUMENT_ROOT" enviroment variables.
- Git clone the project code into the folder you just created, don't need to create a sub-folder.
-Run:
  ```
  composer install
  ```
-Access:
http://localhost/loja/public/

