
USE project_1;

-- 1. Operators
--  Find all users whose phone number starts with '0511' and are active.
SELECT first_name, phone 
FROM users_personal_info 
WHERE phone LIKE '0511%' AND status = 'active';

-- Get users born after 1990 and who are either brokers or sales.
SELECT first_name, user_type, dob 
FROM users_personal_info 
WHERE YEAR(dob) > 1990 AND user_type IN ('broker', 'sales');

SELECT * FROM users_personal_info;

-- Find quotes where the manufacture year is between 2018 and 2020 and the status is not 'inactive'.
SELECT quote_id, manufacture_year 
FROM quote_info 
WHERE manufacture_year BETWEEN 2018 AND 2020 AND status != 'inactive';

-- List all vehicles where make is 'Toyota' or model is 'Civic'.
SELECT vm.model_desc, vm.status 
FROM vehicle_model vm 
JOIN vehicle_make mk ON vm.make_id = mk.make_id 
WHERE mk.make_desc = 'Toyota' OR vm.model_desc = 'Civic'; 
SELECT * FROM vehicle_model;
SELECT * FROM vehicle_make;


-- 2. DDL
-- Rename the column 'addr1' to 'address_line1' in 'users_personal_info'.
ALTER TABLE users_personal_info CHANGE addr1 address_line1 VARCHAR(100);

--  Drop the column 'remarks' from 'quote_info'.
ALTER TABLE quote_info DROP COLUMN remarks;



-- 3.DRL

-- Display all cities belonging to a specific state, say TamilNadu
SELECT c.*
FROM cities c
JOIN states s ON c.state_id = s.state_id
WHERE s.state_name = 'TamilNadu';

-- Retrieve the list of inactive users from the users_personal_info table
SELECT *
FROM users_personal_info
WHERE status = 'inactive';


-- Show all the models associated with Toyota
SELECT vm.*
FROM vehicle_model vm
JOIN vehicle_make vmk ON vm.make_id = vmk.make_id
WHERE vmk.make_desc = 'Toyota';

-- View all entries in the quote_info table for customers with IDs less than 10
SELECT *
FROM quote_info
WHERE customer_id < 10;


-- 4.Aggregate Functions with GROUP BY

-- Count the number of users in each user type.
SELECT user_type, COUNT(*) AS total_users 
FROM users_personal_info 
GROUP BY user_type;

-- Get average base premium for each coverage type from product_config.
SELECT coverage_type, AVG(base_premium) AS avg_premium 
FROM product_config 
GROUP BY coverage_type;

-- Show total number of quotes grouped by status.
SELECT status, COUNT(*) AS total_quotes 
FROM quote_info 
GROUP BY status;

-- Get the total and average commission by broker.
SELECT broker_id, SUM(commission_percent) AS total_commission, AVG(commission_percent) AS avg_commission 
FROM broker_commission_config 
GROUP BY broker_id;


-- 5.ORDER BY

-- List all users ordered by date of birth descending.
SELECT user_id, first_name, dob 
FROM users_personal_info 
ORDER BY dob DESC;

-- Show products ordered by base premium in ascending order.
SELECT product_name, base_premium 
FROM product_config 
ORDER BY base_premium ASC;

-- Get brokers sorted by added_on date descending.
SELECT broker_id, broker_name, added_on 
FROM brokers 
ORDER BY added_on DESC;

-- List premium calculations sorted by total premium (highest first).
SELECT premium_id, total_premium 
FROM premium_calculation 
ORDER BY total_premium DESC;


-- 6.Joins

-- Get full name and email of brokers along with their organization name.
SELECT u.first_name, u.last_name, b.email, b.broker_org_name 
FROM brokers b 
JOIN users_personal_info u ON b.user_id = u.user_id;

--  List quote details with product name and customer full name.
SELECT q.quote_id, p.product_name, u.first_name, u.last_name 
FROM quote_info q 
JOIN product_config p ON q.product_id = p.product_id 
JOIN users_personal_info u ON q.customer_id = u.user_id;

-- Get premium details with quote application ID and product name.
SELECT pc.premium_id, q.application_id, p.product_name, pc.total_premium 
FROM premium_calculation pc 
JOIN quote_info q ON pc.quote_id = q.quote_id 
JOIN product_config p ON pc.product_id = p.product_id;

-- Show commission info with broker name and product name.
SELECT b.broker_name, p.product_name, c.commission_percent 
FROM broker_commission_config c 
JOIN brokers b ON c.broker_id = b.broker_id 
JOIN product_config p ON c.product_id = p.product_id;



-- 7.Subqueries

-- Find users who are not linked to any quotes.
SELECT user_id, first_name 
FROM users_personal_info 
WHERE user_id NOT IN (SELECT customer_id FROM quote_info);

