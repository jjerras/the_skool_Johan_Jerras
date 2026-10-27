SET PAGESIZE 1500

DESC system.ansokningsomgang25;

--Andel distans och andel bundna utbildningar inom respektive utbildingsområde

SELECT
    utbildningsområde
FROM ansokningsomgang25
GROUP BY studieform;



EXIT