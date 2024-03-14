USE Store
GO
--THỦ TỤC XEM PHIẾU NHẬP
CREATE PROC GETRECEIPT(@Id VARCHAR(8))
AS
BEGIN 
	SELECT * FROM Receipt WHERE ReceiptId = @Id;
	SELECT ReceiptId, ProductName, Unit, Quantity, Amount / Quantity AS Price, Amount
		FROM ReceiptDetail JOIN Product ON ReceiptDetail.ProductId = Product.ProductId
		WHERE ReceiptId = @Id;
END
GO

--THỦ TỤC XEM PHIẾU THU
CREATE PROC GETPAYMENTVOUCHER(@Id VARCHAR(8))
AS
BEGIN
	SELECT PaymentVoucherId, PaymentVoucherDate, CustomerName, Address, Total, Explain
	FROM PaymentVoucher JOIN Customer
		ON PaymentVoucher.CustomerId = Customer.CustomerId
		AND PaymentVoucherId = @Id; 
END
GO

--THỦ TỤC XEM ĐƠN ĐẶT HÀNG
CREATE PROC GETORDER(@Id VARCHAR(8))
AS
BEGIN
	SELECT OrderId, OrderDate, CustomerName, Address
		FROM [Order] JOIN Customer ON Customer.CustomerId = [Order].CustomerId
		WHERE OrderId = @Id
	SELECT ProductName, Unit, Quantity, Amount / Quantity AS Price, Amount
	FROM OrderDetail JOIN Product ON OrderDetail.ProductId = Product.ProductId
	WHERE OrderId = @Id;
END
GO

--THỦ TỤC ĐƠN GIAO HÀNG
CREATE PROC GETDELIVERY(@Id VARCHAR(8))
AS
BEGIN
	SELECT DeliveryId, DeliveryDate, CustomerName, Address, [Order].OrderId
		FROM Delivery join [Order]
		ON Delivery.OrderId = [Order].OrderId
		JOIN Customer ON Customer.CustomerId = [Order].CustomerId
		WHERE DeliveryId = @Id;
	SELECT ProductName, Unit, Quantity, Amount / Quantity AS Price, Amount
	FROM DeliveryDetail JOIN Product
		ON DeliveryDetail.ProductId = Product.ProductId WHERE DeliveryId = @Id
END
GO

--THỦ TỤC XEM PHIẾU CHI
CREATE PROC GETCASHRECEIPT(@Id VARCHAR(8))
AS
	SELECT CashReceiptId, CashReceiptDate, CustomerName, Address, Amount, Explain
		FROM CashReceipt JOIN Customer
		ON CashReceipt.CustomerId = Customer.CustomerId
		WHERE CashReceiptId = @Id
GO

--VIEW XEM PHIẾU THU THEO TỪNG MẶT HÀNG
CREATE VIEW SALEBYPRODUCT
AS
	SELECT Product.ProductId, ProductName, SUM(Amount) AS Total
	FROM DeliveryDetail JOIN Product ON DeliveryDetail.ProductId = Product.ProductId
	GROUP BY Product.ProductId, ProductName;
GO