-- Get the broker with the highest commission percentage.
SELECT broker_id, commission_percent 
FROM broker_commission_config 
WHERE commission_percent = (SELECT MAX(commission_percent) FROM broker_commission_config);

--  List products with above average base premium.
SELECT product_id, product_name, base_premium 
FROM product_config 
WHERE base_premium > (SELECT AVG(base_premium) FROM product_config);

-- Find users who live in a city with name containing 'pur'.
SELECT user_id, first_name 
FROM users_personal_info 
WHERE city_id IN (
    SELECT city_id FROM cities WHERE city_name LIKE '%pur%'
);



-- 8. Stored Procedures

--  Create a procedure to get premium details by quote ID.
DELIMITER $$

CREATE PROCEDURE GetPremiumDetails(IN in_quote_id INT)
BEGIN
    SELECT * FROM premium_calculation WHERE quote_id = in_quote_id;
END $$

DELIMITER ;

CALL GetPremiumDetails(3001);



-- Create a procedure to update user status.
DELIMITER $$

CREATE PROCEDURE UpdateUserStatus(IN in_user_id INT, IN new_status VARCHAR(10))
BEGIN
    UPDATE users_personal_info 
    SET status = new_status 
    WHERE user_id = in_user_id;
END $$

DELIMITER ;

CALL UpdateUserStatus(3, 'active');



--  Create a procedure to count quotes by broker ID.
DELIMITER $$

CREATE PROCEDURE CountBrokerQuotes(IN in_broker_id INT)
BEGIN
    DECLARE total INT DEFAULT 0;

    SELECT COUNT(quote_id) INTO total
    FROM quote_info
    WHERE broker_id = in_broker_id;

    SELECT in_broker_id, total FROM quote_info GROUP BY in_broker_id ;
END $$

DELIMITER ;

CALL CountBrokerQuotes(2005);
SELECT * from quote_info;


--  Create a procedure to get product details by coverage type
DELIMITER $$

CREATE PROCEDURE GetProductsByCoverage(IN in_coverage VARCHAR(20))
BEGIN
    DECLARE count_products INT;

    SELECT COUNT(*) INTO count_products 
    FROM product_config 
    WHERE coverage_type = in_coverage;

   SELECT in_coverage AS coverage_type, count_products AS total_products
    FROM product_config 
    WHERE coverage_type = in_coverage GROUP BY coverage_type;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS GetProductsByCoverage;
CALL GetProductsByCoverage('tpl');




-- Functions

-- 1.display all users and their current age?

DELIMITER $$

CREATE FUNCTION GetUserAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END $$

DELIMITER ;

drop function IF EXISTS GetUserAge;

-- show
SELECT user_id, first_name, dob, GetUserAge(dob) AS age
FROM users_personal_info;

-- 2.You want to compute tax for each premium calculated?

DELIMITER $$

CREATE FUNCTION CalculateTax(premium DECIMAL(10,2), tax_rate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN premium * (tax_rate / 100);
END $$

DELIMITER ;

-- show
SELECT premium_id, total_premium, 
       CalculateTax(total_premium, 18.0) AS tax_amount
FROM premium_calculation;


-- 3. Display full name of customers with their quote IDs

DELIMITER $$

CREATE FUNCTION GetFullName(uid INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE fullname VARCHAR(200);
    SELECT CONCAT(first_name, ' ', last_name) INTO fullname 
    FROM users_personal_info 
    WHERE user_id = uid;
    RETURN fullname;
END $$

DELIMITER ;

-- Show
SELECT quote_id, GetFullName(customer_id) AS customer_name
FROM quote_info;


-- Triggers

-- 1. When a new quote is created, automatically log it into a separate audit table.

CREATE TABLE quote_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    quote_id INT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_after_quote_insert
AFTER INSERT ON quote_info
FOR EACH ROW
BEGIN
    INSERT INTO quote_log (quote_id, created_by)
    VALUES (NEW.quote_id, NEW.customer_id);
END $$

DELIMITER ;


-- show
INSERT INTO quote_info (quote_id, customer_id, broker_id, product_id, manufacture_year, status, application_id)
VALUES (5001, 1001, 2001, 3001, 2022, 'active', 'APP5001');

SELECT * FROM quote_log;


-- 2.Prevent users from inserting negative premium amounts?

DELIMITER $$

CREATE TRIGGER trg_before_premium_insert
BEFORE INSERT ON premium_calculation
FOR EACH ROW
BEGIN
    IF NEW.total_premium < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Total premium cannot be negative.';
    END IF;
END $$

DELIMITER ;

-- show
INSERT INTO premium_calculation (premium_id, quote_id, product_id, total_premium)
VALUES (9001, 5001, 3001, -1000);

use project_1;





