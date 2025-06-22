use project_1;
												
									-- MASTER TABLES 
                                                
-- 1.create Vehicle_Make table
CREATE TABLE Vehicle_Make(
make_id INT,
make_desc VARCHAR(100) NOT NULL,
status VARCHAR(10) NOT NULL,
added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
added_by VARCHAR(100),
CONSTRAINT pk_vehicle_make PRIMARY KEY(make_id),
CONSTRAINT chk_vehicle_make CHECK(status in('active', 'inactive'))
);

DESC Vehicle_Make;

--  insert the values for Vehicle_Make table
INSERT INTO vehicle_make (make_id, make_desc, status, added_on, added_by) VALUES
(100, 'Toyota', 'active',CURRENT_DATE,'admin'),
(101, 'Honda','inactive','2024-11-10','admin'),
(102, 'Ford','active','2025-01-15','admin'),
(103, 'Hyundai','inactive',CURRENT_DATE,'admin'),
(104, 'Kia','active',CURRENT_DATE,'admin'),
(105, 'Nissan','inactive','2024-12-20','admin'),
(106, 'Chevrolet','active',CURRENT_DATE,'admin'),
(107, 'Volkswagen','inactive','2025-04-02','admin'),
(108, 'Mercedes-Benz','active',CURRENT_DATE,'admin'),
(109, 'BMW','inactive', CURRENT_DATE,'admin'),
(110, 'Audi','active','2024-10-01','admin'),
(111, 'Tata Motors','inactive','2025-05-01','admin'),
(112, 'Mahindra','active',CURRENT_DATE,'admin'),
(113, 'Renault','inactive','2024-09-09','admin'),
(114, 'Skoda','active',CURRENT_DATE,'admin'),
(115, 'Fiat','inactive',CURRENT_DATE,'admin'),
(116, 'Jeep','active','2025-06-01','admin'),
(117, 'MG Motor','inactive','2025-01-25','admin'),
(118, 'Volvo','active',CURRENT_DATE,'admin'),
(119, 'Lexus','inactive','2025-02-14','admin'),
(120, 'Porsche','active',CURRENT_DATE,'admin'),
(121, 'Mitsubishi','inactive', CURRENT_DATE,'admin'),
(122, 'Suzuki','active',CURRENT_DATE,'admin'),
(123, 'Isuzu','inactive','2025-05-18','admin'),
(124, 'Bugatti','active',CURRENT_DATE,'admin');

SELECT * FROM Vehicle_Make;


-- 2.create Vehicle Model table

CREATE TABLE Vehicle_Model(
model_id INT,
model_desc VARCHAR(100) NOT NULL,
status VARCHARACTER(10) NOT NULL,
added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
added_by VARCHAR(50),
make_id INT,
CONSTRAINT pk_Vehicle_Model PRIMARY KEY(model_id),
CONSTRAINT chk_Vehicle_Model CHECK(status in ('active', 'inactive')),
CONSTRAINT fk_Vehicle_Model FOREIGN KEY(make_id) REFERENCES Vehicle_Make(make_id)
);

DESC Vehicle_Model;

-- insert value from  Vehicle Model table
INSERT INTO vehicle_model (model_id,model_desc,status,added_on,added_by,make_id) VALUES
(200,'Corolla','active',CURRENT_DATE,'admin',100),
(201,'Camry','active','2024-11-10','admin',100),
(202,'Civic','inactive','2025-01-05','admin',101),
(203,'Accord','active',CURRENT_DATE,'admin',101),
(204,'Mustang','active','2025-02-20','admin',102),
(205,'F150','inactive',CURRENT_DATE,'admin',102),
(206,'Elantra','active',CURRENT_DATE,'admin',103),
(207,'Sonata','inactive','2025-03-03','admin',103),
(208,'Seltos','active','2025-01-25','admin',104),
(209,'Sportage','active',CURRENT_DATE,'admin',104),
(210,'Altima','inactive','2024-09-09','admin',105),
(211,'Sentra','active',CURRENT_DATE,'admin',105),
(212,'Cruze','active','2024-10-20','admin',106),
(213,'Spark','inactive',CURRENT_DATE,'admin',106),
(214,'Jetta','active',CURRENT_DATE,'admin',107),
(215,'Passat','active','2025-04-11','admin',107),
(216,'CClass','inactive','2024-08-14','admin',108),
(217,'EClass','active',CURRENT_DATE,'admin',108),
(218,'ThreeSeries','active','2025-02-07','admin',109),
(219,'FiveSeries','inactive',CURRENT_DATE,'admin',109),
(220,'Q5','active',CURRENT_DATE,'admin',110),
(221,'A4','active','2024-11-29','admin',110),
(222,'Harrier','inactive',CURRENT_DATE,'admin',111),
(223,'Safari','active',CURRENT_DATE,'admin',111),
(224,'Thar','active','2025-04-21','admin',112);

select * from vehicle_model;

--  3.create vehicle_color table
CREATE TABLE vehicle_color (
    color_id INT,
    color_name VARCHAR(50) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_vehicle_color PRIMARY KEY(color_id),
    CONSTRAINT chk_vehicle_color_status CHECK (status IN ('active','inactive'))
);
DESC vehicle_color;

-- inserting into values for vehicle_color table 
INSERT INTO vehicle_color (color_id,color_name,status,added_on,added_by) VALUES
(300,'White','active',CURRENT_DATE,'admin'),
(301,'Black','active','2024-12-01','admin'),
(302,'Silver','inactive',CURRENT_DATE,'admin'),
(303,'Grey','active',CURRENT_DATE,'admin'),
(304,'Red','active',DATE '2024-11-20','admin'),
(305,'Blue','inactive',CURRENT_DATE,'admin'),
(306,'Green','active',CURRENT_DATE,'admin'),
(307,'Yellow','inactive','2025-01-15','admin'),
(308,'Orange','active',CURRENT_DATE,'admin'),
(309,'Brown','inactive','2024-10-10','admin'),
(310,'Maroon','active',DATE '2025-03-03','admin'),
(311,'Beige','active',CURRENT_DATE,'admin'),
(312,'Gold','inactive','2024-09-30','admin'),
(313,'Purple','active','2025-04-18','admin'),
(314,'Teal','inactive',CURRENT_DATE,'admin'),
(315,'Navy','active','2025-02-22','admin'),
(316,'SkyBlue','inactive','2025-05-01','admin'),
(317,'Magenta','active',CURRENT_DATE,'admin'),
(318,'Pink','inactive','2024-08-18','admin'),
(319,'Olive','active',CURRENT_DATE,'admin'),
(320,'Turquoise','inactive','2024-07-15','admin'),
(321,'Lavender','active','2025-03-27','admin'),
(322,'Bronze','inactive',CURRENT_DATE,'admin'),
(323,'Charcoal','active','2025-01-01','admin'),
(324,'Champagne','inactive',CURRENT_DATE,'admin');

