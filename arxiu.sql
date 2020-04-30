SELECT COUNT(flightID) AS total FROM flights;
SELECT Origin, AVG(ArrDelay) AS Prom_Salidas, AVG(DepDelay) AS Prom_Llegadas FROM flights GROUP BY Origin;
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS Prom_Salidas FROM flights GROUP BY Origin, colYear, colMonth;
SELECT City, colYear, colMonth, AVG(ArrDelay) AS Prom_Salidas FROM flights INNER JOIN usairports ON flights.Origin=usairports.IATA GROUP BY Origin, colYear, colMonth order by City;
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) AS Total_Cancelados FROM flights GROUP BY UniqueCarrier, colYear, colMonth ORDER BY Total_Cancelados DESC;
SELECT TailNum, SUM(Distance) AS TotalDistance FROM flights WHERE tailNum!=''GROUP BY TailNum ORDER BY TotalDistance DESC limit 10;
SELECT UniqueCarrier, avg(ArrDelay+DepDelay)/2 AS AvgDelay FROM flights  GROUP BY UniqueCarrier having AvgDelay>10 ORDER BY AvgDelay DESC;

