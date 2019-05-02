SELECT AVG(L.price)
FROM Listing L
WHERE L.bedrooms = 8

SELECT AVG(L.review_scores_cleanliness)
FROM Listing L, Amenities A, Has_amen H
WHERE L.lid = H.lid AND H.aid = A.aid AND A.amenities = 'TV'

SELECT DISTINCT H.hid
FROM Host H, Listing L, Calendar C
WHERE L.lid = C.lid AND L.hid = H.hid AND C.available = 't' AND C.cdate < "20190901" AND C.cdate >= "20190301"

SELECT COUNT(DISTINCT H1.hid)
FROM Listing L1, Listing L2, Host H1, Host H2
WHERE L1.hid = H1.hid AND L2.hid = H2.hid AND H1.hid < H2.hid AND H1.name = H2.name

SELECT C.cdate
FROM Calendar C, Host H, Listing L
WHERE L.hid = H.hid AND H.name = "Viajes Eco" AND L.lid = C.lid AND C.available = 't'

SELECT H.hid, H.name
FROM Host H
WHERE 1 = (SELECT COUNT(*) FROM Listing L WHERE H.hid = L.hid)

SELECT AVG(L1.price) - AVG(L2.price) AS Difference
FROM Listing L1, Listing L2, Amenities A1, Has_amen H1
WHERE L1.lid = H1.lid AND H1.aid = A1.aid AND A1.amenities = 'Wifi' AND L2.lid NOT IN
(SELECT L.lid FROM Listing L, Amenities A, Has_amen H WHERE L.lid = H.lid AND H.aid = A.aid AND A.amenities = 'Wifi')


SELECT AVG(L1.price) - AVG(L2.price) AS BerlinMinusMadrid
FROM Listing L1, Listing L2, City C1, City C2
WHERE L1.beds = 8 AND L2.beds = 8 AND L1.ciid = C1.ciid AND L2.ciid = C2.ciid AND C1.city = "Berlin" AND C2.city = "Madrid"

SELECT H.hid, H.name
FROM Host H, Listing L, Country C
WHERE H.hid = L.hid AND L.coid = C.coid AND C.country = 'Spain'
GROUP BY H.hid
ORDER BY COUNT(*) DESC LIMIT 10

SELECT L.lid, L.name
FROM Listing L, City C
WHERE L.ciid = C.ciid AND C.city = "Barcelona"
ORDER BY L.review_scores_rating DESC LIMIT 10
