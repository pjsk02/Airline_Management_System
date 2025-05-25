use kailash;

-- PASSENGER------------------------------------------------------------------------
CREATE TABLE passenger (
    passenger_id INT,
    f_name VARCHAR(15),
    l_name VARCHAR(15),
    phnum INT,
    age INT,
    address VARCHAR(50),
    email varchar(50),
    aadhar_num INT NOT NULL
);
alter table passenger add constraint pid_pk primary key(passenger_id);

--  DISCOUNTS-----------------------------------------------------------------------
CREATE TABLE discount (
    coupon_id int,
    price INT,
    passenger_id int,
    foreign key(passenger_id) references passenger (passenger_id)
);
alter table discount add constraint coupon_pk primary key (coupon_id);

-- PAYMENTS------------------------------------------------------------------------
CREATE TABLE payments (
    payment_id INT,
    method VARCHAR(10),
    passenger_id INT,
    coupon_id INT,
    foreign key(passenger_id) references passenger (passenger_id),
    foreign key(coupon_id) references discount (coupon_id)
);
alter table payments add constraint payid_pk primary key (payment_id);

-- AIRLINES----------------------------------------------------------------
CREATE TABLE airline (
    airline_id INT,
    airline_name VARCHAR(15),
    type_aircraft VARCHAR(15),
    doj DATETIME,
    sear_num VARCHAR(10),
    price INT,
    passenger_id INT,
    foreign key(passenger_id) references passenger (passenger_id)
);
alter table airline add constraint air_pk primary key(airline_id);

-- TICKET------------------------------------------------------  
CREATE TABLE ticket (
    pnr INT,
    name_passenger VARCHAR(20),
    airline_name VARCHAR(20),
    duration INT,
    seat_num VARCHAR(20),
    amt INT,
    doj DATE,
    destination_name varchar(20),
    source_name varchar(20),
    flight_id INT,
    payment_id INT,
    foreign key(flight_id) references airline (airline_id),
    foreign key(payment_id) references payments (payment_id)
);
alter table ticket add constraint pnr_pk primary key(pnr);

-- STATUS-----------------------------------------------------------------------
create table flight_status(
	current_status varchar(50),
    airline_id INT,
    foreign key(airline_id) references airline (airline_id)
);

-- FOOD----------------------------------------------------------------------- 
CREATE TABLE food (
    food_id INT,
    food_name VARCHAR(20),
    quantity INT,
    airline_id INT,
    foreign key(airline_id) references airline (airline_id)
);
alter table food add constraint f_pk primary key(food_id);

-- SOURCE---------------------------------------------------------------
CREATE TABLE sourse (
    name_source VARCHAR(20),
    airport_id INT,
    airport_name VARCHAR(20),
    passenger_id INT,
    foreign key(passenger_id) references passenger (passenger_id)
);
alter table sourse add constraint sourse_pk primary key(airport_id);

-- DESTINATION-----------------------------------------------------------------
CREATE TABLE destination (
    name_destn VARCHAR(20),
    airport_id INT,
    airport_name VARCHAR(20),
    passenger_id INT,
    foreign key(passenger_id) references passenger (passenger_id)
);
alter table destination add constraint destn_pk primary key(airport_id);



