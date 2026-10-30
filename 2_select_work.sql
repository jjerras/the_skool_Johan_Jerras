    SET PAGESIZE 1500

    DESC system.ansokningsomgang25;

SELECT 'Totalt anatal ansökningar inom "Data/IT".';
SELECT
    COUNT(*) AS antal_ansokningar
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT'
ORDER BY antal_ansokningar;
-- Andel beviljade utbildningar utifrån antal sökta omgångar i procent.
SELECT 
    sokta_omgangar,
    COUNT(*) AS totalt_beslut,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_avslag
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT'
GROUP BY sokta_omgangar
ORDER BY sokta_omgangar;

SELECT
    lan,
    COUNT(*) AS totalt_beslut,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_avslag
FROM ansokningsomgang25
GROUP BY lan
ORDER BY andel_beviljade DESC;

EXIT        