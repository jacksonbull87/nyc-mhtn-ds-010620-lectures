#Which are the 5 most reviewed businesses?

SELECT Name, Review_Count 
FROM Yelp_Business.Businesses
ORDER BY Review_Count
DESC LIMIT 5
;

#What is the highest rating recieved in your data set and how many businesses have that rating?
SELECT MAX(Rating)
FROM Yelp_Business.Businesses;

SELECT COUNT(*)
FROM Yelp_Business.Businesses
WHERE Rating = 5
;

#What percentage of businesses have a rating greater than or 4.5?
SELECT COUNT(*)
FROM Yelp_Business.Businesses
;

SELECT COUNT(*)
FROM Yelp_Business.Businesses
WHERE Rating >= 4.5;

#What percentage of businesses have a rating less than 3?
SELECT COUNT(*)
FROM Yelp_Business.Businesses
WHERE Rating < 3;

#What is the average rating of restaurants that have a price label of one dollar sign? Two dollar signs? Three dollar signs?

SELECT avg(Rating) FROM Yelp_Business.Businesses 
WHERE price = '$$$$';

#eturn the text of the reviews for the most reviewed restaurant.

SELECT b.Name, b.Rating, r.Review_Text, b.Review_Count FROM Yelp_Business.Businesses b 
JOIN Yelp_Business.Business_Reviews r
USING (Business_ID)
WHERE b.Review_Count IN (SELECT MAX(b.Review_Count) FROM Yelp_Business.Businesses b)
;

#Return the name of the business with the most recent review.
SELECT b.Name, r.Review_Text, r.Review_Date FROM Yelp_Business.Businesses b 
JOIN Yelp_Business.Business_Reviews r
USING (Business_ID)
ORDER BY Review_Date DESC LIMIT 1;

#Find the highest rated business and return text of the most recent review. If multiple business have the same rating, select the restaurant with the most reviews.

SELECT b.Name, r.Review_Text, r.Review_Date FROM Yelp_Business.Businesses b 
JOIN Yelp_Business.Business_Reviews r
USING (Business_ID) 
WHERE b.Rating IN (SELECT max(b.Rating) FROM Yelp_Business.Businesses b)
ORDER BY r.Review_Date;



