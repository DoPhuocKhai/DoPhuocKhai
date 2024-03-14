USE Store
GO

--GÁN QUYỀN CHO ROLE Customer
GRANT INSERT ON [Order] TO Customer;
GRANT SELECT ON [Order] TO Customer;

GRANT INSERT ON OrderDetail TO Customer;
GRANT SELECT ON OrderDetail TO Customer;

GRANT EXECUTE ON OBJECT::dbo.GETORDER TO Customer;

 