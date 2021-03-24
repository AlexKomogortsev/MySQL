select p.name as product_name, c.name as catalog_name
from products p inner join catalogs c
on p.catalog_id = c.id