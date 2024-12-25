
select * from bookings;
#1. Retrieve all successful bookings:
create VIEW Successful_Bookings AS # temporary table
select * from bookings
where `Booking_Status`='Successful';

#1. Retrieve all successful bookings:
SELECT * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
create VIEW ride_distance_for_each_vehicle AS
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance from bookings
GROUP BY Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
select * from  ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_ride_by_customers AS
select count(*) from bookings
where Booking_Status = 'Cancelled by Driver';

#3. Get the total number of cancelled rides by customers:
select * from cancelled_ride_by_customers;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers AS
select Customer_ID, COUNT(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides DESC LIMIT 5;

#4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_by_drivers_P_C_issues AS
select count(*) from bookings
where Cancelled_Rides_by_Driver = 'Personal & Car related issues';

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from canceled_by_drivers_P_C_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view Max_Min_Driver_Rating AS
select MAX(CAST(Driver_Ratings AS DECIMAL(3, 1))) AS Max_Rating,
MIN(CAST(Driver_Ratings AS DECIMAL(3, 1))) AS Min_Rating
from bookings where Vehicle_Type = 'Prime Sedan' AND Driver_Ratings != 'NA';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
#8. Find the average customer rating per vehicle type:

create view AVG_Cust_Rating AS
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings group by Vehicle_Type;

select * from AVG_Cust_Rating;
#9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value AS
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status = 'Successful'

select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason
create view Incomplete_Rides_Reason as
select Booking_ID,bookings.Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

select * from Incomplete_Rides_Reason;