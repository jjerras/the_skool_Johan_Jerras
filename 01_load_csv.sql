LOAD ansokningsomgang25 ansokningsomgang25.csv

SELECT 'utbildningsnamn' AS kolumn, COUNT(*) AS antal_problem
FROM ansokningsomgang25
WHERE utbildningsnamn <> TRIM(utbildningsnamn)
   OR REGEXP_LIKE(utbildningsnamn, '[[:space:]]{2,}')
   OR INSTR(utbildningsnamn, UNISTR('\00A0')) > 0
UNION ALL
SELECT 'utbildningsanordnare', COUNT(*)
FROM ansokningsomgang25
WHERE utbildningsanordnare <> TRIM(utbildningsanordnare)
   OR REGEXP_LIKE(utbildningsanordnare, '[[:space:]]{2,}')
   OR INSTR(utbildningsanordnare, UNISTR('\00A0')) > 0;

EXIT