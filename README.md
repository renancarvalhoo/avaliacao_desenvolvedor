== README

# Thinking:

First I thought about the security of the data that would be inserted, so I thought about creating a user login to link the data to a single user. The upload file is working on disk, in case it needs to be placed on a server that has difficulty accessing the disk, I created a class to use aws S3, it still had to be implemented in this case. I did not find it necessary to create a table for each type of information that is in the csv file, since the data seemed to me a lot like a log file.

# Instructions:

Database: SQLite

The project is using the ruby and rails versions below as requested:

- Ruby 2.1.0
- Rails 4.0.4

### Run this commands to create database and user

- rake db:create db:migrate db:seed

### Application run

- rails s

# Steps:

Default user:

email: first@email.com
password: 123456

With the application running, go to "http://localhost:3000" and you will be redirected to the login page, after which the listing of the company's sales records will be displayed. There are two possibilities for insertion, either manually or by importing the file. For import use the import file button, select the file and send. The data will be displayed in the listing, and the total at the end of the table.

# Next Steps:

* Create filter to listing company sale
* Implement S3 Cloud
* Create Log to Csv Upload
...
