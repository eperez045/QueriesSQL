SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, (precio * 1.09) FROM producto;
SELECT nombre AS nombre_de_producto, precio AS euros, (precio * 1.09) AS dolares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio, 1) FROM producto;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, codigo_fabricante FROM producto ORDER BY codigo_fabricante;
SELECT nombre, codigo_fabricante FROM producto GROUP BY codigo_fabricante;
SELECT nombre FROM fabricante;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT codigo_fabricante, nombre FROM producto WHERE codigo_fabricante=2;
SELECT nombre, precio FROM producto WHERE precio<=120;
SELECT nombre, precio FROM producto WHERE precio>=400;
SELECT nombre, precio FROM producto WHERE precio<400;
SELECT nombre, precio FROM producto WHERE precio>80 AND precio<300;
SELECT nombre, precio FROM producto WHERE precio>60 AND precio<200;
SELECT nombre, precio, codigo_fabricante FROM producto WHERE precio>200 AND codigo_fabricante=2;
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante=1 OR codigo_fabricante=3 OR codigo_fabricante=5;
SELECT nombre, (precio*100) AS centimos FROM producto;
SELECT nombre FROM fabricante WHERE nombre LIKE "s%";
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";
SELECT nombre FROM fabricante WHERE LENGTH(nombre)=4;
SELECT nombre FROM producto WHERE nombre LIKE "%portatil%";
SELECT nombre, precio FROM producto WHERE nombre LIKE "%monitor%" AND precio<215;
SELECT precio, nombre FROM producto WHERE precio>=180 ORDER BY precio DESC;
SELECT precio, nombre FROM producto WHERE precio>=180 ORDER BY nombre;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.nombre, producto.codigo, fabricante.nombre, fabricante.codigo FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre, MIN(producto.precio), fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre, MAX(producto.precio), fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre = "Lenovo";
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre = "Crucial" AND producto.precio>200;
SELECT producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";

SELECT producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.nombre LIKE "%e";
SELECT producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre LIKE "%w%";
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>180 ORDER BY producto.precio DESC;
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>180 ORDER BY producto.nombre;
SELECT fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT * FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT * FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE =NULL;
SELECT COUNT(nombre) FROM producto;
SELECT COUNT(nombre) FROM fabricante;
SELECT COUNT(distinct codigo_fabricante) FROM producto;
SELECT AVG(precio) FROM producto;
SELECT MIN(precio) FROM producto;
SELECT MAX(precio) FROM producto;
SELECT nombre, MIN(precio) FROM producto;
SELECT nombre, MAX(precio) FROM producto;
SELECT SUM(precio) FROM producto;
SELECT COUNT(nombre) FROM producto WHERE codigo_fabricante=1;
SELECT AVG(precio) FROM producto WHERE codigo_fabricante=1;
SELECT MIN(precio) FROM producto WHERE codigo_fabricante=1;
SELECT MAX(precio) FROM producto WHERE codigo_fabricante=1;
SELECT SUM(precio) FROM producto WHERE codigo_fabricante=1;
SELECT MIN(precio), MAX(precio), AVG(precio), COUNT(precio) FROM producto WHERE codigo_fabricante=6;
SELECT COUNT(producto.nombre) AS total, fabricante.nombre FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre ORDER BY total DESC;
SELECT MIN(producto.precio),MAX(producto.precio),AVG(producto.precio), fabricante.nombre FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre;
SELECT MIN(precio), MAX(precio), AVG(precio), codigo_fabricante FROM producto WHERE precio>200 GROUP BY codigo_fabricante;
SELECT COUNT(precio) FROM producto WHERE precio>=180;
SELECT COUNT(distinct codigo_fabricante) FROM producto WHERE precio>=180;
SELECT codigo_fabricante, AVG(precio) FROM producto GROUP BY codigo_fabricante;
SELECT AVG(producto.precio), fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre;
SELECT AVG(producto.precio) AS media, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre HAVING media>180;
SELECT COUNT(producto.codigo) AS cantidad, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre HAVING cantidad>1;
SELECT COUNT(producto.codigo) AS cantidad, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>220 GROUP BY fabricante.nombre;

SELECT SUM(producto.precio) AS suma, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre HAVING suma>1000;
SELECT SUM(producto.precio) AS maximo, producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo GROUP BY fabricante.nombre;
SELECT producto.nombre, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND (SELECT fabricante.nombre="Lenovo");
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio > (SELECT MAX(producto.precio) WHERE fabricante.nombre ="Lenovo");
SELECT producto.nombre, fabricante.nombre, MAX(producto.precio) FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND (SELECT fabricante.nombre ="Lenovo");
SELECT producto.nombre, fabricante.nombre, MIN(producto.precio) FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND (SELECT fabricante.nombre ="Hewlett-Packard");
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio >=(SELECT MAX(producto.precio) FROM producto WHERE producto.codigo_fabricante=2);
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio >(SELECT AVG(producto.precio) FROM producto WHERE producto.codigo_fabricante=1) AND codigo_fabricante=1;
SELECT producto.nombre, fabricante.nombre, producto.precio FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante;
SELECT nombre FROM fabricante WHERE codigo IN(SELECT producto.codigo_fabricante FROM producto, fabricante WHERE fabricante.codigo=codigo_fabricante);
SELECT nombre FROM fabricante WHERE codigo NOT IN(SELECT producto.codigo_fabricante FROM producto, fabricante WHERE fabricante.codigo=codigo_fabricante);
SELECT nombre FROM fabricante WHERE EXISTS(SELECT * FROM producto WHERE fabricante.codigo=codigo_fabricante);
SELECT nombre FROM fabricante WHERE NOT EXISTS(SELECT * FROM producto WHERE fabricante.codigo=codigo_fabricante);
SELECT producto.nombre, fabricante.nombre, MAX(producto.precio) FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre;

SELECT producto.nombre, fabricante.nombre, MAX(producto.precio) FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND (SELECT fabricante.nombre ="Lenovo");









