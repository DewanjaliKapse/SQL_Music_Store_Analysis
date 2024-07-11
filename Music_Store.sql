use  music_database

1. Who is the senior most employee based on job title?
select * from employee
order by levels desc limit 1

2. Which countries have the most Invoices?

select count(*) as Most_Invoices, billing_country from invoice
group by billing_country
order by Most_Invoices desc

3. What are top 3 values of total invoice?

select total from invoice
order by total desc limit 3

4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals

select sum(total) as Invoice_Total, billing_city from invoice
group by billing_city
order by Invoice_Total desc

5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money

select c.customer_id, sum(total) as Total,c.first_name, c. last_name
from customer as c
join invoice as i
on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c. last_name
order by Total desc
limit 1

----------------------------------------------------------------------------------------------------
1. Write query to return the email, first name, last name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A

select distinct  email, first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
SELECT Track.track_id
FROM Track
JOIN Genre ON Track.genre_id = Genre.genre_id
where Genre.name like "Rock")
order by email;

2. Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs 
from track
join album2 on album2.album_id = track.album_id
join artist on artist.artist_id = album2.artist_id
JOIN Genre ON Genre.genre_id =Track.genre_id 
where Genre.name like "Rock"
group by artist.artist_id, artist.name
order by number_of_songs desc
limit 10;

3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first

select name, milliseconds
from track
where milliseconds>
(
select avg(milliseconds) as avg_length 
from track
)
order by milliseconds desc









