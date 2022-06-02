SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=0;
-- foreign key checks to 0 means, while creating tables,it will not check fks
--
-- Table structure for table `countries`
-- here i take country,state,city as 1 table,because they are similar info and 
-- give 1 primary key adr_id to connect with other tables & 1 fk  cust_id to connect with oher tables 

CREATE TABLE  `countries` (
  `COUNTRY` varchar(20) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `CITY` varchar(40) DEFAULT NULL,
  `ADR_ID` varchar(5) NOT NULL PRIMARY KEY,
  `CUST_ID` VARCHAR(10) NOT NULL 
) ENGINE=InnoDB ;
-- here foreign key is cust_id which is primary key in personal
-- primary key is adr_id , with using these 2 keys we can join with other tables & extract information
-- 
--  
-- dumping data for countries
-- data taken from telco fictional dataset,only 10 rows taken
INSERT INTO 	`countries` (`COUNTRY`,`STATE`,`CITY`,`ADR_ID`,`CUST_ID` )  VALUES
('United States', 'California','Los Angeles', 'A01', '3668-QPYBK'),
('United States', 'California', 'Los Angeles','A02', '9237-HQITU'),
('United States', 'California','Los Angeles', 'A03', '9305-CDSKC'),
('United States', 'California','Los Angeles', 'A04', '7892-POOKP'),
('United States', 'California','Los Angeles', 'A05', '0280-XJGEX'),
('United States', 'California','Los Angeles', 'A06', '4190-MFLUW'),
('United States', 'California','Los Angeles', 'A07', '8779-QRDMV'),
('United States', 'California','Los Angeles', 'A08', '1066-JKSGK'),
('United States', 'California','Los Angeles', 'A09', '6467-CHFZW'),
('United States', 'California','Los Angeles', 'A10', '8665-UTDHZ');

--
-- checking table with values
--
SELECT * FROM COUNTRIES;
-- ------------------------------------------------------------------------------
-- Table structure for table `address`
-- all address labels with numbers,i take into 1 table called address
--  it will connect to countries with adr_id as fk
CREATE TABLE  `address` (
  `ADR_ID` varchar(5) NOT NULL ,
  `ZIPCODE` varchar(30) NOT NULL,
  `LAT LONG` varchar(30) NOT NULL,
  `LATTITUDE` varchar(30) NOT NULL,
  `LONGITUDE` varchar(30) NOT NULL
  )  ENGINE=innodb ;
-- in this table,no primary keys are there, only  foreign key present that is adr_id which is primary key in countries
-- with this we can join address & countries table
-- and also with help of id table, we can connect with other tables & extract information. 
--
--  dumping data for address
--
INSERT INTO `address` (`ADR_ID`,`ZIPCODE`,`LAT LONG`,`LATTITUDE`,`LONGITUDE` )  VALUES
( 'A01', '90003', '33.964131, -118.272783','33.964131','-118.272783'),
('A02','90005', '34.059281, -118.30742', '34.059281', '-118.30742'),
( 'A03','90006', '34.048013, -118.293953','34.048013', '-118.293953'),
( 'A04','90010', '34.062125, -118.315709','34.062125', '-118.315709'),
( 'A05','90015', '34.039224, -118.266293','34.039224', '-118.266293'),
('A06','90020', '34.066367, -118.309868','34.066367',  '-118.309868'),
( 'A07','90022', '34.02381, -118.156582','34.02381', '-118.156582'),
( 'A08','90024', '34.066303, -118.435479','34.066303', '-118.435479'),
('A09','90028', '34.099869, -118.326843','34.099869',  '-118.326843'),
( 'A10','90024', '34.089953, -118.294824','34.089953', '-118.294824');
-- 
-- checking table with values
--
 select * from address;
 -- -----------------------------------------------------------------------------------
-- Table structure for table `services`
-- all services, i kept in one table called services,
-- i creates pk serv_id to connect with other tables
-- i used fk pay_id here, to connect with payment table
CREATE TABLE  `services` (
  `SERV_ID` varchar(5) NOT NULL ,
  `STREAMING_MOVIES` varchar(35) DEFAULT NULL,
  `STREAMING TV` varchar(35) DEFAULT NULL,
  `TECH SUPPORT` varchar(35) DEFAULT NULL,
  `DEVICE PROTECTION` varchar(20) DEFAULT NULL,
  `ONLINE BACKUP` varchar(20) DEFAULT NULL,
  `ONLINE SECURITY` varchar(20) DEFAULT NULL,
  `INTERNET SERVICE` varchar(20) DEFAULT NULL,
  `MULTIPLE LINES` varchar(20) DEFAULT NULL,
  `PHONE SERVICES` varchar(20) DEFAULT NULL,
  `PAY_ID` varchar(5) NOT NULL UNIQUE,
   PRIMARY KEY (`SERV_ID`)
  )   ENGINE=innodb ;
