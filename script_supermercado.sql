----20-------------

select a.codart from Articulo a
where a.stock > 20 and a.precio >15
NOT IN
(select l.codart from  LineasFac l, Factura f
where  f.codfac = l.codfac and date_format(f.fecha, 'q')='4'
and extract( year from f.fecha ) = extract( year from current_date() ) - 1);

------21--------------

select v.nombre from Vendedor v
where v.nombre
in(select c.nombre from Cliente c);

------22----------

select a.codart from Articulo a
where a.stock < a.stockmin * 2
in(select l.codart from LineasFac l
group by l.codart
having sum(l.cant) > 100);

-----23-------------
(MaL)
select date_format( f.fecha, 'yyyy' ) ||
		date_format( f.fecha, 'mm' ) codigo,
		date_format( f.fecha, 'yyyy' ) anio,
		date_format( f.fecha, 'mm' ) mes,
		sum( l.cant * l.precio ) facturacion
from Factura f join LineasFac l using(codfac )
group by date_format( f.fecha, 'yyyy' ), date_format( f.fecha, 'mm' )
union
select date_format( f.fecha, 'yyyy') ||'ft' codigo,
		date_format( f.fecha, 'yyyy') anio, '--' mes,
		sum( l.cant * l.precio ) Facturacion
from Factura f join LineasFac l using (codfac )
group by date_format( f.fecha, 'yyyy')
order by 1;
----------24------------
select codpro, pr.nombre
from Provincia pr where pr.codpro
NOT IN(
select codpro 
from Provincia pr 
join Pueblo p using (codpro)
join Vendedor v using (codpue)
join Factura f using (codven)
where extract( year from f.fecha ) =extract( year from current_date() ) - 1);
------25---------

select a.codart, a.descrip
from Articulo a join LineasFac l using ( codart ) where a.codart
not in(
select a.codart
from Articulo a join LineasFac l using ( codart)
				join Factura f using ( codfac )
				join Cliente c using (codcli)
                join Pueblo p using (codpue)
where p.codpro='12');

