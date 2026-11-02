SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- 1.
-- Lista beviljade utbildningar utanför utbildningsområdet 'Data/IT' som innehåller "Data/IT relaterade" ord
-- listade efter utbildningsområde.
SELECT
    utbildningsomrade,
    utbildningsnamn,
    beslut
FROM ansokningsomgang25
WHERE (REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])(ai|it|digital|digitalt)([^[:alpha:]]|$)', 'i')
OR REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])(data|nätverk|programmering|databas)', 'i'))
AND beslut = 'Beviljad' AND utbildningsomrade != 'Data/IT'
ORDER BY utbildningsomrade, utbildningsnamn, beslut;
-- 2.
-- Lista avslagna utbildningar utanför utbildningsområdet 'Data/IT' som innehåller "Data/IT relaterade" ord
-- listade efter utbildningsområde.

SELECT
    utbildningsomrade,
    utbildningsnamn,
    beslut
FROM ansokningsomgang25
WHERE (REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])(ai|it|digital|digitalt)([^[:alpha:]]|$)', 'i') -- Fristående ord, t.ex. "AI" eller "IT"
OR REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])(data|nätverk|programmering|databas)', 'i')) -- Prefix
AND beslut = 'Avslag' AND utbildningsomrade != 'Data/IT'
ORDER BY utbildningsomrade, utbildningsnamn, beslut;

-- 3.
-- Andel beviljade/avslag utifrån SUN5-område inom Data/IT.
SELECT
    sun5_inriktning_namn,
    COUNT(*) AS totalt_antal,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_beviljad_procent,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_avslag_procent
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT'
GROUP BY sun5_inriktning_namn
ORDER BY andel_beviljad_procent DESC;

-- 4.
-- Andel beviljade utbildningar i procent utifrån antal sökta omgångar.
SELECT 
    sokta_omgangar,
    COUNT(*) AS totalt_beslut,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_avslag
FROM ansokningsomgang25
GROUP BY sokta_omgangar
ORDER BY sokta_omgangar;

-- 5.
-- Andel beviljade utbildningar  i procent utifrån antal sökta omgångar, inom "Data/IT".
SELECT 
    sokta_omgangar,
    COUNT(*) AS totalt_beslut,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_avslag
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT'
GROUP BY sokta_omgangar
ORDER BY sokta_omgangar;

-- 6.
-- Andel beviljade utbildningar i procent utifrån län.
SELECT
    lan,
    COUNT(*) AS totalt_beslut,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_avslag
FROM ansokningsomgang25
GROUP BY lan
ORDER BY andel_beviljade DESC;


EXIT