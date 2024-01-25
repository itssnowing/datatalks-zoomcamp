-- queries used to solve homework
select * from public.green_taxi_data
where lpep_pickup_datetime > '2019-09-18'
and lpep_dropoff_datetime < '2019-09-19'

--
select
count(index)
from public.green_taxi_data
where lpep_pickup_datetime > '2019-09-18'
and lpep_dropoff_datetime < '2019-09-19'

--
select
max(trip_distance)
from green_taxi_data

--
select
lpep_pickup_datetime, lpep_dropoff_datetime
from green_taxi_data
where trip_distance = (select max(trip_distance) 
				  from green_taxi_data)

--
select * from green_taxi_data
join taxi_zones
on "green_taxi_data"."PULocationID" = "taxi_zones"."LocationID"
where "green_taxi_data"."lpep_pickup_datetime" > '2019-09-18'
and "green_taxi_data"."lpep_pickup_datetime" < '2019-09-19'
and "green_taxi_data"."total_amount" > 5000

--
select "taxi_zones"."Borough", sum ("green_taxi_data"."total_amount") as total
from green_taxi_data
left join taxi_zones
on "green_taxi_data"."PULocationID" = "taxi_zones"."LocationID"
where "green_taxi_data"."lpep_pickup_datetime" > '2019-09-18'
and "green_taxi_data"."lpep_pickup_datetime" < '2019-09-19'
group by "taxi_zones"."Borough"
order by total

-- executed together
select * from green_taxi_data
left join taxi_zones
on "green_taxi_data"."PULocationID" = "taxi_zones"."LocationID"
where "taxi_zones"."Zone" = 'Astoria'
order by "green_taxi_data"."tip_amount" desc;

select * from green_taxi_data
left join taxi_zones
on "green_taxi_data"."DOLocationID" = "taxi_zones"."LocationID"
where "green_taxi_data"."index" = 98185