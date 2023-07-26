-- insert
insert into aviation.airline(id_airline, name_airline, year_of_foundation, passenger_traffic_per_year) values (16, 'Белые облока', 2022, 500000);
insert into aviation.employee(id_employee,  id_airline, first_name, second_name, phone, experience, job_position, height, weight, salary, sex) values
(16, 2, 'Richard', 'Lion', '+79123656783', 3, 'Пилот', 170, 70, 150000, 'Мужской');
insert into aviation.employee(id_employee,  id_airline, first_name, second_name, phone, experience, job_position, height, weight, salary, sex) values
(17, 5, 'Глеб', 'Петров', '+79123656783', 3, 'Второй пилот', 179, 75, 90000, 'Мужской');
insert into aviation.airport(id_airport, name_airport, location_airport, passenger_traffic_per_year, fee) values
(16, 'Пушкинский', 'Москва', 40000000, 1000);
insert into aviation.airplane(id_plane, brand_of_plane, year_of_production, number_seats_in_economy, number_seats_in_business, number_of_pilot, number_of_steward, type_fuselage) values
(16, 'Боинг 727', 2020, 250, 20, 2, 5, 'узкофюзеляжный');
insert into aviation.journal(id_itinerary, id_departure_airport, id_arrival_airport, time_departure, time_arrival) values
(46, 2, 2, '07:00', '09:30');
insert into aviation.journal(id_itinerary, id_departure_airport, id_arrival_airport, time_departure, time_arrival) values
(47, 3, 2, '09:30', '09:30');
insert into aviation.connection_plane_employee(id_plane, id_employee) values (1, 16);
insert into aviation.connection_plane_employee(id_plane, id_employee) values (5, 17);
insert into aviation.flight(id_plane, id_itinerary, money_for_flight_pilot, money_for_flight_steward, ticket_price_economy, ticket_price_business) values
(14, 3, 100000, 50000, 20000, 100000);
insert into aviation.flight(id_plane, id_itinerary, money_for_flight_pilot, money_for_flight_steward, ticket_price_economy, ticket_price_business) values
(5, 12, 120000, 70000, 15000, 50000);


-- select
select
    *
from aviation.flight;

select
    *
from aviation.airline;

select
    *
from aviation.employee
where sex = 'Мужской';

select
    *
from aviation.airport;

select
    *
from aviation.airplane
where year_of_production > 1996;

select
    *
from  aviation.journal;

select
    *
from aviation.journal
where id_departure_airport  = 1;

select
    *
from aviation.air_force
where is_in_leasing = false;

select
    *
from aviation.employee
where sex = 'Мужской' and salary > 30000;

select
    *
from aviation.airport
where location_airport = 'Москва';



-- update
update aviation.employee
set job_position = 'Пилот'
where job_position  = 'Стажер-пилот' and experience > 1;

update aviation.employee
set salary = salary * 1.1
where  sex = 'Женский';

update aviation.airline
set name_airline = 'Россия'
where name_airline = 'Аэрофлот' or name_airline = 'Aeroflot';

update aviation.airplane
set  number_seats_in_economy = number_seats_in_economy + 8, number_seats_in_business = number_seats_in_business - 4
where number_seats_in_business >= 4 and type_fuselage = 'узкофюзеляжный';

update aviation.flight
set ticket_price_economy = ticket_price_economy * 1.2, money_for_flight_pilot = money_for_flight_pilot * 1.12
where id_plane % 2 = 0 and id_itinerary >= 8;

update aviation.journal
set time_arrival = time_arrival + '1:10'
where id_arrival_airport % 3 = 0;

update aviation.airline
set passenger_traffic_per_year = 50000000
where name_airline = 'Аэрофлот' or name_airline = 'Aeroflot';

update aviation.air_force
set leasing_cost = leasing_cost * 1.1, plane_cost = plane_cost * 0.9;

update aviation.airport
set passenger_traffic_per_year = passenger_traffic_per_year + 10000000
where location_airport = 'Москва';

update aviation.airport
set fee = 0
where passenger_traffic_per_year < 100000;




-- delete
delete
from  aviation.employee
where height >= 2.05;

delete
from aviation.employee
where experience = 0;

delete
from aviation.airport
where passenger_traffic_per_year < 1000;

delete
from aviation.airport
where id_airport % 6 = 0;

delete
from aviation.airplane
where year_of_production < 1990 and type_fuselage = 'узкофюзеляжный';

delete
from aviation.journal
where id_departure_airport = id_arrival_airport;

delete
from aviation.journal
where time_departure = time_arrival;

delete
from aviation.air_force
where leasing_cost > plane_cost / 10;

delete
from aviation.airline
where passenger_traffic_per_year < 10000;

delete
from aviation.airline
where id_airline = 10;