SELECT * from vehicle_color;

-- 4.create vehicle_body table
CREATE TABLE vehicle_body (
    body_id INT,
    body_type VARCHAR(50) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_vehicle_body PRIMARY KEY(body_id),
    CONSTRAINT chk_vehicle_body_status CHECK (status IN ('active','inactive'))
);

DESC vehicle_body;

-- insert values for vehicle_body table
INSERT INTO vehicle_body (body_id,body_type,status,added_on,added_by) VALUES
(400,'Sedan','active',CURRENT_DATE,'admin'),
(401,'Hatchback','active','2025-01-01','admin'),
(402,'SUV','inactive',CURRENT_DATE,'admin'),
(403,'Coupe','active',CURRENT_DATE,'admin'),
(404,'Convertible','active','2024-11-15','admin'),
(405,'Wagon','inactive','2024-12-20','admin'),
(406,'Van','active',CURRENT_DATE,'admin'),
(407,'Minivan','active','2025-02-02','admin'),
(408,'Truck','inactive',CURRENT_DATE,'admin'),
(409,'Pickup','active','2025-03-03','admin'),
(410,'Jeep','active',CURRENT_DATE,'admin'),
(411,'4x4','inactive','2025-01-25','admin'),
(412,'Tankers','active','2024-09-10','admin'),
(413,'Bus','inactive',CURRENT_DATE,'admin'),
(414,'Microbus','active','2025-04-12','admin'),
(415,'Roadster','active','2025-01-19','admin'),
(416,'Sports','inactive',CURRENT_DATE,'admin'),
(417,'Crossover','active','2024-10-20','admin'),
(418,'Limousine','inactive','2024-11-09','admin'),
(419,'Offroader','active',CURRENT_DATE,'admin');

SELECT * from vehicle_body;

-- 5.create vehicle_category table
CREATE TABLE vehicle_category (
    category_id INT,
    category_name VARCHAR(50) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_vehicle_category PRIMARY KEY(category_id),
    CONSTRAINT chk_vehicle_category_status CHECK (status IN ('active','inactive'))
);

DESC vehicle_category;

-- insert values into vehicle_category
INSERT INTO vehicle_category (category_id,category_name,status,added_on,added_by) VALUES
(500,'Private','active',CURRENT_DATE,'admin'),
(501,'Commercial','active','2025-01-01','admin'),
(502,'Taxi','inactive',CURRENT_DATE,'admin'),
(503,'Motorcycle','active','2025-02-10','admin'),
(504,'Scooter','active','2024-10-10','admin'),
(505,'Bus','inactive','2024-11-05','admin'),
(506,'Truck','active',CURRENT_DATE,'admin'),
(507,'Delivery','inactive','2025-03-03','admin'),
(508,'Ambulance','active',CURRENT_DATE,'admin'),
(509,'FireTruck','active','2024-12-25','admin'),
(510,'Police','inactive','2025-01-22','admin'),
(511,'SchoolVan','active',CURRENT_DATE,'admin'),
(512,'Rental','inactive','2025-04-01','admin'),
(513,'Tourism','active','2025-01-15','admin'),
(514,'Luxury','active',CURRENT_DATE,'admin'),
(515,'Agriculture','inactive','2024-08-18','admin'),
(516,'Mining','active',CURRENT_DATE,'admin'),
(517,'Container','active','2024-09-09','admin'),
(518,'CNG','inactive','2025-05-05','admin'),
(519,'Electric','active',CURRENT_DATE,'admin');

SELECT * FROM vehicle_category;


-- 6. create country table 
CREATE TABLE countries (
    country_id INT ,
    country_name VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_country_id PRIMARY KEY(country_id),
    CONSTRAINT chk_country_status CHECK (status IN ('active', 'inactive'))
);
DESC countries;

-- insert values into country
INSERT INTO countries (country_id,country_name,status,added_on,added_by) VALUES
(600,'India','active',CURRENT_DATE,'admin'),
(601,'UnitedStates','active',DATE '2025-01-01','admin'),
(602,'UnitedKingdom','inactive',DATE '2025-02-10','admin'),
(603,'Germany','active',CURRENT_DATE,'admin'),
(604,'France','active',DATE '2025-03-03','admin'),
(605,'Australia','inactive',DATE '2025-01-20','admin'),
(606,'Canada','active',CURRENT_DATE,'admin'),
(607,'Japan','inactive',DATE '2024-12-12','admin'),
(608,'SouthKorea','active',CURRENT_DATE,'admin'),
(609,'Italy','active',DATE '2025-01-15','admin'),
(610,'Spain','inactive',CURRENT_DATE,'admin'),
(611,'Netherlands','active',DATE '2024-11-25','admin'),
(612,'Brazil','active',CURRENT_DATE,'admin'),
(613,'Mexico','inactive',DATE '2025-02-28','admin'),
(614,'Russia','active',CURRENT_DATE,'admin'),
(615,'SouthAfrica','inactive',DATE '2024-09-09','admin'),
(616,'NewZealand','active',CURRENT_DATE,'admin'),
(617,'China','inactive',DATE '2024-08-18','admin'),
(618,'Singapore','active',CURRENT_DATE,'admin'),
(619,'UAE','active',DATE '2025-03-05','admin');

SELECT * FROM countries;


