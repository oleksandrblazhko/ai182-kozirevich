CREATE OR REPLACE FUNCTION change_data_secure(role_name VARCHAR, access_level INTEGER)
RETURNS INTEGER AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE role_access_level SET access_level = $1 where role_name = $2';
	RAISE NOTICE 'Query=%', str;
	EXECUTE str using access_level, role_name;
    RETURN access_level;
END;
$$ LANGUAGE plpgsql;