-- here i created serv_id columns as unique and also a primary key. 
-- pay_id is foreign key here & primary key in payment table. 
-- with this key , we can join payment & services table.
-- pay_id is unique,i can be candidate key also
-- pay_id & serv_id, when we take both, they are also candidate keys
-- dumping values into services
--
INSERT INTO `services`(`SERV_ID`,`STREAMING_MOVIES`,`STREAMING TV`,`TECH SUPPORT`,`DEVICE PROTECTION`,
`ONLINE BACKUP`,`ONLINE SECURITY`,`INTERNET SERVICE`,`MULTIPLE LINES`,`PHONE SERVICES`, `PAY_ID`)  VALUES 
('S01','NO','NO','NO','NO','YES','YES','DSL','NO','YES','P01'),
('S02','NO','NO','NO','NO','NO','NO','FIBER OPTIC','NO','YES','P02'),
('S03','YES','YES','NO','YES','NO','NO','FIBER OPTIC','YES','YES','P03'),
('S04','YES','YES','YES','YES','NO','NO','FIBER OPTIC','YES','YES','P04'),
('SO5','YES','YES','NO','YES','YES','NO','FIBER OPTIC','YES','YES','P05'),
('S06','NO','NO','YES','YES','NO','NO','DSL','NO','YES','P06'),
('S07','YES','NO','NO','YES','NO','NO','DSL','NO PHONE SERVICE','NO','P07'),
('S08','NO INTERNET SERVICE','NO INTERNET SERVICE','NO INTERNET SERVICE','NO INTERNET SERVICE','YES','NO INTERNET SERVICE','NO','NO','YES','P08'),
('S09','YES','YES','NO','NO','YES','NO','FIBER OPTIC','YES','YES','P09'),
('S10','NO','NO','NO','NO','YES','NO','DSL','NO INTERNET SERVICE','NO','P10');
--
-- checking values in table
--
select * from services;
-- -------------------------------------------------------------------------------------------------------------------------
-- Table structure for table `PAYMENT`
--  all payment related columns ,i take into 1 table
-- i created pay_id as pk to avoid duplicates
-- i use 2 fks here cust_id,churn_id to connect to tables
CREATE TABLE  `payment` (
  `PAY_ID` varchar(5) NOT NULL,
  `CUST_ID` varchar(10) NOT NULL UNIQUE,
  `CHURN_ID` varchar(5) NOT NULL,
  `PAYMENT_METHOD` varchar(50) DEFAULT NULL,
  `PAPERLESS_BILLING` varchar(35) DEFAULT NULL,
  `CONTRACT` varchar(35) DEFAULT NULL,
  `TENURE_MONTHS` decimal(6,0) DEFAULT NULL,
  `MONTHLY_CHARGES` decimal(6,0) DEFAULT NULL,
  `TOTAL_CHARGES` decimal(6,0) DEFAULT NULL,
  `COUNT` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`PAY_ID`),
  KEY `personal_TO_payment` (`CUST_ID`),
  KEY `churn_TO_payment`  (`CHURN_ID`) 
  )  ENGINE=innodb ;
  -- here i created pay_id column as a primary key. 
  -- cust_id,churn_id are foreign keys in this table. 
  -- they are primary keys in personal & churn tables.
  -- as cust_id is not null & unique, so it is candidate key
  -- with help of candidate key , we can access rows of this table
  -- DUMPING DATA INTO PAYMENT
  --
  INSERT INTO 	`PAYMENT` (`PAY_ID`,`CUST_ID`,`CHURN_ID`,`PAYMENT_METHOD`,`PAPERLESS_BILLING`,`CONTRACT`,
  `TENURE_MONTHS`,`MONTHLY_CHARGES`,`TOTAL_CHARGES`,`COUNT`) VALUES
  ('P01','3668-QPYBK','C01','Mailed check','YES','Month-to-month',2,53.85,108.15,1),
('P02','9237-HQITU','C02','Electronic check','YES','Month-to-month',2,70.7,151.65,1),
 ('P03','9305-CDSKC','C03','Electronic check','YES','Month-to-month',8,99.65,820.5,1), 
 ('P04','7892-POOKP','C04','Electronics check','YES','Month-to-month',28,104.8,3046.08,1),
