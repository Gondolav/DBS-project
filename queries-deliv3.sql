SELECT COUNT(DISTINCT L.hid)
FROM Listing L
GROUP BY L.ciid
HAVING L.square_feet = NULL
ORDER BY L.ciid ASC

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
