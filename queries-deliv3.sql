1) SELECT COUNT(L.hid) AS counts, C.city
FROM Listing L, City C
WHERE L.square_feet IS NOT NULL AND L.ciid = C.ciid
GROUP BY L.ciid
ORDER BY counts ASC

2) SELECT

3) SELECT H.hid, H.name FROM Host H, Listing L WHERE H.hid = L.hid GROUP BY H.hid ORDER BY COUNT(*) DESC

4) SELECT L.lid
FROM Listing L, Calendar Ca, Host H, City Ci, Cancellation_policy CP, Has_verif Hv, Verifications V, Property_type T
WHERE L.ciid = Ci.ciid AND Ci.city = 'Berlin' AND L.beds >= 2
    AND L.review_scores_location >= 8 AND L.cpid = CP.cpid
    AND CP.cancellation_policy = 'flexible' AND Ca.lid = L.lid AND Ca.available = 't'
    AND Ca.cdate >= "20190301" AND Ca.cdate <= "20190430"
    AND L.hid = H.hid AND Hv.hid = H.hid AND Hv.vid = V.vid AND V.verifications = 'government_id' AND L.ptid = T.ptid AND T.property_type = 'apartment'
GROUP BY L.lid
ORDER BY AVG(Ca.price) ASC LIMIT 5

5) SELECT * FROM
(
SELECT L.accommodates, L.lid, L.review_scores_rating, @num := if(@num := @num + 1, 1) as row_num
FROM Listing L
WHERE 2 <= (SELECT COUNT(*)
FROM Amenities A, Has_amen Ha
WHERE Ha.lid = L.lid AND Ha.aid = A.aid
AND (A.amenities = "Wifi" OR A.amenities = "Internet" OR A.amenities = "TV" OR A.amenities = "Free street parking"))
ORDER BY L.accommodates, L.review_scores_rating DESC
) as e
WHERE row_num <= 5

6) SELECT L.lid
FROM Listing L, Reviews R
WHERE L.lid = R.lid
GROUP BY L.hid
ORDER BY COUNT(L.lid) DESC LIMIT 3

7) SELECT N.neighbourhood,
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1),
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1 OFFSET 1),
(SELECT A.amenities FROM Listing L2, Has_amen H, Amenities A WHERE L2.nid = N.nid AND L2.lid = H.lid AND A.aid = H.aid GROUP BY H.aid ORDER BY COUNT(H.aid) DESC LIMIT 1 OFFSET 2)
FROM Neighbourhood N, Listing L, Room_type R, City C
WHERE N.nid = L.nid AND L.rtid = R.rtid AND R.room_type = "Private Room" AND C.ciid = L.ciid AND C.city = "Berlin"

8) SELECT AVG(L1.review_scores_communication) - AVG(L2.review_scores_communication)
FROM Listing L1, Listing L2, Host H1, Host H2
WHERE L1.hid = H1.hid AND L2.hid = H2.hid AND H1.hid =
(SELECT H.hid FROM Host H, Has_verif V WHERE H.hid = V.hid GROUP BY H.hid ORDER BY COUNT(*) DESC LIMIT 1) AND H2.hid =
(SELECT H.hid FROM Host H, Has_verif V WHERE H.hid = V.hid GROUP BY H.hid ORDER BY COUNT(*) ASC LIMIT 1)

9) SELECT C.ciid, C.city FROM Listing L, City C, Reviews R WHERE C.ciid = L.ciid AND L.lid = R.lid AND L.rtid IN (SELECT T.rtid FROM (SELECT L1.rtid, AVG(L1.accommodates) AS average FROM Listing L1 GROUP BY L1.rtid) T WHERE T.average > 3) GROUP BY L.lid ORDER BY COUNT(R.lid) DESC LIMIT 1

10) SELECT DISTINCT N.nid
FROM Neighbourhood N, City Ci, Listing L
WHERE (SELECT COUNT(DISTINCT N.nid)
FROM Calendar Ca, Host H
WHERE L.nid = N.nid AND L.ciid = Ci.ciid AND Ci.city = 'Madrid' AND Ca.lid = L.lid AND L.hid = H.hid AND H.since < '20170601' AND Ca.available = 'f' AND Ca.cdate >= '20190101' AND Ca.cdate <= '20191231') >= (SELECT COUNT(DISTINCT N.nid) * 50 / 100
WHERE L.nid = N.nid AND L.ciid = Ci.ciid AND Ci.city = 'Madrid')

11) SELECT DISTINCT Co.coid, Co.country
FROM Country Co, Listing L
WHERE
(SELECT COUNT(L.lid)
FROM Calendar Ca
WHERE Co.coid = L.coid AND Ca.lid = L.lid AND Ca.available = 't' AND Ca.cdate >= '20180101' AND Ca.cdate <= '20181231') >=
    (SELECT COUNT(L.lid) * 20 / 100
    WHERE Co.coid = L.coid)

12) SELECT N.nid, N.neighbourhood
FROM Neighbourhood N
WHERE
    (SELECT COUNT(N.nid)
    FROM Listing L, City C, Cancellation_policy CP
    WHERE L.nid = N.nid AND L.ciid = C.ciid AND C.city = 'Barcelona' AND L.cpid = CP.cpid AND CP.cancellation_policy = 'strict_14_with_grace_period') > (SELECT COUNT(N.nid) * 5 / 100 FROM Listing L, City C
    WHERE L.nid = N.nid AND L.ciid = C.ciid AND C.city = 'Barcelona')
