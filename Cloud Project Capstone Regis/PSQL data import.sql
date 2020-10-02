-----Alla Topp-----
-----Creating table business and importing business.csv

DROP TABLE business;

CREATE TABLE business (
    id SERIAL PRIMARY KEY,
    business_id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(5),
    postal_code VARCHAR(50),
    latitude FLOAT,
    longitude FLOAT,
    stars FLOAT,
    review_count INT, 
    is_open BOOLEAN, 
    attributes TEXT,
    categories TEXT,
    hours VARCHAR(255)
);

COPY business (address,attributes,business_id,categories, 
    city,hours,is_open,latitude,longitude,name,postal_code, 
    review_count,stars,state)
FROM '/home/allatopp/Downloads/business.csv' DELIMITER ',' CSV HEADER encoding 'UTF8';





-----Creating table checkin and importing checkin.csv

DROP TABLE checkin;

CREATE TABLE checkin (
    business_id VARCHAR(100) NOT NULL,
    date TEXT,
    PRIMARY KEY (business_id)
);

COPY checkin (business_id, date)
FROM '/home/allatopp/Downloads/checkin.csv' DELIMITER ',' CSV HEADER encoding 'UTF8';





-----Creating table tip and importing tip.csv-----

DROP TABLE tip;

CREATE TABLE tip (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    business_id VARCHAR(100) NOT NULL,
    text VARCHAR(2000),
    date DATE,
    compliment_count INT
);

COPY tip (user_id, business_id, text, date, compliment_count)
FROM '/home/allatopp/Downloads/tip.csv' DELIMITER ',' CSV HEADER encoding 'UTF8';





-----Creating table y_user and importing user1.csv

DROP TABLE y_user;

CREATE TABLE y_user (
    user_id VARCHAR(100) NOT NULL,
    user_name VARCHAR(50),
    review_count INT,
    yelping_since TIME,
    useful INT,
    funny INT,
    cool INT,
    elite VARCHAR(255),
    friends TEXT,
    fans INT,
    average_stars FLOAT,
    compliment_hot INT,
    compliment_more INT,
    compliment_profile INT,
    compliment_cute INT,
    compliment_list INT,
    compliment_note INT,
    compliment_plain INT,
    compliment_cool INT,
    compliment_funny INT,
    compliment_writer INT,
    compliment_photos INT,
    PRIMARY KEY (user_id)
);

COPY y_user (user_id, user_name, review_count, yelping_since, useful, funny,
cool, elite, friends, fans, average_stars, compliment_hot, compliment_more,
compliment_profile, compliment_cute, compliment_list, compliment_note, 
compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos)
FROM '/home/allatopp/Downloads/user.csv' DELIMITER ',' CSV HEADER encoding 'UTF8';






-----Creating table review and importing review.csv

DROP TABLE review;

CREATE TABLE review (
    review_id VARCHAR(100) NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    business_id VARCHAR(100) NOT NULL,
    stars FLOAT,
    useful FLOAT,
    funny FLOAT,
    cool FLOAT,
    text TEXT,
    date DATE,
    PRIMARY KEY (review_id)
);

COPY review(review_id, user_id, business_id, stars, useful, funny, cool, text, date)
FROM '/home/allatopp/Desktop/review1.csv' DELIMITER ',' CSV HEADER encoding 'UTF8';
