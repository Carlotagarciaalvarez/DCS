ALTER TABLE vgamesales 
DROP COLUMN `JP_Sales`,
DROP COLUMN `Name`;

DELETE FROM vgamesales
WHERE Platform NOT IN (
    SELECT Platform
    FROM (
        SELECT Platform, COUNT(*) AS Platform_Count
        FROM vgamesales
        GROUP BY Platform
        ORDER BY Platform_Count DESC
        LIMIT 10
    ) AS TopPlatforms
);

ALTER TABLE vgamesales
MODIFY COLUMN NA_Sales DECIMAL(5, 2),
MODIFY COLUMN EU_Sales DECIMAL(5, 2),
MODIFY COLUMN Global_Sales DECIMAL(5, 2),
MODIFY COLUMN Other_Sales DECIMAL(5, 2);



select * from vgamesales


