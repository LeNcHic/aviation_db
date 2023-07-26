-- Так как пользователю интересно назнание компании и большую часть запросов будут связаны с названием авиалинии, то имеет
-- смысл делать индекс по name_airline
create index airline_name_index
on aviation.airline (name_airline)

-- Часто для оценки сотрудника самые главные парметры опыт и зарплата
create index employee_index
on aviation.employee (experience, salary)

-- Так же как и для авиакомнаний пользователю интересно название аэропорта, а не его уникальный номер в системе
create index airport_index
on aviation.airport (name_airport)

-- Для самолета интересны параметры year_of_production, чтобы понять когда придет в непригодность,  type_fuselage - для полетов на далекие расстояния или нет
-- brand_of_plane - марка, какая лучше
create index airplane_index
on aviation.airplane (brand_of_plane, year_of_production, type_fuselage)

-- Интересно какие направления самые популярные
create index journal_index
on aviation.journal (id_departure_airport, id_arrival_airport)
