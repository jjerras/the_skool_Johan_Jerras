SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- a. Antal ansökningar per utbildningsområde, sorterat på flest ansökningar.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar
FROM ansokningsomgang25
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

-- b. Antal BEVILJADE ansökningar per utbildningsområde.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_beviljade
FROM ansokningsomgang25
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal_beviljade DESC;

-- c. Antal AVSLAGNA ansökningar per utbildningsområde
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_avslag
FROM ansokningsomgang25
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal_avslag DESC;

-- d. Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
WITH utbildningsnamn_ihop AS (
SELECT
    TRIM(UPPER(utbildningsnamn)) AS utbildningsnamn_fixad,
    CASE WHEN utbildningsnamn_fixad LIKE 'FRONT END DEVELOPER' THEN 'FRONTEND DEVELOPER'
    WHEN utbildningsnamn_fixad LIKE 'FRONTEND-UTVECKLARE' THEN 'FRONTEND DEVELOPER'
    WHEN utbildningsnamn_fixad LIKE 'FULLSTACKUTVECKLARE - JAVASCRIPT' THEN 'FULLSTACKUTVECKLARE JAVASCRIPT'
    WHEN utbildningsnamn_fixad LIKE 'UTVECKLARE INOM AI OCH MASKININLÄRNING' THEN 'UTVECKLARE INOM AI & MASKININLÄRNING'
    ELSE utbildningsnamn
    END AS utbildningsnamn_fixad
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
)
SELECT
    utbildningsnamn_fixad,
    COUNT(*) AS antal_beviljade
FROM utbildningsnamn_ihop
GROUP BY utbildningsnamn_fixad
ORDER BY antal_beviljade DESC;

-- d. Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
SELECT
    utbildningsnamn_norm AS utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
GROUP BY utbildningsnamn_norm
ORDER BY antal_beviljade DESC, utbildningsnamn;

-- e. Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
SELECT
    utbildningsnamn_norm AS utbildningsnamn,
    COUNT(*) AS antal_avslag
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Avslag'
GROUP BY utbildningsnamn_norm
ORDER BY antal_avslag DESC, utbildningsnamn;

-- f. 
-- Antal BEVILJADE ansökningar per utbildningsanordnare, inom Data/IT.
WITH utbildningsanordnare_ihop AS (
SELECT
    utbildningsanordnare,
    CASE WHEN utbildningsanordnare LIKE 'EC Utbildning%' THEN 'EC Utbildning AB'
    WHEN utbildningsanordnare LIKE 'IT-Högskolan%' THEN 'IT-Högskolan AB'
    ELSE utbildningsanordnare
    END AS utbildningsanordnare_fixad
FROM ansokningsomgang25
WHERE beslut = 'Beviljad' AND utbildningsomrade = 'Data/IT'
)
SELECT
    utbildningsanordnare_fixad,
    COUNT(*) AS antal_beviljade
FROM utbildningsanordnare_ihop
GROUP BY utbildningsanordnare_fixad
ORDER BY antal_beviljade DESC;

-- Antal BEVILJADE ansökningar per utbildningsnamn, inom Data/IT

WITH rensad AS (
SELECT
    TRIM(REPLACE(UPPER(utbildningsnamn), '-', ' ')) AS utbildning_namn
FROM ansokningsomgang25
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
)
SELECT
    utbildning_namn,
    COUNT(*) AS antal_beviljade
FROM rensad
GROUP BY utbildning_namn    
ORDER BY antal_beviljade DESC;

-- g. Topp 5 län efter antal beviljade ansökningar
SELECT
    lan,
    COUNT(*) AS antal_beviljade
FROM ansokningsomgang25
WHERE beslut = 'Beviljad' AND lan != 'Flera kommuner'
GROUP BY lan
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS WITH TIES;

-- h. Andel distans och andel bundna utbildningar inom respektive utbildingsområde.
-- Check:
-- SELECT DISTINCT studieform
-- FROM ansokningsomgang25;

SELECT
    utbildningsomrade,
    COUNT(*) AS totalt_antal,
    ROUND(100 * SUM(CASE WHEN studieform = 'Distans' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_distans_procent,
    ROUND(100 * SUM(CASE WHEN studieform = 'Bunden' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_bunden_procent
FROM ansokningsomgang25
GROUP BY utbildningsomrade;

-- i. Antal utbildningar som innehåller ordet AI
SELECT 
    COUNT(TRIM(utbildningsnamn)) AS utbildningar_med_ai
FROM ansokningsomgang25
WHERE REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])ai([^[:alpha:]]|$)', 'i');


EXIT