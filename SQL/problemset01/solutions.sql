CREATE TABLE GUEST (GUEST_NO CHAR(4) PRIMARY KEY, NAME CHAR(20),CITY CHAR(20));
INSERT INTO GUEST VALUES('G256','ADAM WAYNE','PITTSBURGH');
INSERT INTO GUEST VALUES('G367','TARA CUMMINGS','BALTIMORE');
INSERT INTO GUEST VALUES('G879','VANESSA PARRY','PITTSBURGH');
INSERT INTO GUEST VALUES('G230','TOM HANCOCK','PHILADELPHIA');
INSERT INTO GUEST VALUES('G467','ROBERT SWIFT','ATLANTA');
INSERT INTO GUEST VALUES('G190','EDWARD CANE','BALTIMORE');


CREATE TABLE HOTEL(HOTEL_NO VARCHAR(5) PRIMARY KEY,NAME VARCHAR(20),CITY VARCHAR(20));
INSERT INTO HOTEL VALUES("H111","EMPIRE HOTEL","NEW YORK");
INSERT INTO HOTEL VALUES("H235","PARK PLACE","NEW YORK");
INSERT INTO HOTEL VALUES("H432","BROWNSTONE HOTEL","TORONTO");
INSERT INTO HOTEL VALUES("H498","JAMES PLAZA","TORONTO");
INSERT INTO HOTEL VALUES("H193","DEVON HOTEL","BOSTON");
INSERT INTO HOTEL VALUES("H437","CLAIRMONT HOTEL","BOSTON");



CREATE TABLE ROOM(ROOM_NO INTEGER PRIMARY KEY,HOTEL_NO VARCHAR REFERENCES HOTEL(HOTEL_NO),TYPE VARCHAR,PRICE INTEGER);
INSERT INTO ROOM VALUES(313,'H111','S',145.00);
INSERT INTO ROOM VALUES(412,'H111','N',145.00);
INSERT INTO ROOM VALUES(1267,'H235','N',175.00);
INSERT INTO ROOM VALUES(1289,'H235','N',195.00);
INSERT INTO ROOM VALUES(876,'H432','S',124.00);
INSERT INTO ROOM VALUES(898,'H432','S',124.00);
INSERT INTO ROOM VALUES(345,'H498','N',160.00);
INSERT INTO ROOM VALUES(467,'H498','N',180.00);
INSERT INTO ROOM VALUES(1001,'H193','S',150.00);
INSERT INTO ROOM VALUES(1201,'H193','N',175.00);
INSERT INTO ROOM VALUES(257,'H437','N',140.00);
INSERT INTO ROOM VALUES(223,'H437','N',155.00);

CREATE TABLE BOOKING(HOTEL_NO VARCHAR(10) REFERENCES ROOM(ROOM_NO),GUEST_NO VARCHAR(20) REFERENCES GUEST(GUEST_NO),DATE_FROM VARCHAR(20),DATE_TO VARCHAR(20),ROOM_NO REFERENCES ROOM(ROOM_NO),CONSTRAINT PK PRIMARY KEY(DATE_FROM,DATE_TO));
INSERT INTO BOOKING VALUES('H111','G256','10-AUG-99','15-AUG-99',412);
INSERT INTO BOOKING VALUES('H111','G367','18-AUG-99','21-AUG-99',412);
INSERT INTO BOOKING VALUES('H235','G879','05-SEP-99','12-SEP-99',1267);
INSERT INTO BOOKING VALUES('H498','G230','15-SEP-99','18-SEP-99',467);
INSERT INTO BOOKING VALUES('H498','G256','30-NOV-99','02-DEC-99',345);
INSERT INTO BOOKING VALUES('H498','G467','03-NOV-99','05-NOV-99',345);
INSERT INTO BOOKING VALUES('H193','G190','15-NOV-99','19-NOV-99',1001);
INSERT INTO BOOKING VALUES('H193','G367','12-SEP-99','14-SEP-99',1001);
INSERT INTO BOOKING VALUES('H193','G367','01-OCT-99','06-OCT-99',1201);
INSERT INTO BOOKING VALUES('H437','G190','04-OCT-99','06-OCT-99',223);
INSERT INTO BOOKING VALUES('H437','G879','14-SEP-99','17-SEP-99',223);







