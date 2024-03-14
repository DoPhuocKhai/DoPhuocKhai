USE Store
GO
--TẠO PHIẾU NHẬP
INSERT INTO Receipt(ReceiptId, ReceiptDate, CustomerId) VALUES ('0368', '2007/04/05', 1);
GO
INSERT INTO ReceiptDetail(ReceiptId, ProductId, Quantity, Amount) VALUES 
	('0368', 1, 50, 60000000),
	('0368', 2, 100, 38000000);
GO

--XEM KẾT QUẢ PHIẾU NHẬP
EXEC GETRECEIPT @Id = '0368'
GO
 