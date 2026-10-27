SET PAGESIZE 1500

SELECT * FROM ansokningsomgang25

DESC system.ansokningsomgang25;

SELECT 
    utbildningsomrade,
    diarenummer COUNT(*) AS number_rows
FROM ansokningsomgang25;

-- SELECT
--     COUNT(DISTINCT utbildningsomrade) AS number_utbildningsomraden
-- FROM ansokningsomgang25;


EXIT