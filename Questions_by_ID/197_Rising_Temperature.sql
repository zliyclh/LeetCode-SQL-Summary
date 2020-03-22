-- Solution: Join
SELECT w2.id
FROM weather w1
JOIN weather w2
    ON DATEADD(day,1,w1.recorddate) = w2.recorddate
WHERE w1.temperature < w2.temperature



-- Solution: Window Function, Subquery
SELECT id
FROM (
    SELECT *, LAG(temperature) OVER (ORDER BY recorddate) AS prev_temp,
        LAG(recorddate) OVER (ORDER BY recorddate) prev_date
    FROM weather
    ) tb1
WHERE DATEADD(day,1,prev_date) = recorddate AND prev_temp < temperature
