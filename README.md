# README


## Database

### Create  User

* create user 'ati'@localhost identified by 'ati';
* GRANT ALL PRIVILEGES ON atipro1_development.* TO 'ati'@'localhost';
* GRANT ALL PRIVILEGES ON atipro1_test.* TO 'ati'@'localhost';
* GRANT ALL PRIVILEGES ON atipro1_production.* TO 'ati'@'localhost';

### Create Database

* rake db:migrate
* rake db:seed

Seeds will create 10 example agencies and 3 different users, each one with a different role within the app

## Email

Edit '.env' file within the root directory and change the following:

* GMAIL_USERNAME=youremail@domain.com
* GMAIL_PASSWORD=yourpassword

## Starting Server

* foreman start