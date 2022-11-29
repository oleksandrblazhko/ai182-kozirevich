### Аналіз функціональних та нефункціональних вимог

| Вимоги  | Загроза порушення конфіденційності | Загроза порушення цілісності | Загроза порушення доступності |
| ------- | :--------------------------------: | :--------------------------: | :---------------------------: |
| FR1. Реєстрація користувача в системі | +       |                          +   |                           +   |
| FR2. Авторизація користувача       | +         |                         -    |                          +    |
| FR3. Редагування даних фільму адміністратором  | -         |                         +    |                          -    |
| FR4. Додавання нового фільму адміністратором    | -         |                         +    |                          -    |
| FR5. Бронювання місць на обраний фільм            | -         |                         +    |                          +    |
| FR6. Додавання даних сеансу фільму адміністратором               | +         |                         -    |                          -    |
| FR7. Редагування даних кінотеатру адміністратором          | -         |                         +    |                          -    |
| FR8. Додавання сеансу фільму адміністратором           | -         |                         +    |                          -    |
| NF1. Програмний продукт повинен бути веб-додатком | -         | -    |                          +    |
| NF2. Інтерфейс сторінок додатку повинен бути зручним та зрозумілим.| -         | -    |   -    |
| NF3. Додаток повинен працювати 24/7 | -         | -    |         -    |
| NF4. Максимальный час відповіді від сайту становить 1 секунду | -         | -    |                       -    |
| NF5. Додаток має зберігати близько 100 користувачів | +         | +    |                  +    |