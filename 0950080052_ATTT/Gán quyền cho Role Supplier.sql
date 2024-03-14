USE Store
GO

--GÁN QUYỀN CHO ROLE Supplier
GRANT INSERT ON Receipt TO Supplier;
GRANT SELECT ON Receipt TO Supplier;

GRANT INSERT ON ReceiptDetail TO Supplier;
GRANT SELECT ON ReceiptDetail TO Supplier;

GRANT INSERT ON CashReceipt TO Supplier;
GRANT SELECT ON CashReceipt TO Supplier;

GRANT INSERT ON PaymentVoucher TO Supplier;
GRANT SELECT ON PaymentVoucher TO Supplier;

GRANT SELECT ON SALEBYPRODUCT TO Supplier;
GRANT SELECT ON Product TO Supplier;


GRANT EXECUTE ON OBJECT::dbo.GETRECEIPT TO Supplier;
GRANT EXECUTE ON OBJECT::dbo.GETCASHRECEIPT TO Supplier;
GRANT EXECUTE ON OBJECT::dbo.GETPAYMENTVOUCHER TO Supplier; 
