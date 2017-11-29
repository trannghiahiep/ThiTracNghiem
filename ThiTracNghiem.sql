CREATE DATABASE ThiTracNghiem
GO

USE ThiTracNghiem
GO

CREATE TABLE Khoa
(
	MaKhoa VARCHAR(15) PRIMARY KEY,
	TenKhoa NVARCHAR(50) NOT NULL,
	SDT VARCHAR(11)
)
GO

CREATE TABLE MonThi
(
	MaMon VARCHAR(15) PRIMARY KEY,
	TenMonThi NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE CauHoi
(
	MaCH VARCHAR(15) PRIMARY KEY,
	NoiDung NVARCHAR(300) NOT NULL,
	A NVARCHAR(100),
	B NVARCHAR(100),
	C NVARCHAR(100),
	D NVARCHAR(100),
	MaMon VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.MonThi(MaMon)
)
GO


CREATE TABLE DapAn
(
	MaCH VARCHAR(15) PRIMARY KEY
		REFERENCES dbo.CauHoi(MaCH),
	DapAn NVARCHAR(100) NOT NULL
)
GO


CREATE TABLE KyThi(
	MaKyThi VARCHAR(15) PRIMARY KEY,
	TenKyThi NVARCHAR(50),
	NamHoc VARCHAR(10) NOT NULL,
	TGBatDau INT NOT NULL,
	TGLamBai INT NOT NULL,
	TGKetThuc INT)
GO

CREATE TABLE ThiSinh(
	MaThiSinh VARCHAR(15)PRIMARY KEY,
	TaiKhoan VARCHAR(30),
	MatKhau VARCHAR(30),
	HoTen NVARCHAR(100) NOT NULL,
	GioiTinh BIT NOT NULL,
	NgaySinh DATE,
	MaKhoa VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.Khoa(MaKhoa))
GO


CREATE TABLE ThiSinhKyThi(
	ID INT IDENTITY PRIMARY KEY,
	MaThiSinh VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.ThiSinh(MaThiSinh),
	MaKyThi VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.KyThi(MaKyThi))
GO

CREATE TABLE ThiSinhDapAn(
	ID INT IDENTITY PRIMARY KEY,
	MaThiSinh VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.ThiSinh(MaThiSinh),
	DapAn NVARCHAR(100),
	MaCH VARCHAR(15) FOREIGN KEY
		REFERENCES dbo.CauHoi(MaCH),
	IPMay VARCHAR(15),
	ThoiGianCon INT NOT NULL)
	
GO
