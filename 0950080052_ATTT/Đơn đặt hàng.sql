USE Store
GO
-- TẠO ĐƠN ĐẶT HÀNG 
INSERT INTO [Order](OrderId, CustomerId, OrderDate, ShipingDate) VALUES ('0613', 2, '2007/04/01', '2007/04/08');
GO
INSERT INTO OrderDetail(OrderId, ProductId, Quantity, Amount) VALUES 
	('0613', 1, 20, 28000000),
	('0613', 2, 40, 20000000);
GO

--XEM KẾT QUẢ ĐƠN ĐẶT HÀNG
EXEC GETORDER @Id = '0613'
GO 