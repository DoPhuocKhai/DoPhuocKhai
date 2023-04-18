-- Tạo cơ sở dữ liệu BookingBus
CREATE DATABASE DatVeXeKhach;

-- Sử dụng cơ sở dữ liệu BookingBus
USE DatVeXeKhach

-- Tạo bảng Customer
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    Ho VARCHAR(50),
    Ten VARCHAR(50),
    Email VARCHAR(100),
    SDT VARCHAR(20)
);

-- Tạo bảng Ticket
CREATE TABLE Ticket (
    MaVe INT PRIMARY KEY,
    MaKH INT FOREIGN KEY REFERENCES KhachHang(MaKH),
    NgayDatVe DATETIME,
    NgayKhoiHanh DATETIME,
    NgayDen DATETIME,
    DDKhoiHanh VARCHAR(100),
    DDDen VARCHAR(100),
    STTKH INT,
    TongTien DECIMAL(18,2)
);

-- Tạo bảng Bus
CREATE TABLE XeBus (
    MaXeBus INT PRIMARY KEY,
    MauXe VARCHAR(50),
    SoDangKy VARCHAR(50),
    SoGhe INT,
    TienNghi VARCHAR(200)
);

-- Tạo bảng BookingBus để lưu thông tin đặt chỗ các chuyến xe khách
CREATE TABLE BookingBus (
    MaDatVe INT PRIMARY KEY not null,
	MaXeBus INT FOREIGN KEY REFERENCES XeBus(MaXeBus) not null,
    MaKH INT FOREIGN KEY REFERENCES KhachHang(MaKH),
    NgayDatVe DATETIME,
    NgayKhoiHanh DATETIME,
    NgayDen DATETIME,
    DDKhoiHanh VARCHAR(100),
    DDDen VARCHAR(100),
    STTKH INT,
    TongTien DECIMAL(18,2)
    
   
);

-- Tạo bảng Seat để lưu thông tin các ghế trống/trong thời gian khởi hành các chuyến xe khách
CREATE TABLE Seat (
    MaXeBus INT FOREIGN KEY REFERENCES XeBus(MaXeBus) Not null,
    SoGhe INT not null,
    NgayKhoiHanh DATETIME not null,
    CoSan bit 
);


--Nhập dữ liệu--
use DatVeXeKhach
INSERT INTO KhachHang (MaKH, Ho, Ten, Email, SDT)
VALUES (1, 'Nguyễn', 'Văn A', 'vna@gmail.com', '0123456789'),
       (2, 'Trần', 'Thị B', 'ttb@gmail.com', '0987654321'),
       (3, 'Phạm', 'Văn C', 'pvc@gmail.com', '0165894632'),
       (4, 'Lê', 'Thị D', 'ltd@gmail.com', '0974522369'),
       (5, 'Ngô', 'Văn E', 'nve@gmail.com', '0905321478');


INSERT INTO Ticket (MaVe, MaKH, NgayDatVe, NgayKhoiHanh, NgayDen, DDKhoiHanh, DDDen, STTKH, TongTien)
VALUES (1, 1, '2021-06-15 09:30:00', '2021-06-16 14:00:00', '2021-06-16 19:00:00', 'Hà Nội', 'Hạ Long', 10, 750000),
       (2, 2, '2021-06-14 15:45:00', '2021-06-15 05:30:00', '2021-06-16 09:30:00', 'Hồ Chí Minh', 'Đà Nẵng', 14, 1200000),
       (3, 3, '2021-06-13 11:00:00', '2021-06-14 08:00:00', '2021-06-15 01:30:00', 'Hà Nội', 'Huế', 17, 900000),
       (4, 4, '2021-06-16 16:20:00', '2021-06-17 07:00:00', '2021-06-17 13:30:00', 'Nha Trang', 'TP. Hồ Chí Minh', 25, 1450000),
       (5, 5, '2021-06-11 08:00:00', '2021-06-12 06:30:00', '2021-06-12 11:30:00', 'TP. Hồ Chí Minh', 'Vũng Tàu', 5, 250000);


INSERT INTO XeBus (MaXeBus, MauXe, SoDangKy, SoGhe, TienNghi)
VALUES (1, 'Toyota Hiace', 'HC-0012', 14, 'Wifi, Giá USB, Đèn đọc sách'),
       (2, 'Sprinter', 'DN-8765', 25, 'Hệ thống âm thanh 3D, Máy lạnh'),
       (3, 'Hyundai County', 'HN-2356', 24, 'Tivi, Máy lạnh, Thú rối'),
       (4, 'Thaco Town', 'TN-7598', 16, 'Hệ thống âm thanh, Máy lạnh, Két đựng tiền'),
       (5, 'Isuzu Limousine', 'HZ-4567', 30, 'Hệ thống âm thanh, Máy lạnh, Tủ bảo quản thức ăn');


