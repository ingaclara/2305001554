-- 2305001554- Voting Management System
show databases;
create database Voting_Management_System;
use Voting_Management_System;
show tables;
-- Creating the Voters table
CREATE TABLE Voters (
    voter_id INT PRIMARY KEY AUTO_INCREMENT,
    names VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(50),
    Gender varchar(50),
    Address varchar(100)
);
desc Voters;
-- Creating the Votes table
CREATE TABLE Votes (
    vote_id INT PRIMARY KEY AUTO_INCREMENT,
    voter_id INT, foreign key (voter_id) references Voters(voter_id),
    candidate_id INT, foreign key(candidate_id) references Candidates (candidate_id),
    vote_time TIME
);
desc Votes;
-- Creating the Candidates table
CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    party VARCHAR(100),
    election_id INT,
    vote_count INT,
    FOREIGN KEY (election_id) REFERENCES elections(election_id)
);
-- to make decription of Candidates table
desc Candidates;
-- Creating the Election table 
CREATE TABLE Elections (
    election_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE
);
-- Description of Elections table
desc Elections;
-- Creating the Admin table
create table Admins
(Admin_id int primary key,
Name varchar(100),
Email varchar(200),
Role varchar(100)

);
desc Admins;
-- Inserting a  voter
insert into Voters values
(001,'Peter','peter@gmail.com','123sg4','M','PO145'),
(002,'John','john@gmail.com','121st4','M','PO645'),
(003,'Olive Salah','olivesalah@gmail.com','161st4','F','PO247');

select * from Voters;
-- Inserting a Vote table
insert into Votes values
(1,001,1, 'Now','12:34:03'),
(2,002,2, 'leter','05:34:03'),
(3,003,3, 'Now','01:34:03');
select * from Votes;
-- Inserting a Candidate table
insert into Candidates values
(1, 'Shema Clarisse','RDF',1,200),
(2, 'Shema Selge','RDF',2,211),
(3, 'INGABIRE Iness','RDF',3,215);
select * from Candidates;
-- Inserting an Election table
insert into Elections values
(1,'Peter','2024-07-15','2024-08-15'),
(2,'Umuhire','2024-07-15','2024-08-15'),
(3,'Handrick','2024-07-15','2024-08-15');
select * from Elections;
-- Inserting an Admin table
insert into Admins values
(050,'MUKOTANYI Peter', 'mukotanyipeter@gmail.com','Election Manager'),
(051,'Gatera Jouix', 'gaterajouix@gmail.com','Election Manager'),
(052,'SHYAKA Epa', 'shyakaepa@gmail.com','Election Manager');
select * from  Admins;
update Voters set names='Ruth'where voter_id=001;
delete from Voters where voter_id=001;
SELECT COUNT(* )AS total_voters FROM Voters;
select sum(names) as total_names from Voters;
update Votes set vote_time='11:31:07'where voter_id=1;
select * from Votes;
delete from Votes where voter_id=1;
SELECT COUNT(* )AS total_votes FROM Votes;
update Candidates set party='PDL'where candidate_id=1;
delete from Candidates where candidate_id=1;
SELECT COUNT(* )AS total_candidates FROM Candidates;
SELECT SUM(vote_count ) AS total_vote_count  FROM Candidates ;
SELECT AVG(vote_count) AS avg_vote_count FROM Candidates;
update Elections set name='Olive'where election_id=2;
delete from Elections where election_id=1;
SELECT COUNT(* )AS total_elections FROM Elections;
update Admins set Name='Emma'where Admin_id=050;
delete from Admins where Admin_id=050;
SELECT COUNT(* )AS total_Admins FROM Admins;
create view listofcandidates as select * from Candidates;
select * from listofcandidates;
create view listofvoters as select * from Voters;
select * from listofvoters;
create view listofelections as select * from Elections where name='Peter';
select * from listofelections;
create view listofadmin as select * from Admins;
select * from listofadmin;
-- creation of stored procedure

delimiter $$
create procedure upvote(in vot int)
begin
select * from voters where voter_id=vot;
end $$
delimiter ;
call upvote(001);
delimiter $$
create procedure Elect(in lect int)
begin
select * from Elections where Election_id=lect;
end $$
delimiter ;
call elect(1);

delimiter $$
create procedure cand(in candid int)
begin
select * from Candidates where candidate_id=candid;
end $$
delimiter ;
call cand(1);
-- creation of user 
create user 'shema'@'127.0.0.1' identified by '2305001554';
grant all privileges on voting_management_system.* to 'shema'@'127.0.0.1';
flush privileges;





















