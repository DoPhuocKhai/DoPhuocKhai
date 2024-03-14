--TẠO LOGIN
CREATE LOGIN dpkhai WITH PASSWORD = '0950080052';

--TẠO USER
CREATE USER dpkhai FOR LOGIN dpkhai;

--TẠO 3 ROLE Supplier, Customer, Shipper
CREATE ROLE Supplier;
CREATE ROLE Customer;
CREATE ROLE Shipper;

--THÊM USER ĐƯỢC TẠO VÀO 3 ROLE TRÊN
ALTER ROLE Supplier ADD MEMBER dpkhai;
ALTER ROLE Customer ADD MEMBER dpkhai;
ALTER ROLE Shipper ADD MEMBER dpkhai;