INSERT INTO BookingBus (MaDatVe, MaXeBus, MaKH, NgayDatVe, NgayKhoiHanh, NgayDen, DDKhoiHanh, DDDen, STTKH, TongTien)
VALUES (1, 1, 1, '2021-06-13 10:00:00', '2021-06-15 09:00:00', '2021-06-15 15:30:00', 'Hà Nội', 'Hải Phòng', 5, 400000),
       (2, 2, 2, '2021-06-14 14:00:00', '2021-06-16 10:00:00', '2021-06-17 17:30:00', 'Hồ Chí Minh', 'Hà Nội', 18, 2000000),
       (3, 3, 3, '2021-06-15 09:30:00', '2021-06-17 14:00:00', '2021-06-18 19:00:00', 'Hà Nội', 'Huế', 12, 1100000),
       (4, 4, 4, '2021-06-16 08:30:00', '2021-06-18 16:00:00', '2021-06-19 21:00:00', 'Nha Trang', 'TP. Hồ Chí Minh', 7, 1800000),
       (5, 5, 5, '2021-06-17 12:00:00', '2021-06-19 11:00:00', '2021-06-20 14:00:00', 'TP. Hồ Chí Minh', 'Vũng Tàu', 15, 550000);


INSERT INTO Seat (MaXeBus, SoGhe, NgayKhoiHanh, CoSan)
VALUES (1, 1, '2021-06-15 09:00:00', 0),
       (1, 2, '2021-06-15 09:00:00', 1),
       (1, 3, '2021-06-15 09:00:00', 1),
       (1, 4, '2021-06-15 09:00:00', 0),
       (1, 5, '2021-06-15 09:00:00', 1),
       (2, 6, '2021-06-16 10:00:00', 1),
       (2, 7, '2021-06-16 10:00:00', 1),
       (2, 8, '2021-06-16 10:00:00', 0),
       (2, 9, '2021-06-16 10:00:00', 1),
       (2, 10, '2021-06-16 10:00:00', 1),
       (3, 11, '2021-06-17 14:00:00', 0),
       (3, 12, '2021-06-17 14:00:00', 1),
       (3, 13, '2021-06-17 14:00:00', 1),
       (3, 14, '2021-06-17 14:00:00', 0),
       (3, 15, '2021-06-17 14:00:00', 1),
       (4, 16, '2021-06-18 16:00:00', 1),
       (4, 17, '2021-06-18 16:00:00', 0),
       (4, 18, '2021-06-18 16:00:00', 1),
       (4, 19, '2021-06-18 16:00:00', 1),
       (4, 20, '2021-06-18 16:00:00', 0),
       (5, 21, '2021-06-19 11:00:00', 1),
       (5, 22, '2021-06-19 11:00:00', 1),
       (5, 23, '2021-06-19 11:00:00', 1),
       (5, 24, '2021-06-19 11:00:00', 0),
       (5, 25, '2021-06-19 11:00:00', 1);

SELECT * FROM KhachHang;
SELECT * FROM Ticket;
SELECT * FROM XeBus;
SELECT * FROM BookingBus;
SELECT * FROM Seat;

--Thủ tục nhập liệu--
use DatVeXeKhach
go
CREATE PROCEDURE spInsertCustomer
    @MaKH INT,
    @Ho VARCHAR(50),
    @Ten VARCHAR(50),
    @Email VARCHAR(100),
    @SDT VARCHAR(20)
AS
BEGIN
    INSERT INTO KhachHang (MaKH, Ho, Ten, Email, SDT)
    VALUES (@MaKH, @Ho, @Ten, @Email, @SDT)
END


go
CREATE PROCEDURE spInsertTicket
    @MaVe INT,
    @MaKH INT,
    @NgayDatVe DATETIME,
    @NgayKhoiHanh DATETIME,
    @NgayDen DATETIME,
    @DDKhoiHanh VARCHAR(100),
    @DDDen VARCHAR(100),
    @STTKH INT,
    @TongTien DECIMAL(18,2)
