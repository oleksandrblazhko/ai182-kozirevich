## Крок 1
#### Заповніть таблицю БД ще трьома рядками.
![image](https://user-images.githubusercontent.com/79399103/206718785-24de84d8-335a-4fab-a707-828db6bfa0b6.png)

## Крок 2
#### Створіть схему даних користувача та віртуальну таблицю у цій схемі з правилами вибіркового керування доступом для користувача так, щоб він міг побачити тільки один з рядків таблиці з урахуванням одного значення її останньої колонки.

![image](https://user-images.githubusercontent.com/79399103/206720956-6a1c363c-7ea3-4739-878a-f520c56967b7.png)

GRANT SELECT ON hotel TO yaroslav;
CREATE TABLE ROLE2HOTEL (
ROLE_NAME VARCHAR(30),
name VARCHAR(30)
);
GRANT SELECT ON ROLE2HOTEL TO yaroslav;
INSERT INTO ROLE2HOTEL VALUES ('yaroslav', 'rand_name);
CREATE SCHEMA yaroslav;
ALTER SCHEMA yaroslav OWNER TO yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206721281-39a7dc82-a4a1-4c28-8e5d-1eb1f8cade06.png)

create or replace view yaroslav.hotel as select S.* from  PUBLIC.hotel S, ROLE2HOTEL HTL where HTL.ROLE_NAME=current_user and HTL.name = s.name;
GRANT SELECT ON yaroslav.hotel TO yaroslav;
REVOKE SELECT ON PUBLIC.hotel FROM yaroslav;

## Крок 3
#### Перевірте роботу механізму вибіркового керування, виконавши операції SELECT, INSERT, UPDATE, DELETE.

SELECT * FROM yaroslav.hotel;

![image](https://user-images.githubusercontent.com/79399103/206747754-13ee4803-fc64-4efb-b53a-b07ab6eba085.png)


insert into hotel values (9, 'name 11', 'address 11');
![image](https://user-images.githubusercontent.com/79399103/206851967-d734746d-5117-47d3-8aa8-54be0d269020.png)


UPDATE hotel SET name = 'new name';
![image](https://user-images.githubusercontent.com/79399103/206851986-a74c9e48-92e1-4cff-841a-a184bf027136.png)

DELETE FROM hotel WHERE h_id = 1;
![image](https://user-images.githubusercontent.com/79399103/206852011-b05b4b9c-512f-4e4c-8a61-82640e6213c1.png)
