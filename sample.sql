--Films with the most actors
SELECT
  f.title, 
  COUNT(actor_id) AS count_actors
FROM
  film f 
JOIN film_actor fa USING (film_id) 
GROUP BY f.title 
ORDER BY count(actor_id) DESC 
limit 10;

--Actors in the most movies
SELECT
  a.last_name || ', ' || a.first_name,
  COUNT(film_id) AS count_films
FROM
  actor a
JOIN film_actor fa USING (actor_id)
GROUP BY a.last_name || ', ' || a.first_name
ORDER BY count(film_id) DESC
limit 10;

--Busiest rental weeks
SELECT
  EXTRACT(YEAR FROM rental_date) || ' ' || EXTRACT(WEEK FROM rental_date) AS rental_week,
  COUNT(rental_id)
FROM rental
GROUP BY rental_week
ORDER BY rental_week ASC;
