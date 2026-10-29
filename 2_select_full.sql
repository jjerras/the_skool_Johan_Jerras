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
SELECT
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokningsomgang25
WHERE beslut = 'Beviljad' AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_beviljade DESC;

-- e.
SELECT
    utbildningsnamn,
    COUNT(*) AS antal_avslag
FROM ansokningsomgang25
WHERE beslut = 'Avslag' AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_avslag ASC;

-- f.
SELECT
    utbildningsanordnare,
    COUNT(*) AS antal_bevilijade
FROM ansokningsomgang25
WHERE beslut = 'Bevilijad' AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsanordnare
ORDER BY antal_bevilijade DESC;

-- g.
SELECT
    lan,
    COUNT(*) AS antal_bevilijade
FROM ansokningsomgang25
WHERE beslut = 'Bevilijad' AND lan != 'Flera kommuner'
GROUP BY lan
ORDER BY antal_bevilijade DESC;

-- h. Andel distans och andel bundna utbildningar inom respektive utbildingsområde

SELECT DISTINCT studieform
FROM ansokningsomgang25;

SELECT
    utbildningsomrade,
    COUNT(*) AS totalt_antal  
FROM ansokningsomgang25
GROUP BY utbildningsomrade;

SELECT
    utbildningsomrade,
    COUNT(*) AS totalt_antal,
    ROUND(100 * SUM(CASE WHEN studieform = 'Distans' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_distans_procent,
    ROUND(100 * SUM(CASE WHEN studieform = 'Bunden' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_bunden_procent
FROM ansokningsomgang25
GROUP BY utbildningsomrade;




EXIT