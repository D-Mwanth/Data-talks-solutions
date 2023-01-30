
3.
select count(*)
from green_taxi_trips
where lpep_pickup_datetime::date='2019-01-015'
and lpep_dropoff_datetime::date='2019-01-015'

4.
select lpep_pickup_datetime::date
from green_taxi_trips
where trip_distance = (select max(trip_distance) from green_taxi_trips)



5.
with three as(select count(*) as count3
from green_taxi_trips
where passenger_count=3 
  and lpep_pickup_datetime::date = '2019-01-01'),
			  
two as(select count(*) as count2
from green_taxi_trips
where passenger_count=2 
and lpep_pickup_datetime::date = '2019-01-01')

select concat('2: ',count2, ' ; ','3: ',count3) from three, two


6.
select zpu."Zone" as pick_zone, zdo."Zone" drop_zone, gr."PULocationID", gr."DOLocationID", gr.tip_amount
from green_taxi_trips as gr
 join zones as zpu
 	on zpu."LocationID"  = gr."PULocationID"
 join zones as zdo
 	on zdo."LocationID"  = gr."DOLocationID"
 WHERE zpu."Zone" = 'Astoria'
 	order by tip_amount desc
 	limit 1