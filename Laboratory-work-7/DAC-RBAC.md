## Крок 1
#### Встановіть СКБД PostgreSQL
Оскільки PostgreSQL вже була встановлена, перевіримо її наявність та версію командою psql --version. Бачимо, що встановлена версія PostgreSQL 14.0.

![image](https://user-images.githubusercontent.com/79399103/206707256-0fb5ef52-be42-48da-af1e-a9fa43713b11.png)


## Крок 2
#### Створіть термінальну консоль psql через утиліту командного рядка вашої ОС та встановіть з’єднання з БД postgres від імені користувача-адміністратора postgres
Командою psql -U postgres -d postgres створено термінальну консоль. Також введено пароль користувача postgres та встановлено зʼєднання з БД.

![image](https://user-images.githubusercontent.com/79399103/206707729-81239707-3a2a-4286-981f-3f14c0f224dd.png)

## Крок 3
#### Зареєструйте нового користувача в СКБД PostgreSQL, назва якого співпадає з вашим ім'ям, наприклад ivan, і довільним паролем.

Створено користувача yaroslav з паролем random_password командою CREATE USER yaroslav WITH PASSWORD 'random_password';. Метакомандою \du переглянуто список усіх доступних користувачів.
![image](https://user-images.githubusercontent.com/79399103/206708119-1bde6692-32df-4630-a64e-290b98b96563.png)

## Крок 4
#### Створіть роль в СКБД PostgreSQL (назва співпадає з вашим прізвищем латинськими літерами) і надайте новому користувачеві можливість наслідувати цю роль.

Створено роль yaroslav.

CREATE ROLE yaroslav; GRANT yaroslav TO yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206711156-a00debb3-7f33-4e02-bd40-c91ce6de88a3.png)

## Крок 5
#### Створіть реляційну таблицю з урахуванням варіанту з таблиці 2.1 від імені користувача-адміністратора.

Create table hotel (h_id integer, name varchar, address varchar);
Метакомандою \dt переглянуто усі наявні таблиці в базі даних.
![image](https://user-images.githubusercontent.com/79399103/206711603-f726cb4f-276d-47ca-89a0-775bc12c1fce.png)

## Крок 6
#### Внесіть один рядок в таблицю, використовуючи команду insert into ..., відповідно до варіанту.

Командою Insert into university values (1, 'ONPU', 1918); введено дані у таблицю. Перевіримо, чи ввелись дані, командою SELECT * FROM university;

![image](https://user-images.githubusercontent.com/79399103/206711695-07fb2e71-1240-498b-964d-57c6c99b898c.png)

## Крок 7
#### Додатково створіть ще одну термінальну консоль psql та та встановіть з’єднання з БД postgres від імені нового користувача

Командою psql -U yaroslav -d postgres виконано зʼєднання з БД PostgreSQL.

![image](https://user-images.githubusercontent.com/79399103/206712335-2cc4c08f-6ddc-4b9c-838c-4aa3748f2faf.png)

## Крок 8
#### Від імені вашого користувача виконайте запит на отримання даних з таблиці (select * from таблиця). Запротоколюйте результат виконання команди.

Командою SELECT * FROM university; виконаємо запит на отримання даних з таблиці. Як бачимо, користувач yaroslav не має доступу до таблиці (дії у другому вікні).

![image](https://user-images.githubusercontent.com/79399103/206712556-cea4300f-465b-4a4e-bfcc-17c4e64176cb.png)

## Крок 9
#### Встановіть повноваження на читання таблиці новому користувачеві.

Командою GRANT SELECT ON hotel TO yaroslav; надамо повноваження (у першому вікні); 
![image](https://user-images.githubusercontent.com/79399103/206712776-d845001c-a49c-4f4f-b066-2296fdb87772.png)

## Крок 10
#### Повторіть крок 8.

Оскільки тепер користувач yaroslav має доступ, то командою SELECT * FROM hotel; отримаємо дані з таблиці hotel.

![image](https://user-images.githubusercontent.com/79399103/206712882-ad4abe52-33f7-444b-b2d6-1f20e70f688c.png)

## Крок 11
#### Зніміть повноваження на читання таблиці для нового користувача.

Командою REVOKE SELECT ON hotel FROM yaroslav; для користувача yaroslav знято повноваження на читання таблиці hotel (у першому вікні).

![image](https://user-images.githubusercontent.com/79399103/206713066-cd60aa1f-2a37-466a-9d66-b51cf4dc3ef3.png)


## Крок 12
#### Повторіть крок 8.

Як бачимо, в нас немає доступу до читання таблиці (у другому вікні). 

SELECT * FROM hotel;

![image](https://user-images.githubusercontent.com/79399103/206713160-b807b14a-008e-429a-bc26-c1b264bb13cb.png)

## Крок 13
#### Створіть команду оновлення даних таблиці (UPDATE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Спробуємо оновити дані в таблиці командою UPDATE hotel SET name = 'new name';. Як бачимо, прав на оновлення у користувача yaroslav немає (друге вікно).

![image](https://user-images.githubusercontent.com/79399103/206713346-cc52e177-a2c5-483e-89a7-9472047dd83b.png)

## Крок 14
#### Встановіть повноваження на оновлення таблиці новому користувачеві.

Командою GRANT UPDATE ON hotel TO yaroslav; для користувача yaroslav надано повноваження на оновлення таблиці hotel (перше вікно).

![image](https://user-images.githubusercontent.com/79399103/206713504-397e70cf-9e78-4710-9da2-027f2d4b5a88.png)

## Крок 15
#### Повторіть крок 13.

UPDATE hotel SET name = 'new name'; (друге вікно)

![image](https://user-images.githubusercontent.com/79399103/206713616-66d570a9-604e-4d75-bee9-3e2f856c4d37.png)

## Крок 16
#### Створіть команду видалення запису таблиці (DELETE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Повноваження для видалення даних з таблиці відсутні.

DELETE FROM hotel WHERE name = 'new name'; (друге вікно)

![image](https://user-images.githubusercontent.com/79399103/206713792-b170fc06-5612-478c-ad6d-0a6c6ed65fb4.png)

## Крок 17
#### Встановіть повноваження на видалення таблиці новому користувачеві.

GRANT DELETE ON hotel TO yaroslav; (перше вікно)

![image](https://user-images.githubusercontent.com/79399103/206713927-6d3ad6a7-3cdb-4af5-b012-e769b66149d6.png)

## Крок 18
#### Повторіть крок 16.

DELETE FROM hotel WHERE name = 'new name'; (друге вікно)
![image](https://user-images.githubusercontent.com/79399103/206717006-a9c25648-c393-461a-91d5-a95c23918362.png)

## Крок 19
#### Зніміть всі повноваження з таблиці для нового користувача.

REVOKE ALL ON hotel FROM yaroslav;

![image](https://user-images.githubusercontent.com/79399103/206717131-a4ec7cd5-af76-4403-891e-8da79fef8e57.png)

## Крок 20
#### Створіть команду внесення запису в таблицю (INSERT) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Повноваження для додавання даних у таблицю відсутні.

![image](https://user-images.githubusercontent.com/79399103/206717467-827f7d30-e89a-4e52-bf8c-ed35a7c50bb2.png)

## Крок 21
#### Встановіть повноваження на внесення даних до таблиці для ролі.

GRANT INSERT ON hotel TO yaroslav; (перше вікно)

![image](https://user-images.githubusercontent.com/79399103/206717543-b8e6d794-2aab-49b5-9f4d-9bbea4696d2f.png)

## Крок 22
#### Повторіть крок 20.

![image](https://user-images.githubusercontent.com/79399103/206717645-8d581e98-566e-4077-8f6a-e77f619b98ac.png)


