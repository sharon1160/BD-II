-- 1
SELECT c.codcli, c.nombre, COUNT(f.codfac) as 'NRO FACTURAS'
FROM Cliente c, Factura f
WHERE c.codcli = f.codcli and f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY c.codcli;

-- 2
SELECT f.codfac, f.fecha, SUM(l.cant * l.precio) as 'IMPORTE'
FROM Factura f, LineasFac l WHERE f.codfac = l.codfac
GROUP BY f.codfac;

-- 3
SELECT v.codven, v.nombre, SUM(l.cant * l.precio) AS 'TOTAL'
FROM Vendedor v JOIN Factura f ON v.codven = f.codven 
JOIN LineasFac l ON f.codfac = l.codfac
WHERE f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY v.codven;

-- 4
SELECT p.nombre, SUM(l.cant) AS 'TOTAL'
FROM Provincia p JOIN Pueblo pb ON p.codpro = pb.codpro
JOIN Cliente c ON pb.codpue = c.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN LineasFac l ON f.codfac = l.codfac
WHERE f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY p.codpro;

-- 5
SELECT DISTINCT c.codcli, c.nombre
FROM Cliente c JOIN Pueblo pb ON c.codpue = pb.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN Vendedor v ON f.codven = v.codven
JOIN Pueblo pb2 ON v.codpue = pb2.codpue
WHERE pb.codpro != pb2.codpro;

-- 6
SELECT DISTINCT c.codcli, c.nombre, COUNT(f.codfac) AS 'TOTAL'
FROM LineasFac l JOIN Factura f ON l.codfac = f.codfac
JOIN Cliente c ON f.codcli = c.codcli
JOIN Pueblo pb ON c.codpue = pb.codpue
JOIN Provincia pr ON pb.codpro = pr.codpro
WHERE pr.nombre = 'Missouri'
GROUP BY c.codcli
HAVING COUNT(f.codfac) > 2;

-- 7
SELECT a.codart, a.descrip
FROM Articulo a JOIN LineasFac l ON a.codart = l.codart
JOIN Factura f ON l.codfac = f.codfac
WHERE f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY a.codart
HAVING COUNT(DISTINCT EXTRACT(MONTH FROM f.fecha)) > 1
AND MAX(EXTRACT(MONTH FROM f.fecha)) - MIN(EXTRACT(MONTH FROM f.fecha)) + 1
= COUNT(DISTINCT EXTRACT(MONTH FROM f.fecha));

-- 8
SELECT c.codcli, c.nombre
FROM Pueblo pb JOIN Cliente c ON pb.codpue = c.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN LineasFac l ON f.codfac = l.codfac
WHERE pb.codpro = 'CA'
GROUP BY c.codcli
HAVING SUM(l.cant * l.precio) > 200;

-- 9
SELECT f.fecha, SUM(l.cant * l.precio) AS 'TOTAL POR MES'
FROM Pueblo pb JOIN Cliente c ON pb.codpue = c.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN LineasFac l ON f.codfac = l.codfac
WHERE pb.codpro = 'AQ' AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY EXTRACT(MONTH FROM f.fecha)
ORDER BY 'TOTAL POR MES'
LIMIT 1;

-- 10
SELECT v.codven, v.nombre, COUNT(*)
FROM Vendedor v JOIN Vendedor v2 ON v.codven = v2.codjefe
GROUP BY v.codven;

-- 11
SELECT c.codcli, c.nombre, pb.nombre 
AS 'DISTRITO', COUNT(DISTINCT l.codart) AS 'NRO ARTICULOS'
FROM Cliente c JOIN Pueblo pb ON c.codpue = pb.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN LineasFac l ON f.codfac = l.codfac
WHERE pb.codpro IN ('AL', 'CA') 
AND UPPER(SUBSTR(c.nombre, 1, 1)) = UPPER(SUBSTR(pb.nombre, 1, 1))
AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND QUARTER(f.fecha) = 4
GROUP BY c.codcli, pb.nombre
HAVING SUM(l.cant * l.precio) > 100;

-- 12
SELECT a.codart AS 'CODIGO ARTICULO', a.descrip AS 'DESCRIPCION'
FROM Articulo a JOIN LineasFac l ON a.codart = l.codart
JOIN Factura f ON l.codfac = f.codfac
JOIN Cliente c ON f.codcli = c.codcli
JOIN Pueblo pb ON c.codpue = pb.codpue
WHERE CHAR_LENGTH(a.descrip) > 5 AND pb.codpro IN ('AQ', 'MQ')
AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND EXTRACT(MONTH FROM f.fecha) = 12
AND EXTRACT(DAY FROM f.fecha) > 12
GROUP BY a.codart
HAVING COUNT(DISTINCT c.codcli) > 3;

-- 13

