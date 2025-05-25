use dbms_proj;

-- PASSENGER------------------------------------------------------------------------
CREATE TABLE passenger (
    passenger_id int,
    f_name VARCHAR(15),
    l_name VARCHAR(15),
    phnum int, 
    age int,
    address VARCHAR(50),
    email varchar(50),
    aadhar_num INT NOT NULL
);
alter table passenger add constraint pid_pk primary key(passenger_id);

-- AIRLINES----------------------------------------------------------------
CREATE TABLE airline (
    airline_id INT,
    airline_name VARCHAR(15),
    type_aircraft VARCHAR(15),
    doj DATETIME,
    sear_num VARCHAR(10),
    price INT
);
alter table airline add constraint air_pk primary key(airline_id);

-- SOURCE---------------------------------------------------------------
CREATE TABLE sourse (
    name_source VARCHAR(20),
    airport_id INT,
    airport_name VARCHAR(20)
);
alter table sourse add constraint sourse_pk primary key(airport_id);

-- DESTINATION-----------------------------------------------------------------
CREATE TABLE destination (
    name_destn VARCHAR(20),
    airport_id INT,
    airport_name VARCHAR(20)
);
alter table destination add constraint destn_pk primary key(airport_id);

--  DISCOUNTS-----------------------------------------------------------------------
CREATE TABLE discount (
    coupon_id VARCHAR(10),
    price INT
);
alter table discount add constraint coupon_pk primary key (coupon_id);

-- PAYMENTS------------------------------------------------------------------------
CREATE TABLE payments (
    payment_id INT,
    method VARCHAR(10),
    coupon_id varchar(10),
    foreign key(coupon_id) references discount (coupon_id)
);
alter table payments add constraint payid_pk primary key (payment_id);

-- TICKET------------------------------------------------------  
CREATE TABLE ticket (
    pnr INT,
    name_passenger VARCHAR(20),
    airline_name VARCHAR(20),
    seat_num VARCHAR(20),
    amt INT,
    doj DATE,
    destination_name varchar(20),
    source_name varchar(20),
    flight_id INT,--
    foreign key(flight_id) references airline (airline_id)
);
alter table ticket add constraint pnr_pk primary key(pnr);

-- FOOD----------------------------------------------------------------------- 
CREATE TABLE food (
    food_id INT,
    food_name VARCHAR(20),
    price int
);
alter table food add constraint f_pk primary key(food_id);

-- STATUS-----------------------------------------------------------------------
create table flight_status(
	current_status varchar(50),
    airline_id INT,
    foreign key(airline_id) references airline (airline_id)
);
insert into flight_status values('Vizag',587);
-- Available Flights--------------------------------------------------------------
CREATE TABLE available_flights (
    passenger_id INT,
    airplane_id INT,
    airplane_name VARCHAR(15),
    name_source VARCHAR(20),
    name_destn VARCHAR(20),
    duration INT,
    amt INT,
    doj date
);

alter table airline drop column sear_num;
alter table airline drop column passenger_id;
alter table airline drop constraint airline_ibfk_1;

alter table ticket drop column duration;
alter table ticket drop column payment_id;
alter table ticket drop constraint ticket_ibfk_2;

alter table discount drop column passenger_id;
alter table discount drop constraint discount_ibfk_1;

alter table payments drop column passenger_id;
alter table payments drop constraint payments_ibfk_1;

alter table sourse drop column passenger_id;
alter table sourse drop constraint sourse_ibfk_1;
alter table destination drop column passenger_id;
alter table destination drop constraint destination_ibfk_1;

alter table ticket modify doj date;
alter table available_flights modify doj datetime;
alter table available_flights modify airplane_id int;

desc ticket;
alter table ticket drop column payment_id;
alter table ticket drop column duration;
alter table ticket drop constraint ticket_ibfk_2;

alter table ticket add passenger_id int;

