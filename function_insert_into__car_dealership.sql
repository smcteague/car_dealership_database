-- creating a function
CREATE FUNCTION add_actor(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_last_update TIMESTAMP WITHOUT TIME ZONE
)
RETURNS void
AS 
$MAIN$
BEGIN
	INSERT INTO actor(first_name, last_name)
	VALUES(_first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- call function using SELECT
SELECT add_actor('Andy', 'Samberg', NOW()::timestamp);

-- check result of function
SELECT * 
FROM actor
WHERE first_name = 'Andy' AND last_name = 'Samberg';