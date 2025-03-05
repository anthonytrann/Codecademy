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
  id INTEGER PRIMARY KEY,
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
  category_id INTEGER REFERENCES category(id),
  dish_id INTEGER REFERENCES dish(id),
  PRIMARY KEY (category_id, dish_id)
);

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage;
