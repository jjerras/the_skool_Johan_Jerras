# the_skool_Johan_Jerras


## Förberedelse av data
    ### Datan är hämtad från: https://www.myh.se/yrkeshogskolan/resultat-ansokningsomgangar/resultat-for-program
    ### Datan i xlsx-filen "resultat-ansokningsomgang-2025" formateras om till en csv-fil, csv-filen exporteras till Linux genom scp.

## Behandling av data
    ### Den råa datafilen är: resultat-ansokningsomgang-2025.csv
    ### Den bearbetade datafilen är: ansokningsomgang25.csv
    ### Jag behandlar datan bland annat genom TRIM(utbildningsnamn).
    ### Jag tar bort "åäö" ur de kolumner som innehåller dessa.
        iconv -f WINDOWS-1252 -t UTF-8 resultat-ansokningsomgang-2025.csv \  <- konverterar teckenkodningen
    ### Jag tar bort de 6 första raderna som innehåller annat än data.
        tail -n +7 > ansokningsomgang25.csv  <- Tar bort de första raderna

## Förberedelse av tabeller
    ### Jag väljer att skapa mina egna tabeller i "0_create_tables.sql" för att ha bättre kontroll över datan och hur den presenteras.
    ### Jag väljer att använda det unika "diarienummer" som Primary Key istället för att skapa en ny då dessa redan har radspecifika värden.
    ### Mina tabeller utifrån datan: 
    ![Bearbetad tabell - 0_create_tables.sql](Screenshots/0_tabeller.png)

## Utformning av SQL-queries
    