insert into passenger values(101,'Prithviraj','G',6845,19,'Chennai','pg@gmail',5698);
insert into passenger values(102,'Kailash','P',645,19,'Vizag','kp@gmail',4598);
insert into passenger values(103,'Varshini','G',7899,19,'Vizag','vg@gmail',1238);
insert into passenger values(104,'Giridhar','J',4651,18,'Hyderabad','gj@gmail',46513);
insert into passenger values(105,'Robert','D',78135,29,'US','rd@gmail',7891);
insert into passenger values(106,'Stefan','S',65478,59,'Delhi','ss@gmail',12345);
select * from passenger;
desc passenger;

desc airline;
insert into airline values(293,'Indigo','A330','2021-11-15 06:30:00',2699);
insert into airline values(185,'TrueJet','AA150','2021-11-29 16:30:00',5699);
insert into airline values(324,'GoAirways','KTR690','2021-12-03 14:45:00',7899);
insert into airline values(475,'SpiceJet','A320','2021-11-30 19:33:00',1599);
insert into airline values(854,'Emirates','B777','2022-01-15 22:14:00',3299);
insert into airline values(169,'Vistara','A609','2021-12-05 23:59:00',4999);
select * from airline;
desc airline;



insert into sourse values('Chennai',1001,'Kamaraj INT');
insert into sourse values('Hyderabadi',1002,'Rajiv Gandhi INT');
insert into sourse values('Mumbai',1003,'Shivaji INT');
insert into sourse values('Delhi',1004,'Indiragandhi INT');
insert into sourse values('Dubai',1005,'Al Maktum INT');
select * from sourse;
desc sourse;

insert into destination values('Banglore',1006,'Kempogoda INT');
insert into destination values('Chennai',1001,'Kamaraj INT');
insert into destination values('Hyderabadi',1002,'Rajiv Gandhi INT');
insert into destination values('Mumbai',1003,'Shivaji INT');
insert into destination values('Delhi',1004,'Indiragandhi INT');
insert into destination values('Dubai',1005,'Al Maktum INT');
select * from destination;
desc destination;

insert into discount values('PAY_500',500);
insert into discount values('Fly_1000',1000);
insert into discount values('Sky_3500',3500);
select * from discount;

insert into payments values(351, 'UPI/BHIM', 'PAY_500');
insert into payments values(452, 'CreditCard', 'Fly_1000');
insert into payments values(553, 'DebitCard', 'Sky_3500');
insert into payments values(654, 'Gpay', 'PAY_500');
select * from payments;
desc payments;

desc ticket;
insert into ticket values(684325,'Kailash','A330','16',2699,'2021-11-15','Chennai','Vizag',293,102);
insert into ticket values(158764,'Varshini','B777','29',3299,'2022-01-15','Dubai','Vizag',854,103);
select * from ticket;

alter table flight_status drop constraint flight_status_ibfk_1;
insert into flight_status values('Chennai',185);
insert into flight_status values('Vizag',293);
insert into flight_status values('Hyderabad',324);
insert into flight_status values('Dubai',475);
select * from flight_status;
delete from flight_status where airline_id=293;

alter table food drop constraint food_ibfk_1;
insert into food values(123, 'Samosa',220);
insert into food values(456, ' VegSandwich',369);
insert into food values(789, ' ChickenSandwich',420);
insert into food values(321, 'Pasta',567);
insert into food values(654, 'Coffee',159);
insert into food values(987, 'Tea',129);
select * from food;

insert into available_flights values(101,169,'Vistara','Vizag','Chennai',2,4999,'2021-12-05');
insert into available_flights values(102,185,'TrueJet','Hyderabad','Delhi',3,5699,'2021-11-29');
insert into available_flights values(103,293,'Indigo','Chennai','Hyderabad',5,2699,'2021-11-15');
insert into available_flights values(104,324,'GoAirways','Mumbai','Bangalore',4,7899,'2021-12-03');
delete from available_flights where amt=4999;
select * from available_flights;