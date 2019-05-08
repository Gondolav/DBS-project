SELECT COUNT(L.hid) AS counts, C.city
FROM Listing L, City C
WHERE L.square_feet IS NOT NULL AND L.ciid = C.ciid
GROUP BY L.ciid
ORDER BY counts ASC

SELECT 

SELECT H.hid, H.name
FROM Host H, Listing L
GROUP BY L.hid
HAVING H.hid = L.hid
ORDER BY COUNT(*) DESC

SELECT L.lid
FROM Listing L, Calendar Ca, Host H, City Ci, Cancellation_policy CP, Has_verif Hv, Verifications V
WHERE L.ciid = Ci.ciid AND Ci.city = 'Berlin' AND L.beds >= 2
    AND L.review_scores_location >= 8 AND L.cpid = CP.cpid
    AND CP.cpid = 'flexible' AND Ca.lid = L.lid AND Ca.available = 't'
    AND Ca.cdate <= "20190301" AND Ca.cdate >= "20190430"
    AND L.hid = H.hid AND Hv.hid = H.hid AND Hv.vid = V.vid AND V.vid = 'government_id'
ORDER BY AVG(C.price) ASC LIMIT 5)

7) SELECT L.lid
FROM Listing L, City C, Room_type R
WHERE L.rtid = R.rtid AND R.room_type = "Private Room" AND C.ciid = L.ciid AND C.city = "Berlin"
GROUP BY L.nid
