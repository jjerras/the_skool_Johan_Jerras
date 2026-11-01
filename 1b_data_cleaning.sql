SET DEFINE OFF

-- Rensa upp data i tabellen ansokningsomgang25

-- Ta bort onödiga blanksteg i början/slutet av strängar och ersätt flera blanksteg i rad med ett enda blanksteg.
UPDATE ansokningsomgang25
SET
    utbildningsnamn      = TRIM(REGEXP_REPLACE(utbildningsnamn,      '[[:space:]]+', ' ')),
    utbildningsanordnare = TRIM(REGEXP_REPLACE(utbildningsanordnare, '[[:space:]]+', ' ')),
    sun5_inriktning_namn = TRIM(REGEXP_REPLACE(sun5_inriktning_namn, '[[:space:]]+', ' '));

COMMIT;

-- Slår samt ihop olika varianter av utbildningsnamn till ett kanoniskt namn, t.ex. "Frontend-utvecklare" och "Front End Developer" blir "Frontend Developer".
ALTER TABLE ansokningsomgang25 ADD (utbildningsnamn_norm VARCHAR2(150));

DROP TABLE IF EXISTS namn_mappning;

-- Skapar en tabell för att mappa olika varianter av utbildningsnamn till ett kanoniskt namn.
CREATE TABLE namn_mappning (
    variant         VARCHAR2(150) PRIMARY KEY,
    kanoniskt_namn  VARCHAR2(150) NOT NULL
);

INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('AI Manager',                                  'AI-Manager');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Cyber Security Engineer',                     'Cybersecurity Engineer');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Data engineer',                               'Data Engineer');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Front End Developer',                         'Frontend Developer');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Frontend-utvecklare',                         'Frontendutvecklare');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Fullstackutvecklare - JavaScript',            'Fullstackutvecklare JavaScript');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('IT-infrastrukturtekniker - Moln & Säkerhet',  'IT-infrastrukturtekniker - moln & säkerhet');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('IT-Säkerhetsspecialist',                      'IT-säkerhetsspecialist');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Utvecklare inom AI & Maskininlärning',        'Utvecklare inom AI och maskininlärning');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('Utvecklare inom AI och Maskininlärning',      'Utvecklare inom AI och maskininlärning');
INSERT INTO namn_mappning (variant, kanoniskt_namn) VALUES ('UX Designer',                                 'UX-designer');


UPDATE ansokningsomgang25 a
SET utbildningsnamn_norm = COALESCE(
    (SELECT m.kanoniskt_namn
     FROM namn_mappning m
     WHERE m.variant = a.utbildningsnamn),
    a.utbildningsnamn
);

COMMIT;

EXIT