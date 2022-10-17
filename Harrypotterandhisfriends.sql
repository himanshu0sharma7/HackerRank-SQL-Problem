--Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

--Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
--Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
--If more than one wand has the same power, sort the result in order of descending age.


SELECT aa.id, bb.age , aa.coins_needed , aa.power
      FROM WANDS AS aa
JOIN Wands_Property AS bb 
      On aa.Code = bb.Code
JOIN (SELECT B.age AS AG, Min(A.Coins_needed) AS MCN, A.power AS PW
      FROM Wands AS A
JOIN Wands_Property AS B 
      ON A.code = B.code
WHERE is_evil = 0
GROUP BY PW, AG) AS Q 
      ON bb.age = AG AND aa.coins_needed = MCN AND aa.power = PW
ORDER BY aa.power DESC, bb.age DESC

