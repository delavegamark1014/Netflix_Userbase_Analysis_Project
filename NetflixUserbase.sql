--pulling up Userbase table
Select *
From public."Userbase"
Order by user_id


--distribution of gender
Select gender,count(*)
From public."Userbase"
Group by gender


--Subscription type distribution by gender
Select Gender, Subscription_Type, Count(*) as sub_count
From public."Userbase"
Group by Gender, Subscription_Type
Order by 1,2


--Counts how many users are registered to each device type
Select device,count(device) as device_usage
From public."Userbase"
Group by device
Order by device_usage desc


--average membership days per device
Select device, avg(last_payment_date-join_date) as avg_member_days
From public."Userbase"
Group by device


--Users with memberships longer than 1 year(365 days)
Select user_id,join_date,last_payment_date,(last_payment_date-join_date) as member_days
From public."Userbase"
Group by user_id,join_date,last_payment_date
Having (last_payment_date-join_date)>365
Order by member_days


--months with most sign-ups
Select Extract(Month from Join_Date) AS Signup_month, count(*) AS Signup_Count
From public."Userbase"
Group by Signup_month
Order by Signup_Count desc


--users with most membership days
--calculates number of days between joining and last payment date
Select user_id,join_date,last_payment_date,(last_payment_date-join_date) as member_days
From public."Userbase"
Order by member_days desc


--Number of months active per member
--Recognized Revenue generated per member
Select
    User_ID, subscription_type, monthly_revenue, join_date, last_payment_date,
--converts 'last payment date' and 'join date' into months(12)	
    DATE_PART('year', Last_Payment_Date) * 12 + DATE_PART('month', Last_Payment_Date)
	- (DATE_PART('year', Join_Date) * 12 + DATE_PART('month', Join_Date)) AS Months_Active,
--previous query w/ revenue
    (DATE_PART('year', Last_Payment_Date) * 12 + DATE_PART('month', Last_Payment_Date)
	- (DATE_PART('year', Join_Date) * 12 + DATE_PART('month', Join_Date))) * monthly_revenue AS Revenue
FROM public."Userbase"


--average age of all users
Select avg(age) as avg_age
From public."Userbase"


--average age of users by country
Select country,avg(age) as avg_age
From public."Userbase"
Group by country
Order by avg_age


--average age of users for each subscription_type
Select subscription_type,avg(age) as avg_age
From public."Userbase"
Group by subscription_type
Order by avg_age


--subscription type distribution by country
Select country,subscription_type,Count(subscription_type) As Occurrences
From public."Userbase"
Group by country,subscription_type
Order by country,occurrences desc


--Shows what subscription type is most purchased in each country
Select country, subscription_type, occurrences AS max_occurrences
From (
    Select country,
           subscription_type,
           Count(subscription_type) AS occurrences,
--assigns a row number to each row within each country group(1-3), ordering the rows by the count of subscription_type in descending order
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY COUNT(subscription_type) DESC) AS rn
    From public."Userbase"
    Group by country, subscription_type
) AS ranked
Where rn = 1

