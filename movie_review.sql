

--drop table
drop table public.movie_reviews


--create table statement
CREATE TABLE public.movie_reviews
(
    user_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    movie character varying(50) COLLATE pg_catalog."default" NOT NULL,
    star_rating character varying(5) COLLATE pg_catalog."default",
    review character varying(250) COLLATE pg_catalog."default",
    review_date date NOT NULL
)

--Statement to import data into DB table
COPY public.movie_reviews FROM 'C:\Users\Public\Downloads\MovieReviews.txt';
	
--select statement to view records
select * from assignments.public.movie_reviews;

--Calculate average star rating
select a.movie, round(sum(cast(a.star_rating as numeric))/count(a.movie), 1) as star_rating
from (select movie, case when star_rating = '' Then '0' else star_rating end as star_rating
from assignments.public.movie_reviews) a
group by a.movie;

