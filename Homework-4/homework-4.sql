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
