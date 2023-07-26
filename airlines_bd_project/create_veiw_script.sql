create or replace view info_employee as
select
    first_name as name,
    second_name as surname,
    job_position as job,
    CONCAT(CONCAT(SUBSTRING(phone, 1, 5), '****'), SUBSTRING(phone, 11, 3)) as telephone,
    salary
from aviation.employee
with cascaded check option;


create or replace view info_air_forse as
select
	id_plane,
    case
    when is_in_leasing = true then 'in leasing'
    else 'in proprietary'
    end is_in_leasing,
  	'no aсcess' as leasing_cos,
    plane_cost
from aviation.air_force
with cascaded check option;


CREATE or REPLACE VIEW number_of_each_type_fuselage AS
SELECT
  	type_fuselage as narrow_fuselage,
	count(brand_of_plane) as planes
from aviation.airplane
GROUP by type_fuselage
ORDER by planes DESC;


CREATE or REPLACE VIEW salary_dependency AS
SELECT
    name_airline,
    experience,
    AVG(salary)
from aviation.employee inner join (SELECT id_airline, name_airline from aviation.airline) as airlines USING(id_airline)
GROUP by name_airline, experience
ORDER by name_airline, experience;


CREATE or REPLACE VIEW ailines_hub_info AS
select
	name_airline,
    name_airport,
    location_airport,
    fee
from aviation.airline INNER JOIN aviation.connection_airline_airport USING(id_airline)
inner join aviation.airport USING(id_airport)
ORDER by fee;

CREATE or REPLACE VIEW cheapest_ticket AS
SELECT
	brand_of_plane,
    time_arrival - time_departure as flight_time,
    min(ticket_price_economy) as cheapest_ticket
from aviation.airplane inner JOIN aviation.flight using (id_plane)
inner join aviation.journal USING(id_itinerary)
GROUP by brand_of_plane, flight_time
order by cheapest_ticket, flight_time;


