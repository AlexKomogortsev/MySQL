create view names_connected as
select p.name product_name, c.name catalog_name from products p join catalogs c
on p.catalog_id = c.id;