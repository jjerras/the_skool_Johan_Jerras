SET PAGESIZE 1000

DESC system.ansokningsomgang25;

SELECT COUNT(*) AS number_rows
FROM ansokningsomgang25;

SELECT
    COUNT(DISTINCT utbildningsområde) AS number_utbildningsomraden
FROM ansokningsomgang25;


EXIT