SELECT COUNT(L.hid) AS counts, C.city
FROM Listing L, City C
WHERE L.square_feet IS NOT NULL AND L.ciid = C.ciid
GROUP BY L.ciid
ORDER BY counts ASC

SELECT 

SELECT H.hid, H.name FROM Host H, Listing L WHERE H.hid = L.hid GROUP BY H.hid ORDER BY COUNT(*) DESC

SELECT L.lid
FROM Listing L, Calendar Ca, Host H, City Ci, Cancellation_policy CP, Has_verif Hv, Verifications V
WHERE L.ciid = Ci.ciid AND Ci.city = 'Berlin' AND L.beds >= 2
    AND L.review_scores_location >= 8 AND L.cpid = CP.cpid
    AND CP.cancellation_policy = 'flexible' AND Ca.lid = L.lid AND Ca.available = 't'
    AND Ca.cdate >= "20190301" AND Ca.cdate <= "20190430"
    AND L.hid = H.hid AND Hv.hid = H.hid AND Hv.vid = V.vid AND V.verifications = 'government_id'
GROUP BY L.lid
ORDER BY AVG(Ca.price) ASC LIMIT 5

SELECT L.lid
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
