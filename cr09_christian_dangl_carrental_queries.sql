--how many customers does the company have?

SELECT COUNT(*)
FROM customers;


--how often has a "Mercedes" been rented?

SELECT COUNT(*)
FROM reservations
INNER JOIN cars ON reservations.fk_car_id = cars.car_id
INNER JOIN models ON cars.fk_model_id = models.model_id
INNER JOIN makes ON models.fk_make_id = makes.make_id
WHERE makes.make = "Mercedes";


--who has rented a premium ("P") car?

SELECT first_name, last_name
FROM customers
INNER JOIN reservations ON customers.customer_id = reservations.fk_customer_id
INNER JOIN cars ON reservations.fk_car_id = cars.car_id
INNER JOIN models ON cars.fk_model_id = models.model_id
INNER JOIN categories ON models.fk_category_id = categories.category_id
WHERE categories.name = "P"
GROUP BY customers.customer_id;


--how many reservations hat additional charges?

SELECT COUNT(*)
FROM reservations
INNER JOIN additional_charges ON reservations.fk_additional_charge_id = additional_charges.additional_charge_id
WHERE additional_charges.price > 0;


--how many reservations hat different start/end locations and who are the customers?

SELECT COUNT(*)
FROM reservations
WHERE fk_location_start <> fk_location_end;

SELECT customers.first_name, customers.last_name
FROM customers
INNER JOIN reservations ON customers.customer_id = reservations.fk_customer_id
WHERE fk_location_start <> fk_location_end
GROUP BY customers.customer_id;