('P05','0280-XJGEX','C05','Bank Transfer','YES','Month-to-month',49,103.7,5036.3,1),
 ('P06','4190-MFLUW','C06','Credit card (automatic)','NO','Month-to-month',10,55.2,528.35,1),
('P07','8779-QRDMV','C07','Electronic check','YES','Month-to-month',1,39.65,39.65,1),
 ('P08','1066-JKSGK','C08','Mailed check','NO','Month-to-month',1,20.15,20.15,1), 
 ('P09','6467-CHFZW','C09','Electronics check','YES','Month-to-month',47,99.35,4749.15,1),
('P10','8665-UTDHZ','C10','Electronic check','NO','Month-to-month',1,30.2,30.2,1);
  --
  -- checking table with values
  --
select * from payment;
-- ------------------------------------------------------------------------------------------------------------
-- Table structure for table `churn`
-- all churn related columns, i created 1 table called churn,
-- i created churn_id as pk to avoid duplicates
-- i use cust_id,serv_id as fks to connect with their refernece tables
-- i gave cust_id as unique ,so we can acess table with cust_id also
CREATE TABLE `churn` (
  `CHURN_ID` varchar(5) NOT NULL ,
  `CHURN_REASON` varchar(35) NOT NULL,
  `CHURN_SCORE` decimal(6,0) DEFAULT NULL,
  `CLTV` decimal(6,0) DEFAULT NULL,
  `CHURN` decimal(6,0) DEFAULT NULL,
   `CUST_ID` varchar(10)  NOT NULL UNIQUE,
    `SERV_ID` varchar(5)  NOT NULL,
  PRIMARY KEY (`CHURN_ID`)
  )  ENGINE=innodb ;
  -- here i created primary key with churn id for this table.
  -- cust_id & serv_id are foreign keys with reference to their reference tables.
 --  as cust_id is not null & unique, it is candidate key
 -- with help of candidate key, we can acess table rows
 -- churn_id & cust_id both together can also become candiadate keys, as both are not null & unique
  -- dumping data for table churn
  --
  INSERT INTO 	`CHURN`(`CHURN_ID`,`CHURN_REASON`,`CHURN_SCORE`,`CLTV`,`CHURN`,`CUST_ID`,`SERV_ID`) VALUES
  ('C01','Competitor made better offer',86,3239,1,'3668-QPYBK','S01'),
  ('C02','MOVED',67,2701,1,'9237-HQITU','S02'),
   ('C03','MOVED',86,5372,1,'9305-CDSKC','S03'),
    ('C04','MOVED',84,5003,1,'7892-POOKP','S04'),
   ('C05','Competitor had better devices',89,5340,1,'0280-XJGEX','S05'),
   ('C06','Competitor made better offer',78,5925,1,'4190-MFLUW','S06'),
   ('C07','Competitor made better offer',100,5433,1,'8779-QRDMV','S07'),
   ('C08','Competitor made better offer',92,4832,1,'1066-JKSGK','S08'),
   ('C09','Competitor made better offer',77,5789,1,'6467-CHFZW','S09'),
   ('C10','Competitor made better offer',94,2915,1,'8665-UTDHZ','S10');
  --
  -- checking table with values
  --
select * from churn;
--  ----------------------------------------------------------------------------------------------
-- Table structure for table `personal`
-- all personal information, i kept in 1 table
-- i take cust_id as pk, because all customers have unique id,no duplicates
CREATE TABLE  `personal` (
  `CUST_ID` varchar(10) NOT NULL ,
  `GENDER` varchar(10) NOT NULL,
   `DEPENDENTS` varchar(10) NOT NULL,
    `PARTNER` varchar(10) NOT NULL,
     `SENIOR_CITIZEN` varchar(10) NOT NULL,
  PRIMARY KEY (`CUST_ID`))ENGINE=innodb ;
-- here primary key is cust_id, which is not null & unique 
-- it is also foreign key to some tables
-- it is also candidate kay in oher tables
-- dumping data into table personal
--
INSERT INTO `personal`(`CUST_ID`,`GENDER`,`DEPENDENTS`,`PARTNER`,`SENIOR_CITIZEN`) VALUES
('3668-QPYBK','male','no','no','no'),
  ('9237-HQITU','female','yes','no','no'),
   ('9305-CDSKC','female','yes','no','no'),
    ('7892-POOKP','female','yes','yes','no'),
   ('0280-XJGEX','male','yes','no','no'),
   ('4190-MFLUW','female','no','yes','no'),
   ('8779-QRDMV','male','no','no','yes'),
   ('1066-JKSGK','male','no','no','no'),
   ('6467-CHFZW','male','yes','yes','no'),
   ('8665-UTDHZ','male','no','yes','no');
