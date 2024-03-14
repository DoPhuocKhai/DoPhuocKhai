CREATE DATABASE Store;
GO
USE Store; 
GO
CREATE TABLE Customer(
	CustomerId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	CustomerName NVARCHAR(64) NOT NULL,
	Address NVARCHAR(128) NOT NULL,
	Phone VARCHAR(16)
);
GO
CREATE TABLE Product(
	ProductId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	ProductName NVARCHAR(64) NOT NULL,
	Unit NVARCHAR(16) NOT NULL
);
GO
CREATE TABLE Receipt(
	ReceiptId VARCHAR(8) NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL REFERENCES Customer(CustomerId),
	ReceiptDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO
CREATE TABLE ReceiptDetail(
	ReceiptId VARCHAR(8) NOT NULL REFERENCES Receipt(ReceiptId),
	ProductId INT NOT NULL REFERENCES Product(ProductId),
	Quantity SMALLINT NOT NULL,
	Amount INT NOT NULL
);
GO

CREATE TABLE [Order](
	OrderId VARCHAR(8) NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL REFERENCES Customer(CustomerId),
	OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
	ShipingDate DATETIME
);
GO
CREATE TABLE OrderDetail(
	OrderId VARCHAR(8) NOT NULL REFERENCES [Order](OrderId),
	ProductId INT NOT NULL REFERENCES Product(ProductId),
	Quantity SMALLINT NOT NULL,
	Amount INT NOT NULL
);
GO
CREATE TABLE Delivery(
	DeliveryId VARCHAR(8) NOT NULL PRIMARY KEY,
	OrderId VARCHAR(8) NOT NULL REFERENCES [Order](OrderId),
	DeliveryDate DATETIME NOT NULL DEFAULT GETDATE()
);
CREATE TABLE DeliveryDetail(
	DeliveryId VARCHAR(8) NOT NULL PRIMARY KEY REFERENCES Delivery(DeliveryId),
	ProductId INT NOT NULL REFERENCES Product(ProductId),
	Quantity SMALLINT NOT NULL,
	Amount INT NOT NULL
);
GO
CREATE TABLE PaymentVoucher(
	PaymentVoucherId VARCHAR(8) NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL REFERENCES Customer(CustomerId),
	PaymentVoucherDate DATE NOT NULL,
	Total INT NOT NULL,
	Explain NVARCHAR(128) NOT NULL
);
GO
CREATE TABLE CashReceipt(
	CashReceiptId VARCHAR(8) NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL REFERENCES Customer(CustomerId),
	CashReceiptDate DATETIME NOT NULL,
	Amount INT NOT NULL,
	Explain NVARCHAR(128) NOT NULL
);
GO
SET IDENTITY_INSERT Customer ON;
INSERT INTO Customer (CustomerId, CustomerName, Address, Phone) VALUES
	(1, N'Công ty TNHH Hoàng Sơn', N'327/9B Nơ Trang Long, Q.BT-TPHCM', NULL),
	(2, N'Cửa hàng Tiến Phát', N'198B Cống Quỳnh, Q.1 - TPHCM', NULL);
SET IDENTITY_INSERT Customer OFF;
GO

SET IDENTITY_INSERT Product ON;
INSERT INTO Product (ProductId, ProductName, Unit) VALUES
	(1, N'TV 21”', N'Cái'),
	(2, N'Cassette', N'Cái');
GO
SET IDENTITY_INSERT Product OFF;
GO