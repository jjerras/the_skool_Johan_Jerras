SET PAGESIZE 1500

DESC system.ansokningsomgang25;

SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
GROUP BY utbildningsomrade
ORDER BY antal DESC;

SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal DESC;

SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal DESC;


EXIT