SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- i. Antal utbildningar som innehåller ordet AI


SELECT DISTINCT 
    utbildningsnamn
FROM ansokningsomgang25
WHERE LOWER(utbildningsnamn) LIKE '% ai %'
OR LOWER(utbildningsnamn) LIKE '% ai'
OR LOWER(utbildningsnamn) LIKE 'ai %'
OR LOWER(utbildningsnamn) LIKE '% ai-%'
OR LOWER(utbildningsnamn) LIKE '%-ai%'
OR LOWER(utbildningsnamn) LIKE '% ai/%'
ORDER BY utbildningsnamn;

SELECT DISTINCT utbildningsnamn
FROM ansokningsomgang25
WHERE LOWER(utbildningsnamn) LIKE '%ai%'
ORDER BY utbildningsnamn;

EXIT