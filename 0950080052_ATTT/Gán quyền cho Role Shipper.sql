USE Store 
GO

--GÁN QUYỀN CHO ROLE Shipper
GRANT INSERT ON Delivery TO Shipper;
GRANT SELECT ON Delivery TO Shipper;

GRANT INSERT ON DeliveryDetail TO Shipper;
GRANT SELECT ON DeliveryDetail TO Shipper;

GRANT EXECUTE ON OBJECT::dbo.GETDELIVERY TO Shipper;