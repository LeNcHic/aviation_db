-- Сводная таблица для поминания кто больше зарабатывает
select
    job_position,
    experience,
    sex,
    salary,
    avg(salary) over (partition by job_position) as avg_salary
from aviation.employee
order by salary desc;


-- Таблица бренда самолета и типа физюляжа
select
    brand_of_plane,
    type_fuselage
from aviation.airplane
where year_of_production > 2000
group by brand_of_plane, number_of_steward
having number_of_steward > 4
order by brand_of_plane;


-- Посчиать общее кол-во самолетов и сколько в лизинге, а так же общую сумму расходов на лизинг
select
	count(id_plane) as number_of_all_planes,
    count(case is_in_leasing when true then 1 else null end) as numb_in_leasing,
    sum(leasing_cost) as leasing_cost_in_general
from aviation.air_force;

-- Отсортирвать аэропотры по пассажиропотоку, где плата за прилет от 50 до 100
select
    name_airport
from aviation.airport
where fee between 50 and 100
order by passenger_traffic_per_year;


-- Таблица самолетов и  их место отбытия и  прибытия отсортоированные по времени полета в порядке возростания
select
	brand_of_plane as plane_name,
    one.name_airport as departure_airport,
    two.name_airport as arrival_airport,
    time_departure,
    time_arrival
from aviation.flight inner join aviation.journal using(id_itinerary)
inner join aviation.airport as one on one.id_airport = id_departure_airport
inner join aviation.airport as two on two.id_airport = id_arrival_airport
inner join aviation.airplane USING(id_plane)
ORDER by time_arrival - time_departure;


-- Самые дорогие направления
select
	ticket_price_economy,
	ticket_price_business,
    one.name_airport as departure_airport,
    two.name_airport as arrival_airport
from aviation.flight inner join aviation.journal using(id_itinerary)
inner join aviation.airport as one on one.id_airport = id_departure_airport
inner join aviation.airport as two on two.id_airport = id_arrival_airport
ORDER by ticket_price_economy desc, ticket_price_business DESC;