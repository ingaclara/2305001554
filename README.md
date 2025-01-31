
                   
                             VOTING MANAGEMENT SYSTEM(VMS) PROJECT
A Voting Management System (VMS) project refers to the development of a software application or system that automates and manages the election and voting process. 
A Voting Management System (VMS) allows eligible users to cast their votes in an election. The system should provide an easy and secure way to manage voter registration, voting, and result calculation.
Here, The database management system helps store the information of candidates, voters, and votes cast in the election.
A purpose of the project:
 Is to create a system that handles all aspects of an election, including voter registration, candidate management, voting, and result calculation.
The project aims to build a system that:
•	Streamlines the Election Process: Automates the steps involved in elections, making the process faster and more reliable.
•	Improves Security: Ensures that only authorized voters can participate and prevents fraud, multiple voting, and other electoral malpractices.
•	Provides Transparency: Ensures that voting results are accessible, accurate, and visible to all stakeholders.
•	Increases Accessibility: Provides a platform that allows voters to cast their votes electronically, which can be done remotely in some systems.
•	Manages Voters and Candidates: Organizes voter registrations and stores information about candidates running for office.
                                    System Requirements
•	Users: Admin (who can add candidates, manage elections),
•	 Voters (who vote for candidates).
•	Functionalities:
•  Voters:
•	Voters must be able to register for the election.
•	Voters must authenticate themselves (e.g., via login).
•	Once logged in, voters should be able to view candidates and cast their votes.
•	A voter can only vote once.
•  Admin:
•	Admins should be able to add candidates to the election.
•	Admins can view voting statistics and results.
•	Admins should be able to view the list of voters and their voting status.
•  Candidates:
•	Candidates will be displayed with their details (name, party, description).
•	The candidate's votes are tallied during the voting process.
•  Voting Process:
•	Voting should be secure (only registered and authenticated users can vote).
•	A vote can only be cast once per user.
•	Voting should be recorded with a timestamp, and once cast, the status of the voter should be updated.
•	Results should be accessible only after voting is closed

      Here  there is an Entity-Relationship Diagram (ERD) for a Voting Management System (VMS). An ERD visually represents the structure of a database by showing entities (tables) and the relationships between them.
ERD Diagram Explanation:
Entities:
1.	Voter:
o	Attributes: voter_id, name, email, password,  has_voted, Dob,Gender,address
2.	Candidate:
o	Attributes: candidate_id, name, party, election_id, vote_count
3.	Election:
o	Attributes: election_id, name, start_date, end_date
4.	Vote:
o	Attributes: vote_id, voter_id, candidate_id, vote_time
5.	Admin:
o	Attributes: admin_id, username, password
Relationships:
1.	Voter - Vote (1:N):
o	A voter can cast one vote, but a vote is associated with only one voter.
o	This relationship is 1-to-many (1 voter can have many votes).
2.	Candidate - Vote (1:N):
o	A candidate can receive many votes, but each vote corresponds to only one candidate.
o	This relationship is 1-to-many (1 candidate can have many votes).
3.	Election - Candidate (1:N):
o	An election can have multiple candidates running for office.
o	This relationship is 1-to-many (1 election can have many candidates).
4.	Admin - Election (1:N):
o	An admin manages one or more elections.
o	This relationship is 1-to-many (1 admin can manage many elections).
        Vote
Vote_id(pk)
Voter_id(fk)
Canditate_id(fk)
Vote_time
     Candidate
Candidate_id(pk)
Name
Party
Election_id
Vote_count

       Voter
Voter_id(pk)
Name
Email
Password
Has_voted
Gemder
Address
                 
       Election
Election_id(pk)
Name
Start_date
End_date



      Admin
Admin_id(pk)
name
Email
Role
Logical Data Model (LDM) for Voting Management System
1.	Voter table
Column Name	Data Type	Description
voter_id (PK)	Integer                 	Unique ID for each voter
name	String	Voter's full name
email	String (Unique)	Voter's email address
password	String (Hashed)	Voter's password for authentication
phone_number	String	Voter's phone number
date_of_birth	Date	Voter's date of birth
has_voted	Boolean	Flag indicating if the voter has already voted
registration_date	Date	Date the voter registered
voter_status	String	Voter's status (e.g., Active, Suspended)

