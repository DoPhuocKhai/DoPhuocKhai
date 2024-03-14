USE Store
GO

--TẠO PHIẾU GIAO HÀNG
INSERT INTO Delivery(DeliveryId, DeliveryDate, OrderId) VALUES ('0598/GH', '2007/04/07', '0613');
GO
INSERT INTO DeliveryDetail(DeliveryId, ProductId, Quantity, Amount) VALUES 
	('0598/GH', 2, 40, 20000000);
GO

--XEM KẾT QUẢ PHIẾU GIAO HÀNG
EXEC GETDELIVERY @Id = '0598/GH';
GO 