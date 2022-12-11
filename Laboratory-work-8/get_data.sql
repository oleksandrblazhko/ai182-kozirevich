CREATE OR REPLACE FUNCTION get_data(hotel_name VARCHAR)
RETURNS TABLE (h_id INTEGER, name VARCHAR, address VARCHAR) AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT h_id, name, address FROM hotel WHERE name = ''' || hotel_name || '''';
	RAISE NOTICE 'Query=%', str;
	RETURN QUERY EXECUTE str;
END;
  $$ LANGUAGE plpgsql;
