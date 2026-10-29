SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- i. Antal utbildningar som innehåller ordet AI


SELECT
    utbildningsnamn,
    COUNT(*) AS antal_med_ai
FROM ansokningsomgang25
WHERE LOWER(utbildningsnamn) LIKE '% ai %'
OR LOWER(utbildningsnamn) LIKE '% -ai %'
OR LOWER(utbildningsnamn) LIKE 'ai %'
;


EXIT