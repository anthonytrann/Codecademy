CREATE TABLE restaurant (
  id integer PRIMARY KEY,
  name VARCHAR(20),
  description VARCHAR(100),
  rating DECIMAL,
  telephone CHAR(10),
  hours VARCHAR(100)
);

CREATE TABLE address (
  id integer PRIMARY KEY,
  street_number VARCHAR(10),
  street_name VARCHAR(20),
  city VARCHAR(20),
  state VARCHAR(15),
  google_maps_link VARCHAR(50),
  restaurant_id INTEGER REFERENCES restaurant(id) UNIQUE
);

CREATE TABLE category (
  id CHAR(2) PRIMARY KEY,
  name VARCHAR(20),
  description VARCHAR(200)
);

CREATE TABLE dish (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  description VARCHAR(200),
  hot_and_spicy BOOLEAN
);

CREATE TABLE review (
  id INTEGER PRIMARY KEY,
  rating DECIMAL,
  description VARCHAR(100),
  date DATE,
  restaurant_id INTEGER REFERENCES restaurant(id)
);

CREATE TABLE categories_dishes (
  category_id CHAR(2) REFERENCES category(id),
  dish_id INTEGER REFERENCES dish(id),
  price MONEY,
  PRIMARY KEY (category_id, dish_id)
);

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage;

/* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina',
  1
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  1
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/*
 *--------------------------------------------
 Insert valus for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  'C',
  1,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'C',
  3,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  1,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  4,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  5,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  6,
  15.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  7,
  16.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  8,
  17.95
);

-- This section queries the inputted data
SELECT 
  restaurant.name AS restaurant_name,
  address.street_number AS street_number,
  address.street_name AS street_name,
  restaurant.telephone AS telephone_number
FROM
  restaurant
JOIN
  address
ON 
  restaurant.id = address.restaurant_id;

SELECT 
  MAX(rating) AS best_rating
FROM
  review;

SELECT 
  category.name AS category,
  dish.name AS dish_name,
  categories_dishes.price AS price
FROM
  dish
JOIN 
  categories_dishes
ON 
  categories_dishes.dish_id = dish.id
JOIN
  category
ON
  categories_dishes.category_id = category.id
ORDER BY
  dish_name
LIMIT 
  8;

SELECT 
  dish.name AS spicy_dish_name,
  category.name AS category,
  categories_dishes.price
FROM
  dish
JOIN 
  categories_dishes
ON 
  categories_dishes.dish_id = dish.id
JOIN
  category
ON
  categories_dishes.category_id = category.id
WHERE
  dish.hot_and_spicy IS TRUE;

SELECT 
  dish_id,
  COUNT(dish_id) AS dish_count
FROM
  categories_dishes
GROUP BY
  dish_id
HAVING 
  COUNT(dish_id)>1;

SELECT 
  dish.name AS dish_name,
  COUNT(dish_id) AS dish_count
FROM
  categories_dishes
JOIN
  dish
ON
  categories_dishes.dish_id = dish.id
GROUP BY
  dish_name
HAVING 
  COUNT(dish_id)>1;

SELECT 
  rating AS best_rating, 
  description
FROM
  review
WHERE
  rating = (
    SElECT MAX(rating)
    FROM review
  );


