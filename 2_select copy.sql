SET PAGESIZE 1500

DESC system.ansokningsomgang25;

SELECT 
    utbildningsomrade,
    COUNT(*) AS diarienummer
FROM ansokningsomgang25
GROUP BY utbildningsomrade
ORDER BY DESC diarenummer;

-- SELECT
--     COUNT(DISTINCT utbildningsomrade) AS number_utbildningsomraden
-- FROM ansokningsomgang25;


EXIT