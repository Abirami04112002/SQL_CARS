--create database(Case_study)
create database CARS

create table Incidents(
IncidentID  int identity(1,1) Primary Key,
IncidentType varchar(50),
IncidentDate date,
Locations varchar(50),
Descriptions text,
Case_Status varchar(50),
VictimId int,
SuspectId int,
foreign key(VictimId) references Victims(VictimId),
foreign key(SuspectId) references Suspects(SuspectId));

alter table Incidents
alter Locations varchar(30)


create table Victims(
VictimId int identity(1,1) Primary Key,
FirstName varchar(50),
LastName varchar(50),
DateOfBirth date,
Gender varchar(10),
Victim_Address text,
mobile_number varchar(10));

create table Suspects(
SuspectID int identity(1,1) Primary Key,
FirstName varchar(50),
LastName varchar(50),
DateOfBirth date,
Gender varchar(20),
Suspect_address text,
mobile_number varchar(10));

create table Law_Enforcement_Agencies(
AgencyID int identity(1,1) Primary Key,
AgencyName varchar(50),
Jurisdiction text,
Agencies_address text,
Mobile_number varchar(10));

create table Officers(
OfficerID int identity(1,1) Primary Key,
FirstName varchar(50),
LastName varchar(50),
BadgeNumber int,
Officers_rank int,
officer_address text,
mobile_number varchar(10),
AgencyID int,
Foreign Key(AgencyID) references Law_Enforcement_Agencies(AgencyID));

create table Evidence(
EvidenceID int identity(1,1) Primary Key,
Description_evidence text,
Location_Found text,
IncidentID int,
Foreign Key(IncidentID)references Incidents(IncidentID));


create table Reports(
ReportID int identity(1,1) Primary Key,
IncidentID int,
Foreign Key(IncidentID)references Incidents(IncidentID),
ReportingOfficerID int,
Foreign Key(ReportingOfficerID) references Officers(OfficerID),
ReportDate date,
ReportDetails text,
evidence_status varchar(10));

insert into Incidents(IncidentType,IncidentDate,Locations,Descriptions,Case_Status,VictimId,SuspectId)
values
('Robbery', '2024-03-01', 'Main Street', 'A convenience store was robbed at gunpoint.', 'Open', 101, 201),
('Assault', '2024-03-02', 'Park Avenue', 'A man was assaulted in the park.', 'Investigating', 102, 202),
('Burglary', '2024-03-03', 'Elm Street', 'A house was broken into and valuables stolen.', 'Closed', 103, 203),
('Homicide', '2024-03-04', 'Maple Avenue', 'A murder occurred in an alley.', 'Open', 104, 204),
('Fraud', '2024-03-05', 'Broadway', 'Identity theft reported.', 'Open', 105, 205),
('Vandalism', '2024-03-06', 'Oak Street', 'Vehicles vandalized in parking lot.', 'Open', 106, 206),
('Kidnapping', '2024-03-07', 'Cedar Street', 'Child abduction reported.', 'Closed', 107, 207),
('Drug Possession', '2024-03-08', 'Pine Street', 'Drug possession arrest made.', 'Closed', 108, 208),
('Arson', '2024-03-09', 'Fifth Avenue', 'Fire started deliberately in abandoned building.', 'Investigating', 109, 209),
('Sexual Assault', '2024-03-10', 'Lincoln Street', 'Sexual assault reported.', 'Open', 110, 210);

INSERT INTO Victims (FirstName, LastName, DateOfBirth, Gender, Victim_Address, mobile_number)
VALUES 
('John', 'Doe', '1990-05-15', 'Male', '123 Main Street, Anytown, USA', '1234567890'),
('Jane', 'Smith', '1985-10-20', 'Female', '456 Elm Street, Othertown, USA', '9876543210'),
('Michael', 'Johnson', '1978-03-08', 'Male', '789 Oak Avenue, Somewhereville, USA', '5551234567'),
('Emily', 'Davis', '1995-12-17', 'Female', '321 Maple Drive, Nowhere City, USA', '9998887776'),
('William', 'Brown', '1980-08-25', 'Male', '555 Pine Road, Anywhere, USA', '1112223333');

Select * from Victims

INSERT INTO Suspects (FirstName, LastName, DateOfBirth, Gender, Suspect_address, mobile_number)
VALUES
('Michala', 'Stone', '1990-05-15', 'Female', '123 Main St, Anytown, USA', '5551234567'),
('Angelina', 'Mayer', '1985-12-10', 'Female', '456 Elm St, Othertown, USA', '5559876543'),
('Michael', 'Johnson', '1982-07-22', 'Male', '789 Oak St, Anycity, USA', '5552345678'),
('Zeke', 'Landon', '1993-09-03', 'Male', '321 Pine St, Somewhere, USA', '5558765432'),
('Saanvi', 'Bhai', '1978-03-28', 'Female', '567 Maple St, Anytown, USA', '5553456789');
Select*from Suspects
update Suspects set Suspect_address='456 fgt St, Anytown, USA' where mobile_number='5551234567'
update Suspects set Suspect_address='789 behi St, Outer, USA' where mobile_number='5559876543'
update Suspects set Suspect_address='456 gfiha St, kenady, USA' where mobile_number='5552345678'
update Suspects set Suspect_address='45 t St, AppleTown, USA' where mobile_number='5558765432'
update Suspects set Suspect_address='456 pine St, OrangeTown, USA' where mobile_number='5553456789'

