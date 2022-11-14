-- data validation queries for car_dealership database

SELECT * 
FROM customer
FULL OUTER JOIN invoice
ON customer.customer_id = invoice.customer_id

SELECT * 
FROM customer
FULL OUTER JOIN service_ticket
ON customer.customer_id = service_ticket.customer_id

SELECT * 
FROM sales_service_staff
FULL OUTER JOIN invoice
ON invoice.staff_id = sales_service_staff.staff_id

SELECT * 
FROM vehicle_inventory
FULL OUTER JOIN invoice
ON invoice.vin = vehicle_inventory.vin

SELECT * 
FROM vehicle_serviced
FULL OUTER JOIN service_ticket
ON service_ticket.vin = vehicle_serviced.vin

SELECT * 
FROM service_mechanics
FULL OUTER JOIN service_ticket
ON service_ticket.service_ticket_id = service_mechanics.service_ticket_id

SELECT * 
FROM service_parts
FULL OUTER JOIN service_ticket
ON service_ticket.service_ticket_id = service_parts.service_ticket_id

SELECT * 
FROM sales_service_staff
FULL OUTER JOIN service_ticket
ON service_ticket.staff_id = sales_service_staff.staff_id

SELECT * 
FROM service_history
FULL OUTER JOIN service_ticket
ON service_ticket.service_ticket_id = service_history.service_ticket_id

SELECT * 
FROM mechanic
FULL OUTER JOIN service_mechanics
ON service_mechanics.mechanic_id = mechanic.mechanic_id

SELECT * 
FROM services
FULL OUTER JOIN service_parts
ON service_parts.service_id = services.service_id

SELECT * 
FROM parts
FULL OUTER JOIN service_parts
ON service_parts.parts_id = parts.parts_id



