## Крок 1
#### Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.

![image](https://user-images.githubusercontent.com/79399103/206852162-52f5d3a7-82ba-49cd-a97e-e0b072bdf14a.png)

DROP TABLE IF EXISTS Access_Levels CASCADE;
CREATE TABLE Access_Levels (
access_level_id INTEGER PRIMARY KEY,
access_level VARCHAR UNIQUE
);
INSERT INTO Access_Levels VALUES (1, 'public');
INSERT INTO Access_Levels VALUES (2, 'private');
INSERT INTO Access_Levels VALUES (3, 'secret');
DROP TABLE IF EXISTS Role_Access_Level CASCADE;
CREATE TABLE Role_Access_Level (
role_name VARCHAR PRIMARY KEY,
access_level INTEGER REFERENCES
Access_Levels (access_level_id)
);
REVOKE ALL
ON Role_Access_Level
FROM GROUP yaroslav;
GRANT SELECT
ON Role_Access_Level
TO GROUP yaroslav;

## Крок 2
#### Визначте для кожного рядка таблиці мітки конфіденційності (для кожного рядка свою мітку).
UPDATE PUBLIC.hotel
SET spot_conf = 3;

## Крок 3
#### Визначте для користувача його рівень доступу

![image](https://user-images.githubusercontent.com/79399103/206852315-c62ee360-371c-479c-abe7-28e1d169f6fd.png)

## Крок 4
#### Створіть нову схему даних.
DROP SCHEMA IF EXISTS yaroslav CASCADE;
CREATE SCHEMA yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206852355-42f6ab0c-9370-463a-b020-b5321cc33176.png)

ALTER SCHEMA yaroslav OWNER TO yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206852375-b8310a89-7a6c-4ebd-9001-1c61728557b3.png)

## Крок 5
#### Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача.

![image](https://user-images.githubusercontent.com/79399103/206852491-71a2abdf-5244-4aa0-bbcd-805b69ddd148.png)

CREATE VIEW yaroslav.hotel AS SELECT h_id,name,address FROM PUBLIC.hotel s, Role_Access_Level l WHERE l.role_name = CURRENT_USER and l.access_level >= s.spot_conf;

## Крок 6
#### Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

![image](https://user-images.githubusercontent.com/79399103/206852607-a5eb4ff7-7d8a-41e3-ad7a-c2bef2df044c.png)

REVOKE ALL ON public.hotel FROM yaroslav;
GRANT SELECT 
ON yaroslav.hotel 
TO yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206852648-a3fe9cd3-8bdd-44a6-b384-e9d2679ca487.png)

SELECT * FROM public.hotel;
SELECT * FROM yaroslav.hotel;

![image](https://user-images.githubusercontent.com/79399103/206852669-44b32b2d-6d6c-4980-bf6a-4c71bca87515.png)

UPDATE public.hotel 
SET spot_conf = 2 
WHERE h_id = 2;

![image](https://user-images.githubusercontent.com/79399103/206852947-2f377695-76ca-4de1-9ff1-39bd9814902e.png)

select * from hotel;

GRANT DELETE 
ON yaroslav.hotel 
TO yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206852990-845c64e0-b11c-4246-bcd7-a61a69a3f06c.png)

DELETE from hotel;

![image](https://user-images.githubusercontent.com/79399103/206853013-70146408-9e06-4314-95da-9743f371f0c6.png)

CREATE RULE hotel_delete 
AS ON DELETE TO yaroslav.hotel
DO INSTEAD
DELETE FROM public.hotel 
WHERE h_id = OLD.h_id;

![image](https://user-images.githubusercontent.com/79399103/206853059-aada52b5-a351-4828-a79b-6cdb6460ae2e.png)

![image](https://user-images.githubusercontent.com/79399103/206853081-7547e446-3889-4e60-9ea0-a142f18df84c.png)

Створення правил для INSERT та UPDATE:
![image](https://user-images.githubusercontent.com/79399103/206853268-72991ea0-0185-448c-be08-fa41ee508c30.png)

## Крок 7 
#### Перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE
![image](https://user-images.githubusercontent.com/79399103/206853395-71df518e-33ca-4611-860d-a04e82654336.png)


