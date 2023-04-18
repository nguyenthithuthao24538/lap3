--câu 1--
SELECT mahangsx,COUNT(*) as N'tong san pham'
FROM sanpham
GROUP BY mahangsx

--câu 2--
SELECT nhap.masp, tensp,tongtiennhap = nhap.dongian*nhap.soluongn
FROM nhap INNER JOIN sanpham ON nhap.masp=sanpham.masp 
WHERE YEAR(ngaynhap)=2018
GROUP BY nhap.dongian, nhap.soluongn, sanpham.tensp, nhap.masp

--câu 3--
SELECT xuat.masp, sanpham.mahangsx,xuat.soluongx, tensp, ngayxuat
FROM xuat
JOIN sanpham ON xuat.masp = sanpham.masp
JOIN hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongx>10000 AND tenhang = 'Samsung'

--câu 4--
SELECT COUNT(manv), tennv, phong
FROM nhanvien 
WHERE gioitinh = 'nam' 
GROUP BY tennv, phong

--câu 5--
SELECT tenhang, tensp, soluongn
FROM nhap
JOIN sanpham ON nhap.Masp = sanpham.masp
JOIN hangsx ON sanpham.mahangsx = hangsx.mahangsx
WHERE YEAR(ngaynhap) = 2018
GROUP BY tenhang, tensp, soluongn

--câu 6--
SELECT  nhanvien.manv,nhanvien.tennv,SUM(xuat.soluongx* sanpham.giaban) as tongtienxuat
FROM xuat
JOIN nhanvien ON xuat.manv = nhanvien.Manv
JOIN sanpham ON xuat.masp=sanpham.masp
WHERE YEAR(ngayxuat) = 2020
GROUP BY  nhanvien.tennv,nhanvien.manv

--câu 7--
SELECT sohdn, nhanvien.manv, soluongn, dongian, ngaynhap, tiennhap=soluongn*dongian
FROM nhap INNER JOIN nhanvien ON nhap.manv = nhanvien.manv
WHERE YEAR(ngaynhap) = 2018 AND MONTH(ngaynhap) = 8 AND dongian>100000
GROUP BY sohdn, nhanvien.manv, soluongn, dongian, ngaynhap

--câu 8--
SELECT nhap.masp, ngaynhap, dongian
FROM nhap INNER JOIN xuat ON nhap.masp = xuat.masp
WHERE NOT EXISTS(SELECT *FROM xuat INNER JOIN nhap ON xuat.masp = nhap.masp)

--câu 9--
SELECT nhap.masp, ngaynhap, ngayxuat, dongian
FROM nhap INNER JOIN xuat ON nhap.masp = xuat.masp
WHERE YEAR(ngaynhap) = 2018 AND YEAR(ngayxuat) = 2018

--câu 10--
SELECT manv, tennv FROM nhanvien
WHERE EXISTS(SELECT *FROM nhap INNER JOIN xuat ON nhap.manv = xuat.manv AND nhap.manv = nhanvien.manv)

--câu 11--
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
