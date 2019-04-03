SELECT AVG(L.price)
FROM Listing L
WHERE L.bedrooms = 8

SELECT AVG(L.review_scores_cleanliness)
FROM Listing L
WHERE L.amenities LIKE '%TV%'

SELECT H.url
FROM Host H, Listing L, Calendar C
WHERE L.lid = C.lid AND L.hid = H.hid AND C.available = 't' AND C.cdate < "20190901" AND C.cdate >= "20190301"

SELECT COUNT(*)
FROM Listing L, Host H1, Host H2
WHERE (L.hid = H1.hid OR L.hid = H2.hid) AND H1.hid != H2.hid AND H1.name = H2.name

SELECT C.cdate
FROM Calendar C, Host H, Listing L
WHERE L.hid = H.hid AND H.name = "Viajes Eco" AND L.lid = C.lid AND C.available = 't'

SELECT H.hid, H.name
FROM Host H
WHERE 1 = (SELECT COUNT(*) FROM Listing L WHERE H.hid = L.hid)

SELECT AVG(L1.price) - AVG(L2.price) AS Difference
FROM Listing L1, Listing L2
WHERE L1.amenities LIKE '%Wifi%' AND L2.amenities NOT LIKE '%Wifi%'

SELECT AVG(L1.price) - AVG(L2.price) AS BerlinMinusMadrid
FROM Listing L1, Listing L2
WHERE L1.beds = 8 AND L2.beds = 8 AND L1.city = "Berlin" AND L2.city = "Madrid"

SELECT H.hid, H.name
FROM Host H, Listing L
GROUP BY H.hid
HAVING H.hid = L.hid AND L.country_code = "ES"
ORDER BY COUNT(*) DESC LIMIT 10

SELECT L.lid, L.name
FROM Listing L
WHERE L.city = "Barcelona"
ORDER BY L.review_scores_rating DESC LIMIT 10
