create view vw_dssanpham
as
	select masp,tensp,tenhang,soluong,mausac, giaban,donvitinh,mota
	from sanpham inner join hangsx on sanpham.mahangsx=hangsx.mahangsx

--lap 2--
GO
CREATE VIEW view1 as
SELECT*FROM sanpham
GO
SELECT*FROM view1;
GO

CREATE VIEW view2 as
SELECT TOP 5 percent masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota 
FROM Sanpham 
inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY giaban DESC
GO

GO
CREATE VIEW view3 as
SELECT TOP 5 percent masp, tenhang, tensp, soluong, mausac, giaban
FROM sanpham inner join hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE Hangsx.tenhang='Samsung'
GO

GO
CREATE VIEW view4 as
SELECT *FROM nhanvien
WHERE gioitinh = 'nư' and phong='kế toán';
GO

CREATE VIEW view5 as
SELECT TOP 100 percent sohdn, sanpham.masp, tensp, tenhang, soluongn, dongian, tiennhap=soluongn*dongian mausac, donvitinh, ngaynhap, tennv, phong
FROM nhap
join sanpham ON nhap.masp = sanpham.masp
join hangsx ON sanpham.mahangsx = hangsx.mahangsx
join nhanvien ON nhap.manv = nhanvien.manv
ORDER BY Sohdn ASC
GO
CREATE VIEW view6 as
SELECT DISTINCT TOP 5 percent sohdx, xuat.masp, tensp, tenhang, soluongx, giaban, tienxuat=soluongx*giaban, mausac, donvitinh, ngayxuat, tennv, phong
FROM xuat
join sanpham ON xuat.masp = sanpham.masp
join hangsx ON sanpham.mahangsx = hangsx.mahangsx
join nhanvien ON xuat.Manv = nhanvien.manv
WHERE YEAR(ngayxuat) = 2018 AND MONTH(ngayxuat) = 10 ORDER BY sohdx ASC
GO
CREATE VIEW view7 as
SELECT TOP 5 percent sohdn, sanpham.masp, tensp, soluongn, dongian, ngaynhap, tennv, phong
FROM nhap
join sanpham ON nhap.masp = sanpham.masp
join hangsx ON sanpham.mahangsx = hangsx.mahangsx
join nhanvien ON nhap.manv = nhanvien.manv
WHERE hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017
GO
CREATE VIEW view8 as
SELECT TOP 10 percent *FROM xuat WHERE YEAR(soluongx) = 20218 ORDER BY soluongx ASC
GO

CREATE VIEW view9 as
SELECT TOP 10 percent *FROM sanpham ORDER BY giaban DESC
GO

CREATE VIEW view10 as
SELECT TOP 5 percent  *FROM sanpham join hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE  giaban between 100000 AND 500000 AND hangsx.tenhang = 'Samsung'
GO
CREATE VIEW view11 as
select sanpham.tensp, count(soluongN*dongiaN) as tongdoanhthu
from nhap, sanpham
where tensp= 'Samsung'
group by tensp
go

CREATE VIEW view12 as
select top 1 dongiaN,sohdn,ngaynhap 
from Nhap 
where Year(ngaynhap)=2018
go
CREATE VIEW view13 as
select top 10 soluongN,manv,tensp
from Nhap,Sanpham 
order by soluongN DESC
go

CREATE VIEW view14 as
select masp,tensp,manv,tenhang
from Sanpham,Nhanvien,Hangsx
where tenhang=N'SAMSUNG' AND manv='NV01'

go
CREATE VIEW view15 as
select sohdn,masp,soluongN,ngaynhap,manv
from Nhap
where masp='SP02' AND manv='NV02'

go
CREATE VIEW view16 as
select tennv,N.manv 
from Nhanvien N join Xuat X on N.manv=X.manv
where year(ngayxuat)=2020 AND month(ngayxuat)=3 AND masp='SP02'
go

---lap3---
CREATE VIEW view17 as
SELECT mahangsx,COUNT(*) as N'tong san pham'
FROM sanpham
GROUP BY mahangsx
go
CREATE VIEW view18 as
SELECT nhap.masp, tensp,tongtiennhap = nhap.dongian*nhap.soluongn
FROM nhap INNER JOIN sanpham ON nhap.masp=sanpham.masp 
WHERE YEAR(ngaynhap)=2018
GROUP BY nhap.dongian, nhap.soluongn, sanpham.tensp, nhap.masp

go
CREATE VIEW view19 as
SELECT xuat.masp, sanpham.mahangsx,xuat.soluongx, tensp, ngayxuat
FROM xuat
JOIN sanpham ON xuat.masp = sanpham.masp
JOIN hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongx>10000 AND tenhang = 'Samsung'

go
CREATE VIEW view20 as
SELECT COUNT(manv), tennv, phong
FROM nhanvien 
WHERE gioitinh = 'nam' 
GROUP BY tennv, phong
go
CREATE VIEW view21 as
SELECT tenhang, tensp, soluongn
FROM nhap
JOIN sanpham ON nhap.Masp = sanpham.masp
JOIN hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE YEAR(ngaynhap) = 2018
GROUP BY tenhang, tensp, soluongn

go
CREATE VIEW view22 as
SELECT  nhanvien.manv,nhanvien.tennv,SUM(xuat.soluongx* sanpham.giaban) as tongtienxuat
FROM xuat
JOIN nhanvien ON xuat.manv = nhanvien.Manv
JOIN sanpham ON xuat.masp=sanpham.masp
WHERE YEAR(ngayxuat) = 2020
GROUP BY  nhanvien.tennv,nhanvien.manv
go
CREATE VIEW view23 as
SELECT sohdn, nhanvien.manv, soluongn, dongian, ngaynhap, tiennhap=soluongn*dongian
FROM nhap INNER JOIN nhanvien ON nhap.manv = nhanvien.manv
WHERE YEAR(ngaynhap) = 2018 AND MONTH(ngaynhap) = 8 AND dongian>100000
GROUP BY sohdn, nhanvien.manv, soluongn, dongian, ngaynhap
go
CREATE VIEW view24 as
SELECT nhap.masp, ngaynhap, dongian
FROM nhap INNER JOIN xuat ON nhap.masp = xuat.masp
WHERE NOT EXISTS(SELECT *FROM xuat INNER JOIN nhap ON xuat.masp = nhap.masp)

go
CREATE VIEW view25 as
SELECT nhap.masp, ngaynhap, ngayxuat, dongian
FROM nhap INNER JOIN xuat ON nhap.masp = xuat.masp
WHERE YEAR(ngaynhap) = 2018 AND YEAR(ngayxuat) = 2018
go
CREATE VIEW view26 as
SELECT manv, tennv 
FROM nhanvien
WHERE EXISTS(SELECT *FROM nhap INNER JOIN xuat ON nhap.manv = xuat.manv AND nhap.manv = nhanvien.manv)

go
CREATE VIEW view27 as
SELECT Manv, Tennv 
FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go


--xóa view lap 3--
GO
DROP VIEW view27
GO
DROP VIEW view26
GO
DROP VIEW view25
GO
--update view lap 3--
GO
ALTER VIEW view18 AS
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
WHERE YEAR(Ngaynhap) = 2020
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO
SELECT *FROM view18
GO
