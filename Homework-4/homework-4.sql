/*
Alana Martin
Homework 4
CS 579 Database Management
FAll 2020
Professor Russo
*/

/*
 HOMEWORK 4-1
 List all shipments that contained Building Materials, arrived in London and had either Cliff Walker or John Smith as the captain.
*/

select distinct shipment.shipment_id
from shipment
inner join SHIPMENT_LINE
on SHIPMENT_LINE.SHIPMENT_ID = shipment.SHIPMENT_ID
inner join ITEM
on SHIPMENT_LINE.ITEM_NO = ITEM.ITEM_NO
where
destination = 'LONDON'
and
shipment.capt_id in ('001-23','001-24')
and
ITEM.ITEM_TYPE = 'BL';


/*
Since this is a learning environment testing by inserting a record.
Insert Record to test
*/
insert into shipment_line
(ITEM_NO , QUANTITY , SHIPMENT_ID)
VALUES
('3223', 1, '10-0001');

/*
Delete test record.
*/
delete from shipment_line
where
ITEM_NO = '3223' and
QUANTITY = 1 and
SHIPMENT_ID = '10-0001';


/*
 HOMEWORK 4-2
 List all captains who were captains of shipments that left Boston on or after 2011
*/
select  *
from captain
inner join shipment
on shipment.CAPT_ID = captain.CAPT_ID
where
origin = 'BOSTON'
and
shipment_date > '01-JAN-11';

/*
 HOMEWORK 4-3
List all items shipped out of Seattle as well as the weight of each item
 */
select distinct item.item_no, item.description, item.weight
from item
inner join SHIPMENT_LINE
on SHIPMENT_LINE.ITEM_NO = item.ITEM_NO
inner join SHIPMENT
on SHIPMENT_LINE.SHIPMENT_ID = SHIPMENT.SHIPMENT_ID
where
SHIPMENT.ORIGIN = 'SEATTLE'
;

/*
Homework 4-4
List all ships that have ever carried rice.
*/

select distinct SHIP.SHIP_NO, SHIP.CLASS, SHIP.CAPACITY, SHIP.PURCH_DATE, MANUFACTURER_ID
from SHIP
inner join SHIPMENT
on SHIP.SHIP_NO = SHIPMENT.SHIP_NO
inner join SHIPMENT_LINE
on SHIPMENT_LINE.SHIPMENT_ID = SHIPMENT.SHIPMENT_ID
inner join ITEM
on SHIPMENT_LINE.ITEM_NO = ITEM.ITEM_NO
where ITEM.DESCRIPTION = 'Rice'
;

/*
Homework 4-5
List all captains who were captains of shipments that carried rice
*/

select distinct CAPTAIN.CAPT_ID, CAPTAIN.FNAME, CAPTAIN.LNAME
from CAPTAIN
inner join SHIPMENT
on SHIPMENT.CAPT_ID = CAPTAIN.CAPT_ID
inner join SHIPMENT_LINE
on SHIPMENT_LINE.SHIPMENT_ID = SHIPMENT.SHIPMENT_ID
inner join ITEM
on SHIPMENT_LINE.ITEM_NO = ITEM.ITEM_NO
where ITEM.DESCRIPTION = 'Rice'
;


/*
Homework 4-6
List all captains who were captains of ships that carried rice. The captain may not
necessarily been the captain of the shipment that carried the rice
*/
select CAPTAIN.CAPT_ID, CAPTAIN.FNAME, CAPTAIN.LNAME
FROM CAPTAIN
INNER JOIN SHIPMENT
on SHIPMENT.CAPT_ID = CAPTAIN.CAPT_ID
where
SHIPMENT.SHIP_NO = (
  select distinct SHIP.SHIP_NO
    from SHIP
    inner join SHIPMENT
    on SHIP.SHIP_NO = SHIPMENT.SHIP_NO
    inner join SHIPMENT_LINE
    on SHIPMENT_LINE.SHIPMENT_ID = SHIPMENT.SHIPMENT_ID
    inner join ITEM
    on SHIPMENT_LINE.ITEM_NO = ITEM.ITEM_NO
  where ITEM.DESCRIPTION = 'Rice'
);
/*
Homework 4-7
For each origin, display the origin as well as the number of unique captains who have
been captains of shipments which left that port.
*/
select  origin, count ( distinct capt_id )
from shipment
group by ORIGIN
;
