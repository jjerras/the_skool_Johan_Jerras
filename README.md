# the_skool_Johan_Jerras


## Förberedelse av data

### Datan i xlsx-filen "resultat-ansokningsomgang-2025" formateras om till en csv-fil.
### csv-filen exporteras till Linux genom scp och behandlas genom bash kommandon:
    iconv -f WINDOWS-1252 -t UTF-8 resultat-ansokningsomgang-2025.csv \  <- konverterar teckenkodningen
      | tail -n +7 > ansokningsomgang25.csv  <- Tar bort de första raderna som inte är en del av datan och sparar till den nya filen "ansokningsomgang25.csv"

## Förberedelse av tabeller
### Jag väljer att skapa mina egna tabeller i "0_create_tables.sql" för att ha bättre kontroll över datan och hur den presenteras.




## Behandling av data
    TRIM(utbildningsnamn)