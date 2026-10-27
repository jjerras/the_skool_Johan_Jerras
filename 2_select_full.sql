SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- a.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
GROUP BY utbildningsomrade
ORDER BY antal DESC;

-- b.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal DESC;

-- c.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal
FROM ansokningsomgang25
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal DESC;

-- d.


EXIT