--
-- checking table with values
--
SELECT * FROM PERSONAL;
--  -----------------------------------------------------------------------------
-- Table structure for table `id`
--
CREATE TABLE  `ID` (
  `CUST_ID` varchar(10) NOT NULL ,
 `CHURN_ID` varchar(5) DEFAULT NULL,
  `ADR_ID` varchar(5) DEFAULT NULL,
  `PAY_ID` varchar(5) DEFAULT NULL,
    `SERV_ID` varchar(5)  DEFAULT NULL
  )
  ENGINE=innodb ;
  -- to keep all ids in one table ,i created this table
	-- here all constraints are foreign keys, which are primary keys in their own references table.
    -- this table for storing ids or primary keys of all table. but they are not primary key in this table. 
   -- dumping data into table id
   --
   INSERT INTO 	`ID` (`CUST_ID`,`CHURN_ID`,`ADR_ID`,`PAY_ID`,`SERV_ID`) VALUES 
   ('3668-QPYBK','C01','A01','P01','S01'),
  ('9237-HQITU','C02','A02','P02','S02'),
   ('9305-CDSKC','C03','A03','P03','S03'),
    ('7892-POOKP','C04','A04','P04','S04'),
   ('0280-XJGEX','C05','A05','P05','S05'),
   ('4190-MFLUW','C06','A06','P06','S06'),
   ('8779-QRDMV','C07','A07','P07','S07'),
   ('1066-JKSGK','C08','A08','P08','S08'),
   ('6467-CHFZW','C09','A09','P09','S09'),
   ('8665-UTDHZ','C10','A10','P10','S10');
  --
  -- check table with values
  --
select * from id;
--  -------------------------------------------------------------------------------------------------------------
-- Aadding constraints to tables with foreign keys
ALTER TABLE `COUNTRIES`
ADD  CONSTRAINT `personal_TO_countries` FOREIGN KEY (`CUST_ID`) REFERENCES `personal` (`CUST_ID`);
-- with this we can join countries & personal table o exract information

ALTER TABLE 	`ADDRESS`
ADD CONSTRAINT `countries_TO_address` FOREIGN KEY (`ADR_ID`) REFERENCES `COUNTRIES` (`ADR_ID`);
-- with this we can join address & counris table to get data

ALTER table	`SERVICES`
ADD  CONSTRAINT `payment_TO_services` FOREIGN KEY (`PAY_ID`) REFERENCES `PAYMENT` (`PAY_ID`);
-- with this we can join services to payment, o get data

ALTER TABLE 	`PAYMENT`
ADD CONSTRAINT `personal_TO_payment` FOREIGN KEY (`CUST_ID`) REFERENCES `PERSONAL` (`CUST_ID`),
ADD  CONSTRAINT `churn_TO_payment` FOREIGN KEY (`CHURN_ID`) REFERENCES `CHURN` (`CHURN_ID`);
-- with this we can join payment with personal & services tables

ALTER TABLE `CHURN` 
ADD CONSTRAINT `personal_TO_churn` FOREIGN KEY (`CUST_ID`) REFERENCES `PERSONAL` (`CUST_ID`),
ADD  CONSTRAINT `services_TO_churn` FOREIGN KEY (`SERV_ID`) REFERENCES `SERVICES` (`SERV_ID`);
-- with this we can join churn & personal & services tables

ALTER TABLE `ID`
ADD  CONSTRAINT `personal_TO_id` FOREIGN KEY (`CUST_ID`) REFERENCES `PERSONAL` (`CUST_ID`),
ADD   CONSTRAINT `churn_TO_id` FOREIGN KEY (`CHURN_ID`) REFERENCES `CHURN` (`CHURN_ID`),
ADD   CONSTRAINT `countries_TO_id` FOREIGN KEY (`ADR_ID`) REFERENCES `COUNTRIES` (`ADR_ID`),
ADD   CONSTRAINT `payment_TO_id` FOREIGN KEY (`PAY_ID`) REFERENCES `PAYMENT` (`PAY_ID`),
 ADD  CONSTRAINT `services_TO_id` FOREIGN KEY (`SERV_ID`) REFERENCES `SERVICES` (`SERV_ID`);
 -- with this we can join id table with all other tables having primary keys
 
SET FOREIGN_KEY_CHECKS=1; 
-- this is for to check on fks after creating database
 COMMIT;