SELECT * FROM get_data('1'' UNION (SELECT a1, CAST(a1 AS VARCHAR), CAST(a1 AS VARCHAR) FROM (SELECT generate_series a1 FROM generate_series (1,1000)) t1 CROSS JOIN (SELECT * FROM generate_series (1,1000) t2) t3) -- ');
![image](https://user-images.githubusercontent.com/79399103/206896571-175aafeb-3685-492a-800e-ca722ba979bc.png)
![image](https://user-images.githubusercontent.com/79399103/206896734-fb4df9bd-8c7f-4265-a818-47f1154bee4a.png)
