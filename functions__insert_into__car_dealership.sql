-- functions to insert data into car_dealership database

-- --------------------------------------------------------
-- add_customer function
-- --------------------------------------------------------
CREATE FUNCTION add_customer(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_address VARCHAR(150),
	_email VARCHAR(100),
	_phone VARCHAR(14),
	_billing_info VARCHAR(100)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO customer(
		first_name,
		last_name,
		address,
		email,
		phone,
		billing_info
	)
	VALUES(
		_first_name,
		_last_name,
		_address,
		_email,
		_phone,
		_billing_info
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_customer function
SELECT add_customer(
	'John',
	'Smith',
	'123 Main St',
	'johnsmith@example.com',
	'555-555-5555',
	'1234 5678 9101 1121 123 01/23'
);

SELECT add_customer(
	'Jane',
	'Doe',
	'456 Maple Ave',
	'janedoe@example.com',
	'555-555-1212',
	'5678 1234 1121 9101 456 02/24'
);

-- check result of add_customer function
SELECT * 
FROM customer;


-- --------------------------------------------------------
-- add_sales_service_staff function
-- --------------------------------------------------------
CREATE FUNCTION add_sales_service_staff(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_department VARCHAR(100)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO sales_service_staff(
		first_name,
		last_name,
		department
	)
	VALUES(
		_first_name,
		_last_name,
		_department
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_sales_service_staff function
SELECT add_sales_service_staff(
	'Bob',
	'Jones',
	'Sales'
);

SELECT add_sales_service_staff(
	'Mary',
	'Johnson',
	'Service'
);

-- check result of add_sales_service_staff function
SELECT *
FROM sales_service_staff;


-- --------------------------------------------------------
-- add_mechanic function
-- --------------------------------------------------------
CREATE FUNCTION add_mechanic(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO mechanic(
		first_name,
		last_name
	)
	VALUES(
		_first_name,
		_last_name
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_mechanic function
SELECT add_mechanic(
	'Paul',
	'Green'
);

SELECT add_mechanic(
	'Sue',
	'Black'
);

-- check result of add_mechanic function
SELECT *
FROM mechanic;


-- --------------------------------------------------------
-- add_vehicle_inventory function
-- --------------------------------------------------------
CREATE FUNCTION add_vehicle_inventory(
	_vin VARCHAR(17),
	_make VARCHAR(50),
	_model VARCHAR(50),
	_year INTEGER,
	_vintage VARCHAR(10),
	_mileage INTEGER,
	_price NUMERIC(9,2)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO vehicle_inventory(
		vin,
		make,
		model,
		"year",
		vintage,
		mileage,
		price
	)
	VALUES(
		_vin,
		_make,
		_model,
		_year,
		_vintage,
		_mileage,
		_price
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_vehicle_inventory function
SELECT add_vehicle_inventory(
	'A12B34C45D67E89F0',
	'Honda',
	'CRV',
	2022,
	'New',
	12,
	40000.00	
);

SELECT add_vehicle_inventory(
	'D67E89F0A12B34C45',
	'Hyundai',
	'Accent',
	2018,
	'Used',
	50000,
	12000.00	
);

-- check result of add_vehicle_inventory function
SELECT *
FROM vehicle_inventory;


-- --------------------------------------------------------
-- add_parts function
-- --------------------------------------------------------
CREATE FUNCTION add_parts(
	_name VARCHAR(50),
	_price NUMERIC(7,2)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO parts(
		"name",
		price
	)
	VALUES(
		_name,
		_price
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_parts function
SELECT add_parts(
	'battery',
	125.00
);

SELECT add_parts(
	'radiator',
	500.00
);

-- check result of add_parts function
SELECT *
FROM parts;


-- --------------------------------------------------------
-- add_services function
-- --------------------------------------------------------
CREATE FUNCTION add_services(
	_name VARCHAR(50),
	_price NUMERIC(7,2)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO services(
		"name",
		price
	)
	VALUES(
		_name,
		_price
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_services function
SELECT add_services(
	'oil change',
	35.00
);

SELECT add_services(
	'tire rotation',
	40.00
);

-- check result of add_services function
SELECT *
FROM services;


-- --------------------------------------------------------
-- add_invoice function
-- --------------------------------------------------------
CREATE FUNCTION add_invoice(
	"_date" DATE,
	_total_cost NUMERIC(9,2),
	_staff_id INTEGER,
	_customer_id INTEGER,
	_vin VARCHAR(17)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO invoice(
		"date",
		total_cost,
		staff_id,
		customer_id,
		vin
	)
	VALUES(
		"_date",
		_total_cost,
		_staff_id,
		_customer_id,
		_vin
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_invoice function
SELECT add_invoice(
	'2022-11-10',
	40000.00,
	1,
	2,
	'A12B34C45D67E89F0'
);

SELECT add_invoice(
	'2022-11-09',
	12000.00,
	1,
	1,
	'D67E89F0A12B34C45'
);

-- check result of add_invoice function
SELECT *
FROM invoice;


-- --------------------------------------------------------
-- add_vehicle_serviced function
-- --------------------------------------------------------
CREATE FUNCTION add_vehicle_serviced(
	_vin VARCHAR(17),
	_make VARCHAR(50),
	_model VARCHAR(50),
	_year INTEGER,
	_mileage INTEGER
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO vehicle_serviced(
		vin,
		make,
		model,
		"year",
		mileage
	)
	VALUES(
		_vin,
		_make,
		_model,
		_year,
		_mileage
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_vehicle_serviced function
SELECT add_vehicle_serviced(
	'B34C45D67A12E89F0',
	'Ford',
	'Mustang',
	2016,
	55000
);

SELECT add_vehicle_serviced(
	'E89F0A12D67B34C45',
	'KIA',
	'Sorrento',
	2020,
	22000	
);

-- check result of add_vehicle_serviced function
SELECT *
FROM vehicle_serviced;


-- --------------------------------------------------------
-- add_service_ticket function
-- --------------------------------------------------------
CREATE FUNCTION add_service_ticket(
	"_date" DATE,
	_total_cost NUMERIC(7,2),
	_staff_id INTEGER,
	_customer_id INTEGER,
	_vin VARCHAR(17)
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO service_ticket(
		date,
		total_cost,
		staff_id,
		customer_id,
		vin
	)
	VALUES(
		"_date",
		_total_cost,
		_staff_id,
		_customer_id,
		_vin
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_service_ticket function
SELECT add_service_ticket(
	'2022-11-08',
	35.00,
	2,
	1,
	'B34C45D67A12E89F0'
);

SELECT add_service_ticket(
	'2022-10-15',
	40.00,
	2,
	2,
	'E89F0A12D67B34C45'	
);

-- check result of add_service_ticket function
SELECT *
FROM service_ticket;


-- --------------------------------------------------------
-- add_service_parts function
-- --------------------------------------------------------
CREATE FUNCTION add_service_parts(
	_service_id INTEGER,
	_parts_id INTEGER,
	_parts_quantity INTEGER,
	_service_ticket_id INTEGER
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO service_parts(
		service_id,
		parts_id,
		parts_quantity,
		service_ticket_id
	)
	VALUES(
		_service_id,
		_parts_id,
		_parts_quantity,
		_service_ticket_id
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_service_parts function
SELECT add_service_parts(
	1,
	NULL,
	NULL,
	1
);

SELECT add_service_parts(
	2,
	2,
	1,
	2
);

-- check result of add_service_parts function
SELECT *
FROM service_parts;


-- --------------------------------------------------------
-- add_service_mechanics function
-- --------------------------------------------------------
CREATE FUNCTION add_service_mechanics(
	_mechanic_id INTEGER,
	_service_ticket_id INTEGER
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO service_mechanics(
		mechanic_id,
		service_ticket_id
	)
	VALUES(
		_mechanic_id,
		_service_ticket_id
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_service_mechanics function
SELECT add_service_mechanics(
	1,
	2
);

SELECT add_service_mechanics(
	2,
	1
);

-- check result of add_service_mechanics function
SELECT *
FROM service_mechanics;

-- --------------------------------------------------------
-- add_service_history function
-- --------------------------------------------------------
CREATE FUNCTION add_service_history(
	_service_ticket_id INTEGER
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO service_history(
		service_ticket_id
	)
	VALUES(
		_service_ticket_id
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- call add_service_history function
SELECT add_service_history(
	1
);

SELECT add_service_history(
	2
);

-- check result of add_service_mechanics function
SELECT *
FROM service_history;
