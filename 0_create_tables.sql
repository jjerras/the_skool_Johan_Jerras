DROP TABLE IF EXISTS ansokningsomgang25;

CREATE TABLE IF NOT EXISTS ansokningsomgang25 (
    diarienummer VARCHAR2(20) PRIMARY KEY,
    utbildningsområde VARCHAR2(60) NOT NULL,
    sun5_inriktning VARCHAR2(10) NOT NULL,
    sun5_inriktning_namn VARCHAR2(100) NOT NULL,
    beslut VARCHAR2(15) NOT NULL,   
    utbildningsnamn VARCHAR2(150) NOT NULL,
    flera_komuner VARCHAR(3) NOT NULL,
    antal_kommuner NUMBER(2) NOT NULL,
    lan VARCHAR2(30) NOT NULL,
    kommun VARCHAR2(30) NOT NULL,
    yh_poang NUMBER(4) NOT NULL,
    studieform VARCHAR2(15) NOT NULL,
    studietakt_procent NUMBER(3) NOT NULL,
    examenstyp VARCHAR2(40) NOT NULL,
    seqf_niva NUMBER(1),
    smalt_yrkesområde VARCHAR2(3) NOT NULL,
    utbildningsanordnare VARCHAR2(120) NOT NULL,
    huvudmannatyp VARCHAR(15) NOT NULL,
    sokta_omgangar NUMBER(2) NOT NULL,
    beviljade_omgangar NUMBER(2) NOT NULL,
    sokta_platser_per_omgang NUMBER(4) NOT NULL,
    sokta_platser_totalt NUMBER(4) NOT NULL,
    beviljade_platser_per_omgang_1 NUMBER(4) NOT NULL,
    beviljade_platser_per_omgang_2 NUMBER(4) NOT NULL,
    beviljade_platser_per_omgang_3 NUMBER(4) NOT NULL,
    beviljade_platser_per_omgang_4 NUMBER(4) NOT NULL,
    beviljade_platser_per_omgang_5 NUMBER(4) NOT NULL,
    beviljade_platser_totalt NUMBER(4) NOT NULL
);

EXIT