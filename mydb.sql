drop database if exists mydb;
create database mydb;
use mydb;
drop table if exists users;
create table users(
  id int auto_increment primary key,    
  username char(45) not null,          
  password char(45),                 
  email char(45),                      
  role int default 0,                    
  createdate  datetime                 
);
insert into users(username,password,email,role,createdate) 
values('admin','sa','admin@qq.com',10,'2011-05-06');