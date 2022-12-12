CREATE OR REPLACE FUNCTION get_data_secure(hotel_name VARCHAR)
RETURNS TABLE (h_id INTEGER, name VARCHAR, address VARCHAR) AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT h_id, name, address FROM hotel WHERE name = $1';
	RAISE NOTICE 'Query=%', str;
	RETURN QUERY EXECUTE str using hotel_name;
END;
  $$ LANGUAGE plpgsql;