-- 7. create regions table
CREATE TABLE regions (
    region_id INT,
    region_name VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_region_id PRIMARY KEY(region_id),
    CONSTRAINT chk_region_status CHECK (status IN ('active', 'inactive')),
    CONSTRAINT fk_region_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

DESC regions;
Drop table regions;
-- insert values into region table
INSERT INTO regions (region_id,region_name,country_id,status,added_on,added_by) VALUES
(700,'South',600,'active',CURRENT_DATE,'admin'),
(701,'North',600,'active',DATE '2025-01-01','admin'),
(702,'East',600,'inactive',DATE '2025-02-01','admin'),
(703,'West',600,'active',CURRENT_DATE,'admin'),
(704,'Central',600,'inactive',DATE '2024-12-12','admin'),
(705,'Northeast',600,'active',CURRENT_DATE,'admin'),
(706,'Northwest',600,'inactive',DATE '2025-01-10','admin'),
(707,'Southeast',600,'active',CURRENT_DATE,'admin'),
(708,'Southwest',600,'active',DATE '2025-02-14','admin'),
(709,'DelhiZone',600,'inactive',DATE '2025-03-03','admin'),
(710,'USMidwest',601,'active',CURRENT_DATE,'admin'),
(711,'USSouth',601,'inactive',DATE '2025-01-15','admin'),
(712,'USWest',601,'active',DATE '2025-02-11','admin'),
(713,'USEast',601,'active',CURRENT_DATE,'admin'),
(714,'Ontario',606,'active',DATE '2024-11-10','admin'),
(715,'Quebec',606,'inactive',CURRENT_DATE,'admin'),
(716,'NewSouthWales',605,'active',DATE '2025-03-04','admin'),
(717,'Queensland',605,'inactive',CURRENT_DATE,'admin'),
(718,'Hokkaido',607,'active',DATE '2025-01-25','admin'),
(719,'Kyushu',607,'active',CURRENT_DATE,'admin');

SELECT * FROM regions;

-- 8.create states table
CREATE TABLE states (
    state_id INT,
    state_name VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(100),
    region_id INT NOT NULL,
    CONSTRAINT pk_state_id PRIMARY KEY(state_id),
    CONSTRAINT chk_state_status CHECK (status IN ('active', 'inactive')),
    CONSTRAINT fk_state_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
Drop table states;
desc states;

-- insert values into states table
INSERT INTO states (state_id,state_name,status,added_on,added_by,region_id) VALUES
(800,'TamilNadu','active',CURRENT_DATE,'admin',700),
(801,'Kerala','active','2025-01-01','admin',701),
(802,'Karnataka','inactive','2025-02-10','admin',700),
(803,'AndhraPradesh','active',CURRENT_DATE,'admin',702),
(804,'Telangana','active','2025-03-03','admin',703),
(805,'Punjab','inactive','2025-01-20','admin',704),
(806,'Haryana','active',CURRENT_DATE,'admin',702),
(807,'HimachalPradesh','inactive','2024-12-12','admin',701),
(808,'WestBengal','active',CURRENT_DATE,'admin',710),
(809,'Odisha','active','2025-01-15','admin',704),
(810,'Rajasthan','inactive',CURRENT_DATE,'admin',709),
(811,'Gujarat','active','2024-11-25','admin',706),
(812,'MadhyaPradesh','active',CURRENT_DATE,'admin',704),
(813,'Chhattisgarh','inactive','2025-02-28','admin',701),
(814,'Assam','active',CURRENT_DATE,'admin',714),
(815,'Meghalaya','inactive','2024-09-09','admin',709),
(816,'Delhi','active',CURRENT_DATE,'admin',705),
(817,'Maharashtra','inactive','2024-08-18','admin',700),
(818,'Goa','active',CURRENT_DATE,'admin',700),
(819,'Bihar','active','2025-03-05','admin',702);

SELECT * from states;


-- 9.create cities table
CREATE TABLE cities (
    city_id INT,
    city_name VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(100),
    state_id INT NOT NULL,
    CONSTRAINT pk_city_id PRIMARY KEY(city_id),
    CONSTRAINT chk_city_status CHECK (status IN ('active', 'inactive')),
    CONSTRAINT fk_city_state FOREIGN KEY (state_id) REFERENCES states(state_id)
);
DESC cities;
Drop table cities;


-- insert values into cities table
INSERT INTO cities (city_id,city_name,status,added_on,added_by,state_id) VALUES
(900,'Chennai','active',CURRENT_DATE,'admin',800),
(901,'Coimbatore','active','2025-01-01','admin',800),
(902,'Madurai','inactive','2025-02-10','admin',801),
(903,'Trivandrum','active',CURRENT_DATE,'admin',800),
(904,'Kochi','active','2025-03-03','admin',801),
(905,'Bengaluru','inactive','2025-01-20','admin',802),
(906,'Mysuru','active',CURRENT_DATE,'admin',802),
(907,'Hyderabad','inactive','2024-12-12','admin',804),
(908,'Visakhapatnam','active',CURRENT_DATE,'admin',803),
(909,'Ludhiana','active','2025-01-15','admin',805),
(910,'Jaipur','inactive',CURRENT_DATE,'admin',810),
(911,'Ahmedabad','active','2024-11-25','admin',811),
(912,'Indore','active',CURRENT_DATE,'admin',812),
(913,'Raipur','inactive','2025-02-28','admin',813),
(914,'Guwahati','active',CURRENT_DATE,'admin',814),
(915,'Shillong','inactive','2024-09-09','admin',815),
(916,'NewDelhi','active',CURRENT_DATE,'admin',816),
(917,'Mumbai','inactive','2024-08-18','admin',817),
(918,'Panaji','active',CURRENT_DATE,'admin',818),
(919,'Patna','active','2025-03-05','admin',819);

SELECT * FROM cities;


-- 10.create product_config table 
CREATE TABLE product_config (
    product_id INT,
    product_name VARCHAR(100) NOT NULL,
    coverage_type VARCHAR(20) NOT NULL,
    base_premium DECIMAL(10,2) NOT NULL,
    tax_rate DECIMAL(5,2) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_product_id PRIMARY KEY(product_id),
    CONSTRAINT chk_product_coverage_type CHECK (coverage_type IN ('comprehensive','tpl','both')),
    CONSTRAINT chk_product_status CHECK (status IN ('active','inactive'))
);
DESC product_config;

-- insert into values product_config 
INSERT INTO product_config (product_id,product_name,coverage_type,base_premium,tax_rate,status,added_on,added_by) VALUES
(1000,'ComprehensiveBasic','comprehensive',3500.00,18.00,'active',CURRENT_DATE,'admin'),
(1001,'TPLStandard','tpl',1200.00,18.00,'active','2025-01-01','admin'),
(1002,'ComprehensivePlus','comprehensive',4600.00,18.00,'inactive','2025-02-10','admin'),
(1003,'TPLCommercial','tpl',2000.00,18.00,'active',CURRENT_DATE,'admin'),
(1004,'ComprehensiveElite','comprehensive',7500.00,18.00,'active','2025-03-03','admin'),
(1005,'ComboBasic','both',5500.00,18.00,'inactive','2025-01-20','admin'),
(1006,'TwoWheelerTPL','tpl',800.00,18.00,'active',CURRENT_DATE,'admin'),
(1007,'TwoWheelerComprehensive','comprehensive',2500.00,18.00,'inactive','2024-12-12','admin'),
(1008,'ElectricVehiclePlan','comprehensive',3000.00,18.00,'active',CURRENT_DATE,'admin'),
(1009,'AutoPremiumPlus','comprehensive',6200.00,18.00,'active','2025-01-15','admin'),
(1010,'TaxiProtectionPlan','both',7800.00,18.00,'inactive',CURRENT_DATE,'admin'),
(1011,'HeavyVehicleTPL','tpl',2800.00,18.00,'active','2024-11-25','admin'),
(1012,'HeavyVehicleComprehensive','comprehensive',9200.00,18.00,'active',CURRENT_DATE,'admin'),
(1013,'SUVFullCover','comprehensive',8800.00,18.00,'inactive','2025-02-28','admin'),
(1014,'BudgetComprehensive','comprehensive',3100.00,18.00,'active',CURRENT_DATE,'admin'),
(1015,'MiniTPL','tpl',950.00,18.00,'inactive','2024-09-09','admin'),
(1016,'SeniorCitizenPlan','both',5000.00,18.00,'active',CURRENT_DATE,'admin'),
(1017,'FamilyComprehensive','comprehensive',4000.00,18.00,'active','2024-08-18','admin'),
(1018,'CommercialTransportPlan','both',6200.00,18.00,'inactive',CURRENT_DATE,'admin'),
(1019,'SeasonalPlan','comprehensive',2000.00,18.00,'active','2025-03-05','admin');

SELECT * FROM product_config;



														-- TRANSACTION TABLE
                                                        
-- 1. Create users_personal_info Table:
CREATE TABLE users_personal_info (
    user_id INT,
    user_type VARCHAR(20) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    marital_status INT,
    education INT,
    phone VARCHAR(20) NOT NULL,
    mobile VARCHAR(20),
    addr1 VARCHAR(100),
    addr2 VARCHAR(100),
    addr3 VARCHAR(100),
    street VARCHAR(100),
    city_id INT,
    state_id INT,
    country_id INT,
    national_id BIGINT NOT NULL,
    nationality INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_user_id PRIMARY KEY(user_id),
    CONSTRAINT chk_user_status CHECK (status IN ('active','inactive')),
    CONSTRAINT fk_user_city FOREIGN KEY (city_id) REFERENCES cities(city_id),
    CONSTRAINT fk_user_state FOREIGN KEY (state_id) REFERENCES states(state_id),
    CONSTRAINT fk_user_country FOREIGN KEY (country_id) REFERENCES countries(country_id),
    CONSTRAINT fk_user_nationality FOREIGN KEY (nationality) REFERENCES countries(country_id)
);

DESC users_personal_info;

-- insert values to users_personal_info table
INSERT INTO users_personal_info (user_id,user_type,first_name,last_name,gender,dob,email,marital_status,education,phone,mobile,addr1,addr2,addr3,street,city_id,state_id,country_id,national_id,nationality,status,added_on,added_by) VALUES
(1,'broker','Ravi','Kumar','male',DATE '1985-01-15','ravi.kumar@example.com',1,1,'0511512345','9876543210','12 MG Road','','','Koramangala',900,800,600,123456789012,600,'active',CURRENT_DATE,'admin'),
(2,'user','Anita','Sharma','female',DATE '1990-04-22','anita.sharma@example.com',2,2,'0511512346','9876543211','34 Nungambakkam','','','Anna Salai',901,800,600,234567890123,600,'active',CURRENT_DATE,'admin'),
(3,'sales','Rahul','Verma','male',DATE '1988-11-10','rahul.verma@example.com',1,2,'0511512347','9876543212','88 Whitefield','','','Main Rd',902,800,600,345678901234,600,'inactive',CURRENT_DATE,'admin'),
(4,'broker','Suman','Jain','female',DATE '1982-09-08','suman.jain@example.com',2,1,'0511512348','9876543213','Flat 402','','','Sector 12',903,801,600,456789012345,600,'active',CURRENT_DATE,'admin'),
(5,'user','Vikram','Patel','male',DATE '1995-03-05','vikram.patel@example.com',1,3,'0511512349','9876543214','2 Park St','','','Ellis Bridge',904,802,600,567890123456,600,'active',CURRENT_DATE,'admin'),
(6,'broker','Divya','Reddy','female',DATE '1992-06-18','divya.reddy@example.com',2,2,'0511512350','9876543215','7 Jubilee Hills','','','Madhapur',905,803,600,678901234567,600,'inactive',CURRENT_DATE,'admin'),
(7,'user','Karan','Mehra','male',DATE '1987-12-30','karan.mehra@example.com',1,1,'0511512351','9876543216','9 Civil Lines','','','ML Road',906,804,600,789012345678,600,'active',CURRENT_DATE,'admin'),
(8,'broker','Pooja','Bajaj','female',DATE '1991-10-14','pooja.bajaj@example.com',2,2,'0511512352','9876543217','3 City Center','','','Hill Road',907,805,600,890123456789,600,'active',CURRENT_DATE,'admin'),
(9,'sales','Siddharth','Singh','male',DATE '1993-05-20','siddharth.singh@example.com',1,1,'0511512353','9876543218','89 Sec 19','','','Golf Course Rd',908,806,600,901234567890,600,'inactive',CURRENT_DATE,'admin'),
(10,'user','Neha','Gupta','female',DATE '1989-07-12','neha.gupta@example.com',2,3,'0511512354','9876543219','Plot 44','','','LBS Marg',909,807,600,912345678901,600,'active',CURRENT_DATE,'admin'),
(11,'broker','Ajay','Kapoor','male',DATE '1985-02-25','ajay.kapoor@example.com',1,2,'0511512360','9876543220','B-12','Greenpark','','Ring Rd',910,808,600,934567890123,600,'active',CURRENT_DATE,'admin'),
(12,'user','Meera','Joshi','female',DATE '1994-08-30','meera.joshi@example.com',2,2,'0511512361','9876543221','101','Skyline Apt','','East End',911,809,600,945678901234,600,'active',CURRENT_DATE,'admin'),
(13,'sales','Deepak','Rana','male',DATE '1986-01-05','deepak.rana@example.com',1,1,'0511512362','9876543222','22','Gandhi Rd','','Old City',912,810,600,956789012345,600,'inactive',CURRENT_DATE,'admin'),
(14,'user','Kriti','Sen','female',DATE '1993-03-18','kriti.sen@example.com',2,3,'0511512363','9876543223','3','MG Road','','Central',913,811,600,967890123456,600,'active',CURRENT_DATE,'admin'),
(15,'broker','Ramesh','Dube','male',DATE '1981-06-27','ramesh.dube@example.com',1,1,'0511512364','9876543224','90','Sector 17','','Town Center',914,812,600,978901234567,600,'active',CURRENT_DATE,'admin'),
(16,'user','Sneha','Iyer','female',DATE '1992-01-09','sneha.iyer@example.com',2,2,'0511512365','9876543225','Flat 7','Sunshine Apt','','Beach Rd',915,813,600,989012345678,600,'active',CURRENT_DATE,'admin'),
(17,'broker','Rohit','Saxena','male',DATE '1983-12-05','rohit.saxena@example.com',1,2,'0511512366','9876543226','Plot 23','Red Hills','','Ring Rd',916,814,600,990123456789,600,'inactive',CURRENT_DATE,'admin'),
(18,'user','Tanvi','Das','female',DATE '1991-11-11','tanvi.das@example.com',2,1,'0511512367','9876543227','12A','Silver Town','','Sector 63',917,815,600,901234567891,600,'active',CURRENT_DATE,'admin'),
(19,'sales','Amit','Roy','male',DATE '1989-04-04','amit.roy@example.com',1,2,'0511512368','9876543228','54','New Colony','','Circle Rd',918,816,600,912345678912,600,'active',CURRENT_DATE,'admin'),
(20,'user','Priya','Nair','female',DATE '1990-10-10','priya.nair@example.com',2,3,'0511512369','9876543229','88','Hill Side','','Link Rd',919,817,600,923456789023,600,'active',CURRENT_DATE,'admin');

SELECT * from users_personal_info;


-- 2. create login_users table

CREATE TABLE login_users (
    login_id INT,
    password VARCHAR(255),
    user_id INT NOT NULL,
    lead_id INT,
    user_type VARCHAR(20) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_login_id PRIMARY KEY(login_id),
    CONSTRAINT chk_login_status CHECK (status IN ('active','inactive')),
    CONSTRAINT fk_login_user FOREIGN KEY (user_id) REFERENCES users_personal_info(user_id),
    CONSTRAINT fk_lead_user FOREIGN KEY (lead_id) REFERENCES users_personal_info(user_id)
);

DESC login_users;

-- insert values login_users table

INSERT INTO login_users (login_id, password, user_id, lead_id, user_type, status, added_on, added_by) VALUES
(1001, 'pass1', 1, NULL, 'broker', 'active', CURRENT_DATE, 'admin'),
(1002, 'pass2', 2, 1, 'sales', 'active', DATE '2025-01-01', 'admin'),
(1003, 'pass3', 3, NULL, 'user', 'inactive', DATE '2025-01-10', 'admin'),
(1004, 'pass4', 4, NULL, 'broker', 'active', CURRENT_DATE, 'admin'),
(1005, 'pass5', 5, 4, 'sales', 'active', DATE '2024-12-15', 'admin'),
(1006, 'pass6', 6, NULL, 'user', 'active', CURRENT_DATE, 'admin'),
(1007, 'pass7', 7, NULL, 'broker', 'inactive', DATE '2025-02-20', 'admin'),
(1008, 'pass8', 8, 7, 'sales', 'active', CURRENT_DATE, 'admin'),
(1009, 'pass9', 9, NULL, 'user', 'active', DATE '2024-11-20', 'admin'),
(1010, 'pass10',10, NULL, 'broker', 'active', CURRENT_DATE, 'admin'),
(1011, 'pass11', 11, 10, 'sales', 'active', DATE '2025-01-18', 'admin'),
(1012, 'pass12',12, NULL, 'user', 'active', CURRENT_DATE, 'admin'),
(1013, 'pass13',13, NULL, 'broker', 'inactive', DATE '2024-10-10', 'admin'),
(1014, 'pass14', 14, 13, 'sales', 'active', CURRENT_DATE, 'admin'),
(1015, 'pass15', 15, NULL, 'user', 'active', DATE '2025-02-10', 'admin'),
(1016, 'pass16', 16, NULL, 'broker', 'active', CURRENT_DATE, 'admin'),
(1017, 'pass17', 17, 16, 'sales', 'inactive', DATE '2024-09-09', 'admin'),
(1018, 'pass18', 18, NULL, 'user', 'active', CURRENT_DATE, 'admin'),
(1019, 'pass19', 19, NULL, 'broker', 'active', DATE '2025-01-25', 'admin'),
(1020, 'pass20', 20, 19, 'sales', 'active', CURRENT_DATE, 'admin');

SELECT * from login_users;


-- 3 create brokers table 

CREATE TABLE brokers (
    broker_id INT,
    broker_name VARCHAR(100),
    broker_org_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    user_id INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_broker_id PRIMARY KEY(broker_id),
    CONSTRAINT chk_broker_status CHECK (status IN ('active','inactive')),
    CONSTRAINT fk_broker_user FOREIGN KEY (user_id) REFERENCES users_personal_info(user_id)
);

DESC brokers;


-- insert values to brokers table

INSERT INTO brokers (broker_id, broker_name, broker_org_name, email, phone, address, user_id, status, added_on, added_by) VALUES
(2001,'Ravi Kumar','Prime Insurance','ravi.kumar@email.com','0511511111','Address 1',1,'active',CURRENT_DATE,'admin'),
(2002,'Meena S','SecureLife','meena.s@email.com','0511511114','Address 2',4,'active',DATE '2025-01-01','admin'),
(2003,'Sundar M','RoadShield','sundar.m@email.com','0511511117','Address 3',7,'inactive',DATE '2025-01-15','admin'),
(2004,'Divya K','AutoCover','divya.k@email.com','0511511120','Address 4',10,'active',CURRENT_DATE,'admin'),
(2005,'Ramesh A','SureSafe','ramesh.a@email.com','0511511123','Address 5',13,'inactive',DATE '2024-11-10','admin'),
(2006,'Sneha B','DriveGuard','sneha.b@email.com','0511511126','Address 6',16,'active',CURRENT_DATE,'admin'),
(2007,'Tarun P','MotorMate','tarun.p@email.com','0511511129','Address 7',19,'inactive',DATE '2024-10-01','admin'),
(2008,'Broker8','FastCover','broker8@email.com','0511511131','Address 8',1,'active',CURRENT_DATE,'admin'),
(2009,'Broker9','QuickDrive','broker9@email.com','0511511132','Address 9',4,'active',DATE '2025-01-10','admin'),
(2010,'Broker10','SecurePlus','broker10@email.com','0511511133','Address 10',7,'inactive',DATE '2025-02-01','admin'),
(2011,'Broker11','InsureWise','broker11@email.com','0511511134','Address 11',10,'active',CURRENT_DATE,'admin'),
(2012,'Broker12','ZenPolicy','broker12@email.com','0511511135','Address 12',13,'inactive',DATE '2025-02-22','admin'),
(2013,'Broker13','AutoGen','broker13@email.com','0511511136','Address 13',16,'active',CURRENT_DATE,'admin'),
(2014,'Broker14','RiskCare','broker14@email.com','0511511137','Address 14',19,'inactive',DATE '2024-08-20','admin'),
(2015,'Broker15','TotalCover','broker15@email.com','0511511138','Address 15',1,'active',CURRENT_DATE,'admin'),
(2016,'Broker16','FleetSafe','broker16@email.com','0511511139','Address 16',4,'inactive',DATE '2025-03-03','admin'),
(2017,'Broker17','SafeZone','broker17@email.com','0511511140','Address 17',7,'active',CURRENT_DATE,'admin'),
(2018,'Broker18','PolicyLink','broker18@email.com','0511511141','Address 18',10,'inactive',DATE '2024-12-05','admin'),
(2019,'Broker19','InsureMax','broker19@email.com','0511511142','Address 19',13,'active',CURRENT_DATE,'admin'),
(2020,'Broker20','AutoGuard','broker20@email.com','0511511143','Address 20',16,'inactive',DATE '2025-01-28','admin');

SELECT * FROM brokers;


-- 4. create qoute_info table

CREATE TABLE quote_info (
    quote_id INT,
    application_id VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL,
    broker_id INT,
    product_id INT NOT NULL,
    coverage_type VARCHAR(20) NOT NULL,
    vehicle_make_id INT NOT NULL,
    vehicle_model_id INT NOT NULL,
    vehicle_body_id INT,
    vehicle_category_id INT,
    manufacture_year YEAR,
    registration_number VARCHAR(50),
    usage_type VARCHAR(50),
    chassis_number VARCHAR(100),
    engine_number VARCHAR(100),
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
	CONSTRAINT pk_quote_id PRIMARY KEY(quote_id),
    CONSTRAINT fk_quote_customer FOREIGN KEY (customer_id) REFERENCES users_personal_info(user_id),
    CONSTRAINT fk_quote_broker FOREIGN KEY (broker_id) REFERENCES brokers(broker_id),
    CONSTRAINT fk_quote_product FOREIGN KEY (product_id) REFERENCES product_config(product_id),
    CONSTRAINT fk_quote_make FOREIGN KEY (vehicle_make_id) REFERENCES vehicle_make(make_id),
    CONSTRAINT fk_quote_model FOREIGN KEY (vehicle_model_id) REFERENCES vehicle_model(model_id),
    CONSTRAINT fk_quote_body FOREIGN KEY (vehicle_body_id) REFERENCES vehicle_body(body_id),
    CONSTRAINT fk_quote_category FOREIGN KEY (vehicle_category_id) REFERENCES vehicle_category(category_id),
    CONSTRAINT chk_quote_status CHECK (status IN ('active','inactive'))
);

DESC quote_info;

-- insert values to qoute_table
INSERT INTO quote_info (
    quote_id, application_id, customer_id, broker_id, product_id, coverage_type,
    vehicle_make_id, vehicle_model_id, vehicle_body_id, vehicle_category_id,
    manufacture_year, registration_number, usage_type,
    chassis_number, engine_number, status, added_on, added_by
) VALUES
(3001,'APPQ0001',5,2005,1000,'comprehensive',123,216,417,504,2020,'TN01AB0111','private','CHS0001','ENG0001','active',DATE '2025-06-09','admin'),
(3002,'APPQ0002',14,NULL,1001,'both',124,213,412,508,2017,'TN02AB0222','commercial','CHS0002','ENG0002','active',DATE '2024-05-16','admin'),
(3003,'APPQ0003',9,2003,1002,'tpl',107,216,411,504,2018,'TN03AB0333','commercial','CHS0003','ENG0003','inactive',DATE '2024-09-16','admin'),
(3004,'APPQ0004',15,NULL,1003,'tpl',114,214,406,516,2018,'TN04AB0444','private','CHS0004','ENG0004','inactive',DATE '2024-03-29','admin'),
(3005,'APPQ0005',8,2005,1004,'comprehensive',105,202,417,516,2018,'TN05AB0555','private','CHS0005','ENG0005','inactive',DATE '2024-10-28','admin'),
(3006,'APPQ0006',16,2004,1005,'tpl',113,204,418,510,2018,'TN06AB0666','private','CHS0006','ENG0006','inactive',DATE '2024-03-18','admin'),
(3007,'APPQ0007',11,2007,1006,'tpl',111,213,416,511,2019,'TN07AB0777','commercial','CHS0007','ENG0007','active',DATE '2025-04-11','admin'),
(3008,'APPQ0008',8,2004,1007,'tpl',110,223,400,509,2016,'TN08AB0888','private','CHS0008','ENG0008','inactive',DATE '2024-12-27','admin'),
(3009,'APPQ0009',17,2002,1008,'both',100,223,404,506,2023,'TN09AB0999','commercial','CHS0009','ENG0009','active',DATE '2025-03-19','admin'),
(3010,'APPQ0010',1,NULL,1009,'tpl',118,208,401,511,2023,'TN10AB1100','private','CHS0010','ENG0010','inactive',DATE '2024-05-01','admin'),
(3011,'APPQ0011',9,NULL,1010,'tpl',113,208,404,513,2017,'TN11AB1211','private','CHS0011','ENG0011','inactive',DATE '2024-03-10','admin'),
(3012,'APPQ0012',6,2005,1011,'comprehensive',108,209,401,514,2017,'TN12AB1322','private','CHS0012','ENG0012','inactive',DATE '2024-02-11','admin'),
(3013,'APPQ0013',20,2007,1012,'tpl',120,216,412,514,2018,'TN13AB1433','commercial','CHS0013','ENG0013','inactive',DATE '2024-10-20','admin'),
(3014,'APPQ0014',4,2004,1013,'comprehensive',116,223,417,500,2020,'TN14AB1544','private','CHS0014','ENG0014','active',DATE '2025-01-25','admin'),
(3015,'APPQ0015',12,2006,1014,'comprehensive',122,201,417,517,2015,'TN15AB1655','private','CHS0015','ENG0015','inactive',DATE '2024-09-26','admin'),
(3016,'APPQ0016',11,2006,1015,'tpl',108,201,414,506,2016,'TN16AB1766','commercial','CHS0016','ENG0016','inactive',DATE '2025-01-26','admin'),
(3017,'APPQ0017',10,2001,1016,'tpl',100,206,418,503,2021,'TN17AB1877','private','CHS0017','ENG0017','inactive',DATE '2024-03-30','admin'),
(3018,'APPQ0018',17,2004,1017,'tpl',106,209,412,515,2022,'TN18AB1988','commercial','CHS0018','ENG0018','inactive',DATE '2025-01-29','admin'),
(3019,'APPQ0019',14,NULL,1018,'comprehensive',101,204,412,501,2020,'TN19AB2099','private','CHS0019','ENG0019','inactive',DATE '2024-05-25','admin'),
(3020,'APPQ0020',20,2006,1019,'tpl',121,210,409,505,2022,'TN20AB2200','commercial','CHS0020','ENG0020','active',DATE '2025-04-04','admin');

SELECT * from quote_info;

-- 5.create broker_commission_config table

CREATE TABLE broker_commission_config (
    config_id INT,
    broker_id INT NOT NULL,
    product_id INT NOT NULL,
    coverage_type VARCHAR(20) NOT NULL,
    commission_percent DECIMAL(5,2) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(100),
    CONSTRAINT pk_config_id PRIMARY KEY(config_id),
    CONSTRAINT fk_bcc_broker FOREIGN KEY (broker_id) REFERENCES brokers(broker_id),
    CONSTRAINT fk_bcc_product FOREIGN KEY (product_id) REFERENCES product_config(product_id),
    CONSTRAINT chk_bcc_status CHECK (status IN ('active','inactive')),
    CONSTRAINT chk_bcc_coverage CHECK (coverage_type IN ('comprehensive','tpl','both'))
);

DESC broker_commission_config;

-- insert values to broker_commission_config table

INSERT INTO broker_commission_config (config_id, broker_id, product_id, coverage_type, commission_percent, status, added_on, added_by) VALUES
(4001,2001,1000,'comprehensive',6.75,'active',DATE '2023-09-15','admin'),
(4002,2002,1001,'tpl',4.20,'inactive',DATE '2024-01-22','admin'),
(4003,2003,1002,'both',5.50,'active',DATE '2024-02-17','admin'),
(4004,2004,1003,'tpl',7.10,'active',DATE '2024-05-01','admin'),
(4005,2005,1004,'comprehensive',9.25,'inactive',DATE '2024-07-12','admin'),
(4006,2006,1005,'tpl',6.10,'active',DATE '2024-11-05','admin'),
(4007,2007,1006,'both',4.95,'inactive',DATE '2023-12-18','admin'),
(4008,2008,1007,'comprehensive',7.80,'active',DATE '2024-10-03','admin'),
(4009,2009,1008,'tpl',5.00,'active',DATE '2025-01-01','admin'),
(4010,2010,1009,'both',6.35,'inactive',DATE '2024-08-08','admin'),
(4011,2011,1010,'comprehensive',8.15,'active',DATE '2024-04-30','admin'),
(4012,2012,1011,'tpl',3.95,'inactive',DATE '2024-09-20','admin'),
(4013,2013,1012,'both',6.50,'active',DATE '2024-12-01','admin'),
(4014,2014,1013,'tpl',5.85,'active',DATE '2024-06-14','admin'),
(4015,2015,1014,'comprehensive',7.00,'inactive',DATE '2023-11-26','admin'),
(4016,2016,1015,'tpl',4.45,'active',DATE '2024-03-13','admin'),
(4017,2017,1016,'both',6.90,'active',DATE '2024-02-09','admin'),
(4018,2018,1017,'comprehensive',8.40,'inactive',DATE '2024-10-21','admin'),
(4019,2019,1018,'tpl',5.25,'active',DATE '2024-05-19','admin'),
(4020,2020,1019,'both',9.00,'inactive',DATE '2024-01-05','admin');

SELECT * FROM broker_commission_config;

-- 6. create premium_rate_config table 
CREATE TABLE premium_rate_config (
    rate_id INT,
    category_id INT NOT NULL,
    body_id INT NOT NULL,
    region_id INT NOT NULL,
    age_from INT NOT NULL,
    age_to INT NOT NULL,
    base_rate DECIMAL(10,2) NOT NULL,
    loading_rate DECIMAL(5,2) DEFAULT 0.00,
    discount_rate DECIMAL(5,2) DEFAULT 0.00,
    effective_from DATE NOT NULL,
    effective_to DATE,
    CONSTRAINT pk_rate_id PRIMARY KEY(rate_id),
    CONSTRAINT fk_prc_category FOREIGN KEY (category_id) REFERENCES vehicle_category(category_id),
    CONSTRAINT fk_prc_body FOREIGN KEY (body_id) REFERENCES vehicle_body(body_id),
    CONSTRAINT fk_prc_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

DESC premium_rate_config;

-- insert values from the premium_rate_config table
INSERT INTO premium_rate_config 
(rate_id, category_id, body_id, region_id, age_from, age_to, base_rate, loading_rate, discount_rate, effective_from, effective_to)
VALUES
(5000, 500, 400, 700, 18, 25, 4500.00, 2.00, 0.00, '2024-01-01', '2024-12-31'),
(5001, 500, 401, 701, 26, 35, 4300.00, 1.50, 0.50, '2024-01-01', '2024-12-31'),
(5002, 500, 403, 702, 36, 45, 4200.00, 1.20, 1.00, '2024-01-01', '2024-12-31'),
(5003, 501, 404, 703, 18, 25, 4800.00, 2.00, 0.00, '2024-01-01', '2024-12-31'),
(5004, 501, 406, 704, 26, 35, 4700.00, 1.60, 0.75, '2024-01-01', '2024-12-31'),
(5005, 503, 400, 705, 36, 45, 4600.00, 1.30, 1.20, '2024-01-01', '2024-12-31'),
(5006, 503, 401, 706, 46, 60, 4500.00, 1.00, 1.50, '2024-01-01', '2024-12-31'),
(5007, 504, 403, 707, 18, 25, 4200.00, 1.80, 0.00, '2024-01-01', '2024-12-31'),
(5008, 504, 404, 708, 26, 35, 4100.00, 1.40, 0.75, '2024-01-01', '2024-12-31'),
(5009, 506, 406, 709, 36, 45, 4600.00, 1.10, 1.25, '2024-01-01', '2024-12-31'),
(5010, 506, 417, 700, 46, 60, 4700.00, 1.00, 1.75, '2024-01-01', '2024-12-31'),
(5011, 508, 412, 701, 18, 25, 4800.00, 2.20, 0.00, '2024-01-01', '2024-12-31'),
(5012, 508, 414, 702, 26, 35, 4900.00, 1.60, 0.50, '2024-01-01', '2024-12-31'),
(5013, 509, 417, 703, 36, 45, 5000.00, 1.30, 1.00, '2024-01-01', '2024-12-31'),
(5014, 511, 418, 704, 46, 60, 5100.00, 1.00, 1.50, '2024-01-01', '2024-12-31'),
(5015, 514, 403, 705, 60, 100, 5200.00, 0.80, 2.00, '2024-01-01', '2024-12-31'),
(5016, 514, 404, 706, 18, 25, 5300.00, 1.90, 0.00, '2024-01-01', '2024-12-31'),
(5017, 516, 406, 707, 26, 35, 5400.00, 1.50, 0.40, '2024-01-01', '2024-12-31'),
(5018, 517, 417, 708, 36, 45, 5500.00, 1.20, 1.00, '2024-01-01', '2024-12-31'),
(5019, 519, 419, 709, 46, 60, 5600.00, 1.00, 1.80, '2024-01-01', '2024-12-31');


SELECT * from premium_rate_config;


-- 7. create premium_calculation table
CREATE TABLE premium_calculation (
    premium_id INT,
    quote_id INT NOT NULL,
    rate_id INT NOT NULL,
    product_id INT NOT NULL,
    base_premium DECIMAL(10,2) NOT NULL,
    loading_amount DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_premium DECIMAL(10,2),
    calculated_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    calculated_by VARCHAR(100),
    CONSTRAINT pk_premium_id PRIMARY KEY(premium_id),
    CONSTRAINT fk_premium_quote FOREIGN KEY (quote_id) REFERENCES quote_info(quote_id),
    CONSTRAINT fk_premium_rate FOREIGN KEY (rate_id) REFERENCES premium_rate_config(rate_id),
    CONSTRAINT fk_premium_product FOREIGN KEY (product_id) REFERENCES product_config(product_id)
);

DESC premium_calculation;


-- insert values into premium_calculation table

INSERT INTO premium_calculation (
    premium_id, quote_id, rate_id, product_id,
    base_premium, loading_amount, discount_amount,
    tax_amount, total_premium, calculated_on, calculated_by
)
VALUES
(6001, 3001, 5000, 1000, 3500.00, 70.00, 0.00, 643.80, 4213.80, CURRENT_DATE, 'system'),
(6002, 3002, 5001, 1001, 1200.00, 18.00, 6.00, 216.00, 1428.00, CURRENT_DATE, 'system'),
(6003, 3003, 5002, 1002, 4600.00, 55.20, 46.00, 821.45, 5430.65, CURRENT_DATE, 'system'),
(6004, 3004, 5003, 1003, 2000.00, 40.00, 0.00, 367.20, 2407.20, CURRENT_DATE, 'system'),
(6005, 3005, 5004, 1004, 7500.00, 120.00, 56.25, 1335.38, 8899.13, CURRENT_DATE, 'system'),
(6006, 3006, 5005, 1005, 5500.00, 71.50, 82.50, 973.17, 6462.17, CURRENT_DATE, 'system'),
(6007, 3007, 5006, 1006, 800.00, 8.00, 12.00, 142.56, 938.56, CURRENT_DATE, 'system'),
(6008, 3008, 5007, 1007, 2500.00, 45.00, 0.00, 459.00, 3004.00, CURRENT_DATE, 'system'),
(6009, 3009, 5008, 1008, 3000.00, 42.00, 30.00, 541.56, 3553.56, CURRENT_DATE, 'system'),
(6010, 3010, 5009, 1009, 6200.00, 56.80, 62.00, 1114.42, 7309.22, CURRENT_DATE, 'system'),
(6011, 3011, 5010, 1010, 7800.00, 78.00, 117.00, 1377.78, 9138.78, CURRENT_DATE, 'system'),
(6012, 3012, 5011, 1011, 2800.00, 61.60, 0.00, 514.49, 3376.09, CURRENT_DATE, 'system'),
(6013, 3013, 5012, 1012, 9200.00, 147.20, 92.00, 1656.81, 10911.99, CURRENT_DATE, 'system'),
(6014, 3014, 5013, 1013, 8800.00, 114.40, 132.00, 1579.39, 10361.79, CURRENT_DATE, 'system'),
(6015, 3015, 5014, 1014, 3100.00, 93.00, 46.50, 584.61, 3731.11, CURRENT_DATE, 'system'),
(6016, 3016, 5015, 1015, 950.00, 23.75, 0.00, 175.65, 1149.40, CURRENT_DATE, 'system'),
(6017, 3017, 5016, 1016, 5000.00, 95.00, 50.00, 900.90, 5945.90, CURRENT_DATE, 'system'),
(6018, 3018, 5017, 1017, 4000.00, 60.00, 80.00, 709.20, 4689.20, CURRENT_DATE, 'system'),
(6019, 3019, 5018, 1018, 6200.00, 74.40, 124.00, 1097.83, 7248.23, CURRENT_DATE, 'system'),
(6020, 3020, 5019, 1019, 2000.00, 36.00, 40.00, 359.52, 2355.52, CURRENT_DATE, 'system');


SELECT * FROM premium_calculation;
 
















