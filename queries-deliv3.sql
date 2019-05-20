1) SELECT COUNT(L.hid) AS counts, C.city
FROM Listing L, City C, Neighbourhood N
WHERE L.square_feet IS NOT NULL AND L.nid = N.nid AND N.ciid = C.ciid
GROUP BY N.ciid
ORDER BY counts ASC

2) median position for each neighbourhood = SELECT FLOOR(COUNT(T.review_scores_rating) / 2)
FROM (SELECT N.nid, N.neighbourhood, L.review_scores_rating
	FROM Neighbourhood N, City C, Listing L
	WHERE L.ciid = C.ciid AND C.city = 'Madrid' AND L.nid = N.nid
	ORDER BY N.nid, L.review_scores_rating) T
GROUP BY T.nid

3) SELECT H.hid, H.name
FROM Host H, Listing L
WHERE H.hid = L.hid
GROUP BY H.hid
ORDER BY COUNT(*) DESC

4) SELECT L.lid
FROM Listing L, Calendar Ca, Host H, City Ci, Cancellation_policy CP, Has_verif Hv, Verifications V, Property_type T, Neighbourhood N
WHERE L.nid = N.nid AND N.ciid = Ci.ciid AND Ci.city = 'Berlin' AND L.beds >= 2
    AND L.review_scores_location >= 8 AND L.cpid = CP.cpid
    AND CP.cancellation_policy = 'flexible' AND Ca.lid = L.lid AND Ca.available = 't'
    AND Ca.cdate >= "20190301" AND Ca.cdate <= "20190430"
    AND L.hid = H.hid AND Hv.hid = H.hid AND Hv.vid = V.vid AND V.verifications = 'government_id' AND L.ptid = T.ptid AND T.property_type = 'apartment'
GROUP BY L.lid
ORDER BY AVG(Ca.price) ASC LIMIT 5

5) (SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 1 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 2 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 3 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 4 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 5 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 6 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 7 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 8 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 9 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 10 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 11 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 12 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 13 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 14 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 15 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)
UNION ALL
(SELECT L.accommodates, L.lid, L.review_scores_rating
FROM Listing L
WHERE L.accommodates = 16 AND 2 <= (SELECT COUNT(A.aid)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates DESC, L.review_scores_rating DESC, L.lid ASC LIMIT 5)

6) SELECT L.lid
FROM Listing L, Reviews R
WHERE L.lid = R.lid
GROUP BY L.lid, L.hid
ORDER BY COUNT(L.lid) DESC LIMIT 3

7) SELECT DISTINCT N.neighbourhood,
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1) AS Amenity1,
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1 OFFSET 1) AS Amenity2,
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1 OFFSET 2) AS Amenity3
FROM Neighbourhood N, Listing L, Room_type R, City C
WHERE N.nid = L.nid AND L.rtid = R.rtid AND R.room_type = "Private Room" AND C.ciid = N.ciid AND C.city = "Berlin"

8) SELECT AVG(L1.review_scores_communication) - AVG(L2.review_scores_communication)
FROM Listing L1, Listing L2, Host H1, Host H2
WHERE L1.hid = H1.hid AND L2.hid = H2.hid AND H1.hid =
(SELECT H.hid FROM Host H, Has_verif V WHERE H.hid = V.hid GROUP BY H.hid ORDER BY COUNT(*) DESC LIMIT 1) AND H2.hid =
(SELECT H.hid FROM Host H, Has_verif V WHERE H.hid = V.hid GROUP BY H.hid ORDER BY COUNT(*) ASC LIMIT 1)

9) SELECT C.city
FROM Listing L, City C, Reviews R, Neighbourhood N
WHERE L.nid = N.nid AND C.ciid = N.ciid AND L.lid = R.lid AND L.rtid IN
(SELECT T.rtid FROM (SELECT L1.rtid, AVG(L1.accommodates) AS average FROM Listing L1 GROUP BY L1.rtid) T WHERE T.average > 3)
GROUP BY L.lid
ORDER BY COUNT(R.lid) DESC LIMIT 1


10) SELECT DISTINCT N.nid, N.neighbourhood
FROM Neighbourhood N, City Ci
WHERE N.ciid = Ci.ciid AND Ci.city = 'Madrid' AND
(SELECT COUNT(DISTINCT L.lid)
FROM Calendar Ca, Host H, Listing L
WHERE L.nid = N.nid AND Ca.lid = L.lid AND L.hid = H.hid AND H.since < '20170601' AND Ca.available = 'f' AND Ca.cdate >= '20190101' AND Ca.cdate <= '20191231') >=
(SELECT COUNT(DISTINCT L.lid) * 0.5
FROM City Ci, Listing L
WHERE L.nid = N.nid)

11) SELECT DISTINCT Co.coid, Co.country
FROM Country Co, Listing L, Neighbourhood N, City C
WHERE
(SELECT COUNT(L.lid)
FROM Calendar Ca
WHERE L.nid = N.nid AND N.ciid = C.ciid AND Co.coid = C.coid AND Ca.lid = L.lid AND Ca.available = 't' AND Ca.cdate >= '20180101' AND Ca.cdate <= '20181231') >=
    (SELECT COUNT(L.lid) * 20 / 100
    WHERE L.nid = N.nid AND N.ciid = C.ciid AND Co.coid = C.coid)

12) SELECT N.nid, N.neighbourhood
FROM Neighbourhood N
WHERE
    (SELECT COUNT(N.nid)
    FROM Listing L, City C, Cancellation_policy CP
    WHERE L.nid = N.nid AND N.ciid = C.ciid AND C.city = 'Barcelona' AND L.cpid = CP.cpid AND CP.cancellation_policy = 'strict_14_with_grace_period') > (SELECT COUNT(N.nid) * 5 / 100 FROM Listing L, City C
    WHERE L.nid = N.nid AND N.ciid = C.ciid AND C.city = 'Barcelona')