AS
BEGIN
    INSERT INTO Ticket (MaVe, MaKH, NgayDatVe, NgayKhoiHanh, NgayDen, DDKhoiHanh, DDDen, STTKH, TongTien)
    VALUES (@MaVe, @MaKH, @NgayDatVe, @NgayKhoiHanh, @NgayDen, @DDKhoiHanh, @DDDen, @STTKH, @TongTien)
END

go
CREATE PROCEDURE spInsertBookingBus
    @MaDatVe INT,
    @MaXeBus INT,
    @MaKH INT,
    @NgayDatVe DATETIME,
    @NgayKhoiHanh DATETIME,
    @NgayDen DATETIME,
    @DDKhoiHanh VARCHAR(100),
    @DDDen VARCHAR(100),
    @STTKH INT,
    @TongTien DECIMAL(18,2)
AS
BEGIN
    INSERT INTO BookingBus (MaDatVe, MaXeBus, MaKH, NgayDatVe, NgayKhoiHanh, NgayDen, DDKhoiHanh, DDDen, STTKH, TongTien)
    VALUES (@MaDatVe, @MaXeBus, @MaKH, @NgayDatVe, @NgayKhoiHanh, @NgayDen, @DDKhoiHanh, @DDDen, @STTKH, @TongTien)
END

go
CREATE PROCEDURE spInsertSeat
    @MaXeBus INT,
    @SoGhe INT,
    @NgayKhoiHanh DATETIME,
    @CoSan bit
AS
BEGIN
    INSERT INTO Seat (MaXeBus, SoGhe, NgayKhoiHanh, CoSan)
    VALUES (@MaXeBus, @SoGhe, @NgayKhoiHanh, @CoSan)
END
go


Use DatVeXeKhach
go
-- Tạo trigger cho bảng BookingBus
go
CREATE TRIGGER tr_BookingBus
AFTER INSERT, UPDATE, DELETE
ON BookingBus
FOR EACH ROW
AS
BEGIN
    -- Kiểm tra các dữ liệu đã thay đổi trong bảng BookingBus
    IF EXISTS (SELECT 1 FROM inserted) OR EXISTS (SELECT 1 FROM deleted)
    BEGIN
        -- Tìm các dòng bị xóa trong bảng BookingBus
        DELETE FROM Seat
        WHERE MaDatVe IN (SELECT MaDatVe FROM deleted);

        -- Tìm các dòng được thêm mới hoặc cập nhật trong bảng BookingBus
        INSERT INTO Seat (MaXeBus, SoGhe, NgayKhoiHanh, CoSan)
        SELECT i.MaXeBus, i.STTKH, i.NgayKhoiHanh, 0
        FROM inserted i;

        -- Cập nhật trạng thái ghế đã có người đặt trong bảng Seat
        UPDATE Seat
        SET CoSan = 1
        WHERE MaXeBus IN (SELECT MaXeBus FROM inserted)
        AND SoGhe IN (SELECT STTKH FROM inserted);
    END
END;


--tạo trigger đặt vé mới cho Ticket
go
CREATE TRIGGER ThemVeMoi
ON Ticket
AFTER INSERT
AS
BEGIN
    UPDATE XeBus
    SET SoGhe = SoGhe - inserted.STTKH
    FROM XeBus
    INNER JOIN inserted ON XeBus.MaXeBus = inserted.MaVe
END



-- Tạo function để tính tổng số vé đã đặt trên mỗi chuyến xe
go
CREATE FUNCTION dbo.TinhTongSoVeDat(@MaXeBus INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongSoVeDat INT;
    
    SELECT @TongSoVeDat = COUNT(*) 
    FROM BookingBus 
    WHERE MaXeBus = @MaXeBus;
    
    RETURN @TongSoVeDat;
END;

go
-- Sử dụng function để tính tổng số vé đã đặt trên chuyến xe có mã 1
SELECT dbo.TinhTongSoVeDat(1) AS TongSoVeDat;


--Tạo function tính tiền vé--
go
CREATE FUNCTION dbo.TinhTienVe(@maVe INT)
RETURNS DECIMAL(18,2)
AS 
BEGIN
    DECLARE @TONGTIEN DECIMAL(18,2)
    SELECT @TONGTIEN = TongTien
    FROM Ticket
    WHERE MaVe = @maVe
    RETURN @TONGTIEN
END


--Truy vấn tiền vé--
go
SELECT MaVe, dbo.TinhTienVe(MaVe) AS TongTien
FROM Ticket
WHERE STTKH = 10;