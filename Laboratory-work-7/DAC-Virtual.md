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


INSERT into university values (5, 'Bomber', 42342);
![image](https://user-images.githubusercontent.com/56130345/205632619-5b079e42-ac2a-4435-9392-1991a4a0dfc7.png)


UPDATE university SET u_id = 0;
![image](https://user-images.githubusercontent.com/56130345/205632733-1d632845-20ec-484b-b032-eebdbc4749aa.png)

DELETE FROM university WHERE u_id = 2;
![image](https://user-images.githubusercontent.com/56130345/205632811-4688931e-42b0-46c8-92d6-e78005cdfe23.png)
