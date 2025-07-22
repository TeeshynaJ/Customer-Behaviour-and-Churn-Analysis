SELECT * FROM `customer behaviour and churn analytics`.`customer-churn-records`;

#Rename satisfaction score and card type 
ALTER TABLE `customer behaviour and churn analytics`.`customer-churn-records`
RENAME COLUMN `Satisfaction Score` TO `Satisfaction_score`;  

ALTER TABLE `customer behaviour and churn analytics`.`customer-churn-records`
RENAME COLUMN `Card Type` TO `card_Type`; 

#checking no loss of data.
SELECT COUNT(*) AS total_rows
FROM `customer behaviour and churn analytics`.`customer-churn-records`;

ALTER TABLE  `customer behaviour and churn analytics`.`customer-churn-records`
RENAME COLUMN `Point Earned` TO `Point_Earned`; 

# drop 
ALTER TABLE `customer behaviour and churn analytics`.`customer-churn-records`
DROP COLUMN Surname ; 

ALTER TABLE `customer behaviour and churn analytics`.`customer-churn-records`
DROP COLUMN RowNumber ; 

#check duplicates
SELECT CustomerId, COUNT(*)
FROM `customer behaviour and churn analytics`.`customer-churn-records`
GROUP BY CustomerId
HAVING COUNT(*) > 1;

SELECT * 
FROM `customer behaviour and churn analytics`.`customer-churn-records`
WHERE Geography IS NULL
   OR Age IS NULL
   OR Tenure IS NULL
   OR Balance IS NULL
   OR NumOfProducts IS NULL
   OR EstimatedSalary IS NULL
   OR Exited IS NULL
   OR Complain IS NULL
   OR Satisfaction_score IS NULL 
   OR Card_type IS NULL
   OR Point_Earned IS NULL;

#standardise catergorical data  -- give a full view of what is in the column
SELECT DISTINCT GENDER FROM  `customer behaviour and churn analytics`.`customer-churn-records`;
SELECT DISTINCT Card_type FROM  `customer behaviour and churn analytics`.`customer-churn-records`;
SELECT DISTINCT Geography FROM  `customer behaviour and churn analytics`.`customer-churn-records`;

# 2nd checking any lowercase values in card_type
SELECT * 
FROM `customer behaviour and churn analytics`.`customer-churn-records`
WHERE Card_type IN ( 'gold', 'silver','platinum');

DESCRIBE `customer behaviour and churn analytics`.`customer-churn-records`;

ALTER TABLE `customer behaviour and churn analytics`.`customer-churn-records`
MODIFY COLUMN `Balance` DECIMAL(15,2),
MODIFY COLUMN `EstimatedSalary` DECIMAL(15,2);

# checking for outliers 
SELECT *
FROM  `customer behaviour and churn analytics`.`customer-churn-records`
WHERE CreditScore > 1000 or Age < 18 OR Age > 100 ;