1)List full details of all hotels.

Select * from hotel;
H111|EMPIRE HOTEL|NEW YORK
H235|PARK PLACE|NEW YORK
H432|BROWNSTONE HOTEL|TORONTO
H498|JAMES PLAZA|TORONTO
H193|DEVON HOTEL|BOSTON
H437|CLAIRMONT HOTEL|BOSTON

2)List full details of all hotels in New York.
Select * from hotel where city='NEW YORK';
H111|EMPIRE HOTEL|NEW YORK
H235|PARK PLACE|NEW YORK

3)List the names and cities of all guests, ordered according to their cities
Select name,city from guest order by city;
ROBERT SWIFT|ATLANTA
TARA CUMMINGS|BALTIMORE
EDWARD CANE|BALTIMORE
TOM HANCOCK|PHILADELPHIA
ADAM WAYNE|PITTSBURGH
VANESSA PARRY|PITTSBURGH

4)List all details for non-smoking rooms in ascending order of price.
select * from room where type='N' order by price;
257|H437|N|140
412|H111|N|145
223|H437|N|155
345|H498|N|160
1201|H193|N|175
1267|H235|N|175
467|H498|N|180
1289|H235|N|195

5)List the number of hotels there are.
select count(*) from hotel;
6

6)List the cities in which guests live. Each city should be listed only once.
Select DISTINCT city from guest;
PITTSBURGH
BALTIMORE
PHILADELPHIA
ATLANTA

7)List the average price of a room.
Select AVG(price) from room;
155.666666666667

8)List hotel names, their room numbers, and the type of that room.
Select h.name,r.room_no,r.type from hotel h join room r where r.hotel_no=h.hotel_no;
CLAIRMONT HOTEL|223|N
CLAIRMONT HOTEL|257|N
EMPIRE HOTEL|313|S
JAMES PLAZA|345|N
EMPIRE HOTEL|412|N
JAMES PLAZA|467|N
BROWNSTONE HOTEL|876|S
BROWNSTONE HOTEL|898|S
DEVON HOTEL|1001|S
DEVON HOTEL|1201|N
PARK PLACE|1267|N
PARK PLACE|1289|N

9)List the hotel names, booking dates, and room numbers for all hotels in New York.
Select h.name,b.date_from,b.date_to,b.room_no from hotel h join booking b where h.hotel_no=b.hotel_no and city='NEW YORK';
EMPIRE HOTEL|10-AUG-99|15-AUG-99|412
EMPIRE HOTEL|18-AUG-99|21-AUG-99|412
PARK PLACE|05-SEP-99|12-SEP-99|1267

10)What is the number of bookings that started in the month of September?
Select count(*) from booking where date_from like'%SEP%';
4

11)List the names and cities of guests who began a stay in New York in August.
 Select g.name,g.city from guest g join booking b on g.guest_no=b.guest_no join hotel h on h.hotel_no=b.hotel_no where date_from like '%AUG%' and h.city='NEW YORK';
ADAM WAYNE|PITTSBURGH
TARA CUMMINGS|BALTIMORE

12)List the hotel names and room numbers of any hotel rooms that have not been booked.
Select h.name,r.room_no from hotel h join room r on h.hotel_no=r.hotel_no where r.room_no not in(select room_no from booking);
CLAIRMONT HOTEL|257
EMPIRE HOTEL|313
BROWNSTONE HOTEL|876
BROWNSTONE HOTEL|898
PARK PLACE|1289

13)List the hotel name and city of the hotel with the highest priced room.
Select h.name,h.city from hotel h join room r on h.hotel_no=r.hotel_no where price =(select max(price) from room);
PARK PLACE|NEW YORK

14)List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
select h.name,h.city,r.room_no,r.price from hotel h join room r on r.hotel_no=h.hotel_no where price < (select min(r.price) from hotel h join room r on 
h.hotel_no=r.hotel_no where h.city='BOSTON'); 
BROWNSTONE HOTEL|TORONTO|876|124
BROWNSTONE HOTEL|TORONTO|898|124

15)List the average price of a room grouped by city.
select h.city, avg(r.price) from room r join hotel h on h.hotel_no=r.hotel_no group by h.city;
BOSTON|155.0
NEW YORK|165.0
TORONTO|147.0
