Data types
-- - BOOLEAN   
      -> true false null
      -> available BOOLEAN NOT NULL VALUES(TRUE, FALSE, 't', '1', 'y', 'yes', 'no', '0');
                  
-- - Character
      -- -> 1). VARCHAR -> ma'lumotlar turi uchun n butun sonni ko'rsatmasangiz, 
         -- u TEXT ma'lumotlar turi kabi ishlaydi,
         -- va n berilgan qiymatdan qolgan joyni kesib tashlaydi.
      -- -> 2). CHAR(30) -> CHAR belgilangan uzunlikdagi belgilar turi,
         -- va n berilgan qiymatdan qolgan joyni kesib tashlamaydi.
      -- -> 3). TEXT -> VARCHAR(n) bilan bir xil. Agar n bo`lmasa. 

-- - Numeric
   -- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-integer/
   --  - integers types  
      - SMALLINT -> { storage: 2 bytes, min: -32.768, max: +32.767 }
      - INTEGER -> { storage: 4 bytes, min: -2.147.483.648, max: +2.147.483.647 }
      - BIGINT -> { storage: 8 bytes, min: -9.223.372.036.854.775.808, max: +9.223.372.036.854.775.807 }
                     
         --   https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-numeric/
         - floating-point numbers
               - float(n)
                  --  - numeric(p,s) p -> son uzunligi, s -> nuqtadan keyingi sonlar.
                                 --  qiymati -> NaN bo`lishi mumkin
    
-- - Temporal data types
      -- DATE -> faqat sanalarni saqlaydi.
               -- SELECT NOW()::date -> Hozirgi sanani ko`rish
               -- SELECT CURRENT_DATE -> Hozirgi sanani ko`rish

      -- TIME -> kunning vaqt qiymatlarini saqlaydi.
               -- SELECT CURRENT_TIME -> Hozirgi vaqtni ko`rish

      --  TIMESTAMP -> sana va vaqt qiymatlarini saqlaydi.
               -- SET timezone = 'Asia/Tashkent' -> Time zone o`rnatish
               -- SHOW TIMEZONE
               --  TIMEZOME LIST -> https://popsql.com/learn-sql/postgresql/how-to-convert-utc-to-local-time-zone-in-postgresql
                     
                       
DROP TABLE IF EXISTS users;
      CREATE TABLE users(
        id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
        username CHAR(50) UNIQUE NOT NULL,
        email VARCHAR UNIQUE NOT NULL,
        description TEXT,
        salary NUMERIC(5, 3), -- NaN bo`lishi mumkin
        age INT NOT NULL,
        birth_date DATE NOT NULL,
        start_at TIME NOT NULL DEFAULT CURRENT_TIME,
        end_at TIME NOT NULL,
        ts TIMESTAMP NOT NULL, 
        tstz TIMESTAMPTZ NOT NULL,
        courses_list JSON NOT NULL
      );

INSERT INTO users ( 
         username, 
         email, 
         description, 
         salary, 
         age, 
         birth_date, 
         end_at, 
         ts, 
         tstz,
         courses_list)
VALUES(
         'Damenic', 
         'damenic3@gmail.com', 
         'User create bo`ladi...', 
         50.56766666, 
         12, 
         '1980-01-01',
         '18:00:00', 
         '2016-06-22 19:10:25-07',
         '2016-06-22 19:10:25-07',
         '{"id": "1", "title": "Nodejs"}');

SELECT courses_list ->> 'title' AS title FROM users;

--  extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT uuid_generate_v4();


