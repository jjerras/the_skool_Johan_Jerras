SET PAGESIZE 1500

DESC system.ansokningsomgang25;

-- Andel beviljade/avslag utifrån SUN5-område inom Data/IT.

SELECT
    sokta_omgangar,
    COUNT(*) AS totalt_antal,
    ROUND(100 * SUM(CASE WHEN sokta_omgangar = '1' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_beviljad_procent,
    ROUND(100 * SUM(CASE WHEN sokta_omgangar = '2' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_beviljad_procent,
    ROUND(100 * SUM(CASE WHEN sokta_omgangar = '3' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_beviljad_procent,
    ROUND(100 * SUM(CASE WHEN sokta_omgangar = '4' THEN 1 ELSE 0 END) 
    / COUNT(*), 1) AS andel_beviljad_procent
FROM ansokningsomgang25
WHERE beslut = 'Beviljad'
GROUP BY sokta_omgangar
ORDER BY sokta_omgangar ASC;

EXIT