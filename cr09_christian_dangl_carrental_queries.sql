how many customers does the company have?

SELECT COUNT(*)
FROM customers;


how often has a "Mercedes" been rented?

SELECT COUNT(*)
FROM reservations
INNER JOIN cars ON reservations.fk_car_id = cars.car_id
INNER JOIN models ON cars.fk_model_id = models.model_id
INNER JOIN makes ON models.fk_make_id = makes.make_id
WHERE makes.make = "Mercedes";


who has rented a premium ("P") car?

SELECT first_name, last_name
FROM customers
INNER JOIN reservations ON customers.customer_id = reservations.fk_customer_id
INNER JOIN cars ON reservations.fk_car_id = cars.car_id
INNER JOIN models ON cars.fk_model_id = models.model_id
INNER JOIN categories ON models.fk_category_id = categories.category_id
WHERE categories.name = "P"
GROUP BY customers.customer_id;

