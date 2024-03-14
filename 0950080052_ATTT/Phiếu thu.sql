USE Store
GO

--TẠO PHIẾU THU
INSERT INTO CashReceipt(CashReceiptId, CustomerId, CashReceiptDate, Amount, Explain) VALUES 
	('3268', 2, '2007/04/07', 17000000, N'THU TIEN BAN HANG');
GO

--XEM KẾT QUẢ PHIẾU THU
EXEC GETCASHRECEIPT @Id = '3268';
GO

 