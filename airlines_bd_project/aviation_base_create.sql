create schema aviation;

-- Авиакомпания
create table aviation.airline(
    id_airline integer,
    name_airline varchar(50) not null,
    year_of_foundation integer check (year_of_foundation > 1800 ) ,
    passenger_traffic_per_year integer default 0 check (passenger_traffic_per_year > 0),

    constraint pk_airline primary key(id_airline)
);

-- Авиапарк
create table aviation.air_force(
    id_plane integer,
    is_in_leasing bool,
    leasing_cost integer,
    plane_cost integer,

    constraint pk_air_force primary key(id_plane)
);

-- Сотрудник
create table aviation.employee(
    id_employee integer,
    id_airline integer,
    first_name varchar(30) not null,
    second_name varchar(30) not null,
    phone varchar check (length(phone) between 11 and 12),
    experience integer default 0 check (experience >= 0),
    job_position varchar(50),
    height integer check (height >= 0),
    weight integer check (weight >= 0),
    salary integer,
    sex varchar(30),

    constraint pk_employee primary key(id_employee)
);

-- Аэропорт
create table aviation.airport(
    id_airport integer,
    name_airport varchar(100),
    location_airport varchar(100),
    passenger_traffic_per_year integer default 0 check (passenger_traffic_per_year > 0),
    fee integer,

    constraint pk_airport primary key(id_airport)
);

-- Самолет
create table aviation.airplane(
    id_plane integer,
    brand_of_plane varchar(100),
    year_of_production integer,
    number_seats_in_economy integer,
    number_seats_in_business integer,
    number_of_pilot integer,
    number_of_steward integer,
    type_fuselage varchar(50),

    constraint pk_airplane primary key(id_plane)
);

-- Маршруты
create table aviation.journal(
    id_itinerary integer,
    id_departure_airport integer,
    id_arrival_airport integer,
    time_departure time,
    time_arrival time,
    data_flight timestamp default now()::date,

    constraint pk_journal primary key(id_itinerary),

    constraint fk_journal1 foreign key (id_arrival_airport)
    references aviation.airport(id_airport)  on delete cascade,

    constraint fk_journal2 foreign key (id_departure_airport)
    references aviation.airport(id_airport)  on delete cascade
);

-- Связь сотрудника и самолета
create table aviation.connection_plane_employee(
    id_plane integer,
    id_employee integer,

    constraint fk_plane foreign key(id_plane)
    references aviation.airplane(id_plane) on delete cascade on update cascade,

    constraint fk_employee foreign key(id_employee)
    references aviation.employee(id_employee) on delete cascade on update cascade
);

-- Рейсы самолетов(связь самолета и маршрута)
create table aviation.flight(
    id_plane integer,
    id_itinerary integer,
    money_for_flight_pilot integer,
    money_for_flight_steward integer,
    ticket_price_economy integer,
    ticket_price_business integer,

    constraint fk_flight_plane foreign key(id_plane)
    references aviation.airplane(id_plane) on delete restrict,

    constraint fk_flight_itinerary foreign key(id_itinerary)
    references aviation.journal on delete cascade on update cascade
);

--Связь авиакомпании и аэропорта
create table aviation.connection_airline_airport(
    id_airline integer,
    id_airport integer,

    constraint fk_airline foreign key(id_airline)
    references aviation.airline(id_airline) on delete cascade on update cascade,

    constraint fk_airport foreign key(id_airport)
    references aviation.airport(id_airport) on delete cascade on update cascade
);

-- История маршрутов
create table aviation.history_of_journal(
    id_itinerary integer,
    id_departure_airport integer,
    id_arrival_airport integer,
    time_departure time,
    time_arrival time,

    constraint fk_itinerary foreign key(id_itinerary)
    references aviation.journal(id_itinerary) on delete cascade on update cascade,

    constraint fk_airport1 foreign key(id_departure_airport)
    references aviation.airport(id_airport) on delete cascade on update cascade,

    constraint fk_airport2 foreign key(id_arrival_airport)
    references aviation.airport(id_airport) on delete cascade on update cascade
);

-- История карьерного роста сотрудников
create table aviation.history_employee(
    id_employee integer,
    first_name varchar(30) not null,
    second_name varchar(30) not null,
    job_position varchar(50),
    salary integer,

    constraint fk_employee foreign key(id_employee)
    references aviation.employee(id_employee) on delete cascade  on update cascade
);