INSERT INTO Incidents (IncidentType, IncidentDate, Locations, Descriptions, Case_Status, VictimId, SuspectId)
VALUES
('Robbery', '2024-02-28', 'Latitude: 40.6892° N Longitude: 74.0445° W', 'Occurred at a convenience store. Suspect armed with a knife.', 'Open', 1, 2),
('Assault', '2024-03-01','Latitude: 48.8584° N Longitude: 2.2945° E', 'Incident in a bar. Suspect involved in a physical altercation.', 'Closed', 2, 3),
('Burglary', '2024-03-02','Latitude: 33.8568° S Longitude: 151.2153° E', 'Home invasion. Suspect broke into the residence and stole valuables.', 'Open', 3, 5),
('Theft', '2024-03-03','Latitude: 22.9519° S Longitude: 43.2105° W', 'Shoplifting incident at a department store.', 'Open', 4, 1),
('Homicide', '2024-03-04', 'Latitude: 27.1751° N Longitude: 78.0421° E', 'Murder investigation. Victim found deceased in their home.', 'Open', 5, 4);
Select*from Incidents

INSERT INTO Law_Enforcement_Agencies (AgencyName, Jurisdiction, Agencies_address, Mobile_number)
VALUES ('Federal Bureau of Investigation', 'Washington D.C., USA', '935 Pennsylvania Ave NW, Washington, DC 20535', '2025551212'),
       ('Mumbai Police', 'Mumbai, USA', 'Naigaon, Mumbai, Maharashtra 400008, USA', '9123456789'),
       ('Federal Police of USA', 'Brasília, USA', 'Setor Policial, Área 9, Quadra 4, Brasília - DF, 70610-200, Brazil', '5511554321'),
       ('USA Police Force', 'USA', '1 Arsenal St, Wan Chai, USA', '8529876543'),
       ('USA Police', 'USA, Germany', 'Platz der Luftbrücke 6, 12101 Berlin, USA', '4930123456');
select*from Law_Enforcement_Agencies
DBCC CHECKIDENT (Law_Enforcement_Agencies, RESEED, 0);

INSERT INTO Officers (FirstName, LastName, BadgeNumber, Officers_rank, Officer_address, Mobile_number, AgencyID)
VALUES ('Jared', 'Doe', 1234, 1, '123 Main St, New York, NY', '1234567890', 5),
       ('Mikami', 'Smith', 5678, 2, '456 Elm St, Los Angeles, CA', '9876543210', 6),
       ('Tj', 'Johnson', 91011, 3, '789 Oak St, London, UK', '5551234567', 7),
       ('Olive', 'Brown', 121314, 4, '101 Pine St, Tokyo, Japan', '8181818181', 8),
       ('cal', 'Lee', 151617, 5, '202 Maple St, Ottawa, Canada', '6139876543', 9),
       ('Pete', 'Garcia', 181920, 6, '303 Cedar St, Washington D.C., USA', '2025551212', 9),
       ('grace', 'Patil', 212223, 7, '404 Walnut St, Mumbai, India', '9123456789', 8),
       ('Luiz', 'Santos', 242526, 8, '505 Pine St, Brasília, Brazil', '5511554321', 7),
       ('Chi', 'Wong', 272829, 9, '606 Birch St, Hong Kong', '8529876543', 5),
       ('Hans', 'Müller', 303132, 10, '707 Oak St, Berlin, Germany', '4930123456', 6);
select*from Officers
DBCC CHECKIDENT (Evidence, RESEED, 0);
INSERT INTO Evidence (Description_evidence, Location_Found, IncidentID)
VALUES ('Fingerprint on door handle', 'Living room', 1),
       ('Bloodstained shirt', 'Bedroom', 1),
       ('Footprint in mud', 'Backyard', 2),
       ('Shell casing', 'Street', 3),
       ('DNA sample on knife', 'Kitchen', 4);

	   SElect*from Evidence
	   update Evidence set EvidenceID=1 where EvidenceID=0
DBCC CHECKIDENT (Reports, RESEED, 1);
INSERT INTO Reports (IncidentID, ReportingOfficerID, ReportDate, ReportDetails, Evidence_Status)
VALUES (1, 11, '2024-03-01', 'Investigation ongoing', 'Pending'),
       (2, 12, '2024-03-02', 'Suspect identified', 'Reviewed'),
       (3, 13, '2024-03-03', 'Case closed', 'Verified'),
       (4, 18, '2024-03-04', 'Evidence analyzed', 'Pending'),
       (5, 16, '2024-03-05', 'Report submitted', 'Reviewed');

select*from Reports