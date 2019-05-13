SELECT AVG(L.price)
FROM Listing L
WHERE L.bedrooms = 8

SELECT AVG(L.review_scores_cleanliness)
FROM Listing L, Amenities A, Has_amen H
WHERE L.lid = H.lid AND H.aid = A.aid AND A.amenities = 'TV'

SELECT DISTINCT H.hid
FROM Host H, Listing L, Calendar C
WHERE L.lid = C.lid AND L.hid = H.hid AND C.available = 't' AND C.cdate < "20190901" AND C.cdate >= "20190301"

SELECT COUNT(DISTINCT L1.lid)
FROM Listing L1, Listing L2, Host H1, Host H2
WHERE L1.hid = H1.hid AND L2.hid = H2.hid AND H1.hid < H2.hid AND H1.name = H2.name

SELECT C.cdate
FROM Calendar C, Host H, Listing L
WHERE L.hid = H.hid AND H.name = "Viajes Eco" AND L.lid = C.lid AND C.available = 't'

SELECT H.hid, H.name
FROM Host H
WHERE 1 = (SELECT COUNT(*) FROM Listing L WHERE H.hid = L.hid)


CREATE TABLE TEMP
(
	lid INT,
    price FLOAT,
    PRIMARY KEY(lid)
);

INSERT INTO TEMP
SELECT L.lid, L.price
FROM Listing L, Amenities A, Has_amen H
WHERE L.lid = H.lid AND H.aid = A.aid AND A.amenities = 'Wifi';

SELECT AVG(T1.price) - AVG(L.price) AS DIFFERENCE
FROM TEMP T1, Listing L
WHERE L.lid NOT IN (SELECT T.lid FROM TEMP T);

DROP TABLE TEMP



SELECT AVG(L1.price) - AVG(L2.price) AS BerlinMinusMadrid
FROM Listing L1, Listing L2, City C1, City C2
WHERE L1.beds = 8 AND L2.beds = 8 AND L1.ciid = C1.ciid AND L2.ciid = C2.ciid AND C1.city = "Berlin" AND C2.city = "Madrid"

SELECT H.hid, H.name
FROM Host H, Listing L, Country C
WHERE H.hid = L.hid AND L.coid = C.coid AND C.country = 'Spain'
GROUP BY H.hid
ORDER BY COUNT(*) DESC LIMIT 10

SELECT L.lid, L.name
FROM Listing L, City C, Property_type T
WHERE L.ciid = C.ciid AND C.city = "Barcelona" AND L.ptid = T.ptid AND T.property_type = 'apartment'
ORDER BY L.review_scores_rating DESC LIMIT 10
