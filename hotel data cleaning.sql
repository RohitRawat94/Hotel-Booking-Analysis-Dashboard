create database hotel;
use hotel;
select * from hotels;

#1 check for duplicate values
select * from hotels group by Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, 
no_of_week_nights, type_of_meal_plan, required_car_parking_space, room_type_reserved, lead_time, 
arrival_year, arrival_month, arrival_date, market_segment_type, repeated_guest, no_of_previous_cancellations,
 no_of_previous_bookings_not_canceled, avg_price_per_room, no_of_special_requests, booking_status 
having count(*)>1;

#2 check for null values
select * from hotels where Booking_ID is null or no_of_adults is null or no_of_children is null or 
no_of_weekend_nights is null or no_of_week_nights is null or type_of_meal_plan is null or 
required_car_parking_space is null or room_type_reserved is null or lead_time is null or 
arrival_year is null or arrival_month is null or arrival_date is null or market_segment_type is null or 
repeated_guest is null or no_of_previous_cancellations is null or 
no_of_previous_bookings_not_canceled is null or avg_price_per_room is null or 
no_of_special_requests is null or booking_status;

#3 Removing Futile/Unnecessary data
alter table hotels 
drop column no_of_previous_bookings_not_canceled;
select * from hotels;

#4 finding average lead time ( lead time- amount of time between when a booking is made and
# the actual arrival date of the guest)
select avg(lead_time) from hotels;

#5 Finding total no. of booking acoording to year & month
SELECT arrival_year, arrival_month, COUNT(*) AS total_bookings
FROM hotels GROUP BY arrival_year, arrival_month ORDER BY arrival_year, arrival_month;

#6 Finding Average price per room
select avg(avg_price_per_room) from hotels;

#7 Finding Non cancelled booking & Canceled booking
select count(*) from hotels where booking_status = "Not_Canceled";
select count(*) from hotels where booking_status = "Canceled";

