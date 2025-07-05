# 1. Get all reviews with user name and movie title
SELECT users.name, movies.title, reviews.rating, reviews.comment
FROM reviews 
JOIN users ON reviews.user_id = users.user_id
JOIN movies ON reviews.movie_id = movies.movie_id;

#2. Get movies with average rating above 4
select movies.title, avg(reviews.rating) AvgRating
from reviews
join movies on reviews.movie_id = movies.movie_id
group by movies.title
having AvgRating > 4;

#3. Count of reviews by country
select users.country, count(users.country)
from reviews
join users on reviews.user_id = users.user_id
Group by users.country;

#4. Highest rated movie
select movies.title, avg(reviews.rating)
from reviews
join movies on reviews.movie_id = movies.movie_id
group by movies.title
order by avg(reviews.rating) desc
limit 1;

#5. Latest 5 reviews
select reviews.review_date, users.name, reviews.rating, reviews.comment, movies.title
from reviews
join users on reviews.user_id = users.user_id
join movies on reviews.movie_id = movies.movie_id
order by reviews.review_date desc
limit 5;

#6. Reviews that mention "amazing"
select  users.name, movies.title, reviews.comment
from reviews
join users on reviews.user_id = users.user_id
join movies on reviews.movie_id = movies.movie_id
where reviews.comment like ('%amazing%');

#7. Number of reviews per movie
select  movies.title, count(reviews.movie_id)
from reviews
join movies on reviews.movie_id = movies.movie_id
group by movies.title;

#8. Movies reviewed by user 'Alice'
select users.name, movies.title
from reviews
join users on reviews.user_id = users.user_id
join movies on reviews.movie_id = movies.movie_id
where users.name like 'Alice';

#9. Max and min rating for each movie
select movies.title, Max(reviews.rating), Min(reviews.rating)
from reviews
join movies on reviews.movie_id = movies.movie_id
group by movies.title;

#10. Average rating by genre
select movies.genre, avg(reviews.rating)
from reviews
join movies on reviews.movie_id = movies.movie_id
group by genre;