SELECT pb.codpue, pb.nombre, SUM(l.cant)
FROM Pueblo pb JOIN Provincia pr ON pb.codpro = pr.codpro
JOIN Cliente c ON pb.codpue = c.codpue
JOIN Factura f ON c.codcli = f.codcli
JOIN LineasFac l ON f.codfac = l.codfac
WHERE UPPER(SUBSTR(pb.nombre, 1, 1)) = UPPER(SUBSTR(pr.nombre, 1, 1))
AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND QUARTER(f.fecha) = 3
GROUP BY pb.codpue
HAVING COUNT(DISTINCT c.codcli) > 1 AND SUM(l.cant) > 199;

-- 14

SELECT v.codven, v.nombre, COUNT(DISTINCT c.codcli)
FROM Vendedor v 
JOIN Pueblo pb1 ON (v.codpue = pb1.codpue)
JOIN Factura f ON v.codven = f.codven
JOIN Cliente c ON f.codcli = c.codcli
JOIN Pueblo pb2 ON c.codpue = pb2.codpue
WHERE f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND EXTRACT(MONTH FROM f.fecha) = 12
AND EXTRACT(DAY FROM f.fecha) > 21
AND UPPER(v.nombre) LIKE "%NE %"
AND UPPER(v.nombre) LIKE "%NE"
AND pb1.codpro = pb2.codpro
GROUP BY v.codven;

-- 15
SELECT pb.codpue, pb.nombre
FROM Pueblo pb JOIN Vendedor v ON pb.codpue = v.codpue
UNION ALL
SELECT pb2.codpue, pb2.nombre
FROM Pueblo pb2 JOIN Cliente c ON pb2.codpue = c.codpue;

-- 16
SELECT pb.codpue, pb.nombre
FROM Pueblo pb JOIN Vendedor v ON pb.codpue = v.codpue
UNION
SELECT pb2.codpue, pb2.nombre
FROM Pueblo pb2 JOIN Cliente c ON pb2.codpue = c.codpue;

-- 17
(SELECT pb.codpue, pb.nombre FROM Pueblo pb 
JOIN Vendedor v ON pb.codpue = v.codpue)
INTERSECT
(SELECT pb2.codpue, pb2.nombre FROM Pueblo pb2 
JOIN Cliente c ON pb2.codpue = c.codpue);

-- 18
SELECT pb.codpue, pb.nombre
FROM Pueblo pb LEFT JOIN Vendedor v ON pb.codpue = v.codpue
WHERE v.codpue IS NULL;

-- 19 
SELECT a.codart, a.descrip
FROM Articulo a 
LEFT JOIN (SELECT l.codart, f.fecha FROM LineasFac l 
JOIN Factura f ON l.codfac = f.codfac) AS Result
ON a.codart = Result.codart
WHERE Result.codart IS NULL AND EXTRACT(MONTH FROM Result.fecha) = 1;

-- 20
SELECT a.codart
FROM Articulo a
LEFT JOIN (SELECT l.codart FROM LineasFac l, Factura f 
WHERE l.codfac = f.codfac  AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND QUARTER(f.fecha) = 4) AS Result ON a.codart = Result.codart
WHERE Result.codart IS NULL AND a.stock > 10 AND a.precio > 15;

-- 21
(SELECT v.nombre FROM Vendedor v)
INTERSECT (SELECT c.nombre FROM Cliente c);

-- 22
(SELECT a.codart FROM Articulo a WHERE a.stock < a.stockMin * 2)
INTERSECT (SELECT l.codart 
FROM LineasFac l GROUP BY l.codart HAVING SUM(l.cant) > 10);

--- 23
SELECT SUM( l.cant * l.precio )
FROM Factura f JOIN LineasFac l USING(codfac)
WHERE f.fecha < '2017-09-17' AND f.fecha > '2017-06-19'
UNION SELECT SUM( l.cant * l.precio )
FROM Factura f JOIN LineasFac l USING (codfac )
WHERE f.fecha > '2017-12-15';

--- 24
SELECT codpro, pr.nombre FROM Provincia pr WHERE pr.codpro
NOT IN( SELECT codpro FROM Provincia pr 
JOIN Pueblo p USING (codpro)
JOIN Vendedor v USING (codpue)
JOIN Factura f USING (codven)
WHERE EXTRACT( year FROM f.fecha ) =extract( year FROM current_date() ) - 1);

--- 25
SELECT a.codart, a.descrip FROM Articulo a JOIN LineasFac l USING ( codart )
WHERE a.codart NOT IN ( SELECT a.codart
FROM Articulo a JOIN LineasFac l USING ( codart)
JOIN Factura f USING (codfac)
JOIN Cliente c USING (codcli)
JOIN Pueblo p USING (codpue)
WHERE p.codpro='12');

--- 26
SELECT codpro, COUNT(*)
FROM Provincia pr JOIN Pueblo p USING (codpro)
JOIN Cliente c USING (codpue)
JOIN Factura f USING (codcli)
WHERE f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY codpro
UNION (SELECT l.codart FROM LineasFac l, Factura f
WHERE l.codfac = f.codfac AND f.fecha >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
AND QUARTER(f.fecha) = 4) AS Result ON a.codart = Result.codart
WHERE Result.codart IS NULL AND a.stock > 10 AND a.precio > 15
);