2. Candidate Table
Column Name	Data Type	Description
candidate_id (PK)	Integer	Unique ID for each candidate
name	String	Candidate's name
party	String	Party to which the candidate belongs
election_id (FK)	Integer	Election the candidate is contesting
vote_count	Integer	Number of votes received by the candidate
3. Election Table
Column Name	Data Type	Description
election_id (PK)	Integer	Unique ID for each election
name	String	Election name (e.g., Presidential Election 2024)
start_date	Date	Election start date
end_date	Date	Election end date
election_status	String	Status of the election (e.g., Ongoing, Completed)
4. Vote Table
Column Name	Data Type	Description
vote_id (PK)	Integer	Unique ID for each vote
voter_id (FK)	Integer	ID of the voter casting the vote
candidate_id (FK)	Integer	ID of the candidate receiving the vote
election_id (FK)	Integer	ID of the election in which the vote is cast
vote_time	Timestamp	Time the vote was cast
5. Admin Table
Column Name	Data Type	Description
admin_id (PK)	Integer	Unique ID for each admin
username	String	Admin's username
password	String (Hashed)	Admin's password
role	String	Role of the admin (e.g., Admin, Manager)
		
PDM for Voting Management System
The Physical Data Model (PDM)  for the Voting Management System (VMS) defines the physical storage and performance considerations for the database. It specifies how the data will actually be stored on disk, including the data types for each column, indexes, constraints, and other performance optimization aspects.
                                      DATA DICTIONARY FOR VMS
1. Voter Table
Column Name	Data Type	Description	Constraints
voter_id	INT AUTO_INCREMENT	Unique identifier for each voter	Primary Key, Not Null, Auto Increment
name	VARCHAR(100)	Voter's full name	Not Null
email	VARCHAR(150)	Voter's email address	Not Null, Unique
password	VARCHAR(255)	Voter's encrypted password	Not Null
phone_number	VARCHAR(20)	Voter's phone number	Nullable
date_of_birth	DATE	Voter's date of birth	Not Null
has_voted	BOOLEAN	Flag indicating if the voter has voted	Default: FALSE, Not Null
registration_date	TIMESTAMP	Date and time the voter registered	Default: CURRENT_TIMESTAMP, Not Null
voter_status	ENUM('Active', 'Suspended')	Status of the voter	Default: 'Active', Not Null
________________________________________
2. Candidate Table
Column Name	Data Type	Description	Constraints
candidate_id	INT AUTO_INCREMENT	Unique identifier for each candidate	Primary Key, Not Null, Auto Increment
name	VARCHAR(100)	Candidate's full name	Not Null
party	VARCHAR(50)	Political party of the candidate	Not Null
election_id	INT	Election the candidate is running in	Foreign Key to Election(election_id), Not Null
vote_count	INT	Number of votes the candidate has received	Default: 0, Not Null
________________________________________
3. Election Table
Column Name	Data Type	Description	Constraints
election_id	INT AUTO_INCREMENT	Unique identifier for each election	Primary Key, Not Null, Auto Increment
name	VARCHAR(255)	Name of the election (e.g., "Presidential Election 2024")	Not Null
start_date	DATE	Date when the election starts	Not Null
end_date	DATE	Date when the election ends	Not Null
election_status	ENUM('Ongoing', 'Completed', 'Scheduled')	Status of the election (e.g., Ongoing, Completed)	Default: 'Scheduled', Not Null
________________________________________
4. Vote Table
Column Name	Data Type	Description	Constraints
vote_id	INT AUTO_INCREMENT	Unique identifier for each vote	Primary Key, Not Null, Auto Increment
voter_id	INT	ID of the voter casting the vote	Foreign Key to Voter(voter_id), Not Null
candidate_id	INT	ID of the candidate being voted for	Foreign Key to Candidate(candidate_id), Not Null
election_id	INT	ID of the election in which the vote is cast	Foreign Key to Election(election_id), Not Null
vote_time	TIMESTAMP	Timestamp when the vote was cast	Default: CURRENT_TIMESTAMP, Not Null
________________________________________
5. Admin Table
Column Name	Data Type	Description	Constraints
admin_id	INT AUTO_INCREMENT	Unique identifier for each admin	Primary Key, Not Null, Auto Increment
name	VARCHAR(50)	Admin's name	Not Null, Unique
Email	VARCHAR(255)	Admin's encrypted email	Not Null
role	ENUM('Admin', 'Manager')	Role of the admin (e.g., Admin, Manager)	Default: 'Admin', Not Null

