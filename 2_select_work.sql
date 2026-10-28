SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- h. Andel distans och andel bundna utbildningar inom respektive utbildingsområde

SELECT DISTINCT studieform
FROM ansokningsomgang25;

SELECT
    utbildningsomrade,
    COUNT(*) AS totalt_antal  
FROM ansokningsomgang25
GROUP BY utbildningsomrade;

SELECT
    utbildningsomrade,
    COUNT(*) AS totalt_antal,
    SUM(CASE WHEN studieform = 'Distans' THEN 1 ELSE 0 END) AS Distans
FROM ansokningsomgang25
GROUP BY utbildningsomrade;


EXIT