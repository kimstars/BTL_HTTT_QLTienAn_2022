CREATE VIEW DS_CTLopChoPheDuyet as
SELECT dsrn.MaDS, dkn.NgayDi, hv.HoTen, hv.MaLop, dv.MaDonVi, l.TenLop, ln.TenLoaiNghi 
FROM dbo.DanhSachRaNgoai dsrn
INNER JOIN dbo.DangKyNghi dkn on dkn.mads = dsrn.MaDS
INNER JOIN dbo.HocVien hv ON hv.MaHocVien = dkn.MaHocVien
INNER JOIN dbo.lop l ON	l.MaLop = hv.MaLop
INNER JOIN dbo.DonVi dv ON dv.MaDonVi = l.MaDonVi
INNER JOIN dbo.LoaiNghi ln ON ln.MaLoaiNghi = dkn.MaLoaiNghi


GO 
CREATE VIEW DS_LopChoPheDuyet as
SELECT dsrn.MaDS, dsrn.NgayDK, hv.HoTen, hv.MaLop, dv.MaDonVi, l.TenLop
FROM dbo.DanhSachRaNgoai dsrn
INNER JOIN dbo.HocVien hv ON hv.MaHocVien = dsrn.MaLT
INNER JOIN dbo.lop l ON	l.MaLop = hv.MaLop
INNER JOIN dbo.DonVi dv ON dv.MaDonVi = l.MaDonVi
WHERE dsrn.PheDuyet = -3

GO

CREATE VIEW [dbo].[NhaBep_ListThanhToan] AS
SELECT hv.MaHocVien, hv.HoTen, l.TenLop, l.MaLop, dv.MaDonVi,dv.TenDonVi, dkn.NgayDi, ln.TenLoaiNghi,ln.MaLoaiNghi ,ln.SoBuoiSang,ln.SoBuoiTrua,ln.SoBuoiToi,ptt.TongTien,ptt.TrangThaiTT, ptt.NgayTT,ptt.MaThanhToan,dkn.MaDangKy
FROM dbo.DanhSachRaNgoai ds 
INNER JOIN dbo.DangKyNghi AS dkn ON dkn.MaDS = ds.MaDS
INNER JOIN dbo.HocVien AS hv ON hv.MaHocVien = dkn.MaHocVien
INNER JOIN dbo.LoaiNghi ln ON ln.MaLoaiNghi = dkn.MaLoaiNghi
INNER JOIN dbo.PhieuThanhToan ptt ON ptt.MaDangKy = dkn.MaDangKy
INNER JOIN dbo.Lop l ON l.MaLop = hv.MaLop
INNER JOIN dbo.DonVi dv ON dv.MaDonVi = l.MaDonVi

GO

CREATE VIEW [dbo].[DS_Lop_DaPheDuyet] AS 
SELECT ds.PheDuyet, ds.MaDS, ds.NgayDK, cbc.HoTen AS HoTenc, cbd.HoTen AS HoTend,ds.MaCBd, l.TenLop, l.MaDonVi, l.MaLop
FROM DanhSachRaNgoai ds
LEFT JOIN CanBo cbc ON cbc.MaCanBo = ds.MaCBc
LEFT JOIN dbo.CanBo cbd ON	cbd.MaCanBo = ds.MaCBd
INNER JOIN dbo.Lop l ON	l.MaDonVi = cbc.MaDonVi

GO

CREATE VIEW [dbo].[c_ChoPheDuyet] AS
SELECT DISTINCT(ds.MaDS),ds.PheDuyet,  l.TenLop,ds.NgayDK, hv1.HoTen, TenDonVi
FROM DanhSachRaNgoai ds
JOIN DangKyNghi dk ON dk.MaDS = ds.MaDS
JOIN HocVien hv ON hv.MaHocVien = dk.MaHocVien
JOIN Lop l ON l.MaLop = hv.MaLop
JOIN HocVien hv1 ON hv1.MaHocVien = l.MaLopTruong
JOIN DonVi dv ON l.MaDonVi = dv.MaDonVi

GO

CREATE VIEW [dbo].[NhaBep_ListCatCom] AS
SELECT hv.MaHocVien, hv.HoTen, dv.MaDonVi, dv.TenDonVi , ctcc.NgayCatCom, ctcc.BuoiSang, ctcc.BuoiTrua, ctcc.BuoiToi
FROM dbo.ChiTietCatCom AS ctcc 
JOIN dbo.DangKyNghi ON DangKyNghi.MaDangKy = ctcc.MaDangKy 
JOIN dbo.HocVien AS hv ON hv.MaHocVien = DangKyNghi.MaHocVien
join Lop l on l.MaLop = HV.MaLop
JOIN dbo.DonVi AS dv ON dv.MaDonVi = L.MaDonVi
JOIN dbo.DanhSachRaNgoai AS dsn ON dsn.MaDS = DangKyNghi.MaDS
WHERE(dsn.PheDuyet =1)



go 

CREATE view DS_ChoPheDuyet as
  select distinct(dk.MaDangKy), hv.HoTen, l.TenLop, dk.NgayDi, ln.TenLoaiNghi, ds.MaDS from DanhSachRaNgoai ds
  join DangKyNghi dk on dk.MaDS = ds.MaDS
  join LoaiNghi ln on ln.MaLoaiNghi = dk.MaLoaiNghi
  join HocVien hv on hv.MaHocVien = dk.MaHocVien
  join Lop l on l.MaLop = hv.MaLop



go

create VIEW [dbo].[DS_DaPheDuyet_cd] AS
SELECT DISTINCT(ds.MaDS),ds.PheDuyet,  l.TenLop,ds.NgayDK, hv1.HoTen, TenDonVi, dv.MaDonVi, hv.MaLop,ds.MaCBc,ds.MaCBd, cb.HoTen AS 'TenCBc', cb1.HoTen AS 'TenCBd'
FROM DanhSachRaNgoai ds
JOIN DangKyNghi dk ON dk.MaDS = ds.MaDS
JOIN HocVien hv ON hv.MaHocVien = dk.MaHocVien
JOIN Lop l ON l.MaLop = hv.MaLop
JOIN HocVien hv1 ON hv1.MaHocVien = l.MaLopTruong
JOIN DonVi dv ON l.MaDonVi = dv.MaDonVi
JOIN dbo.CanBo cb ON cb.MaCanBo = ds.MaCBc 
JOIN dbo.CanBo cb1 ON cb1.MaCanBo = ds.MaCBd


go

CREATE VIEW [dbo].[DSLop_ChoPheDuyet] AS
SELECT DISTINCT(ds.MaDS),ds.PheDuyet,  l.TenLop,ds.NgayDK, hv1.HoTen, dv.TenDonVi, dv.MaDonVi, hv.MaLop
FROM DanhSachRaNgoai ds
JOIN DangKyNghi dk ON dk.MaDS = ds.MaDS
JOIN HocVien hv ON hv.MaHocVien = dk.MaHocVien
JOIN Lop l ON l.MaLop = hv.MaLop
JOIN HocVien hv1 ON hv1.MaHocVien = l.MaLopTruong
JOIN DonVi dv ON l.MaDonVi = dv.MaDonVi

GO 

CREATE VIEW ds_huy AS 
SELECT ds.PheDuyet, ds.MaDS, ds.NgayDK, cb.HoTen AS HoTenc, ds.MaCBd, TenDonVi 
FROM DanhSachRaNgoai ds
JOIN CanBo cb ON cb.MaCanBo = ds.MaCBc
JOIN DonVi dv ON dv.MaDonVi = cb.MaDonVi

GO

ALTER VIEW  [dbo].[DS_DaThanhToan] AS
SELECT cb.hoten AS HoTenCB, hv.hoten AS HoTenHV, dv.TenDonVi, ptt.NgayTT, ptt.TongTien
FROM PhieuThanhToan ptt
JOIN CanBo cb ON ptt.MaCBNhaBep = cb.MaCanBo
JOIN DangKyNghi dkn ON dkn.MaDangKy = ptt.MaDangKy
JOIN HocVien hv ON hv.MaHocVien = dkn.MaHocVien
JOIN Lop l ON l.MaLop = hv.MaLop
JOIN DonVi  dv ON dv.MaDonVi = l.MaDonVi
WHERE TrangThaiTT = 1


GO 

CREATE VIEW CanBo_SuaNhapDS AS
SELECT dkn.MaHocVien, l.TenLop, dkn.NgayDi, dkn.NgayVe, ln.TenLoaiNghi, dkn.MaDangKy,hv.MaLop,l.MaDonVi,dkn.MaDS,dkn.MaLoaiNghi
FROM dbo.DanhSachRaNgoai dsrn 
LEFT JOIN dbo.DangKyNghi dkn ON dkn.MaDS = dsrn.MaDS
LEFT JOIN dbo.LoaiNghi ln ON ln.MaLoaiNghi = dkn.MaLoaiNghi
INNER JOIN dbo.HocVien hv ON hv.MaHocVien = dkn.MaHocVien
INNER JOIN dbo.Lop l ON	l.MaLop = hv.MaLop
JOIN dbo.ChiTietCatCom ctcc ON ctcc.MaDangKy = dkn.MaDangKy


GO


ALTER VIEW [dbo].[CanBo_SuaNhapDS] AS
SELECT dkn.MaHocVien, l.TenLop, dkn.NgayDi, dkn.NgayVe, ln.TenLoaiNghi, dkn.MaDangKy,hv.MaLop,l.MaDonVi,dkn.MaDS,dkn.MaLoaiNghi,
 ctcc.BuoiSang,ctcc.BuoiTrua,ctcc.BuoiToi, dsrn.PheDuyet
FROM dbo.DanhSachRaNgoai dsrn 
LEFT JOIN dbo.DangKyNghi dkn ON dkn.MaDS = dsrn.MaDS
LEFT JOIN dbo.LoaiNghi ln ON ln.MaLoaiNghi = dkn.MaLoaiNghi
INNER JOIN dbo.HocVien hv ON hv.MaHocVien = dkn.MaHocVien
INNER JOIN dbo.Lop l ON	l.MaLop = hv.MaLop
JOIN dbo.ChiTietCatCom ctcc ON ctcc.MaDangKy = dkn.MaDangKy

GO

CREATE VIEW Lop_DSHuy as
SELECT dsrn.MaDS, dsrn.NgayDK,cbc.HoTen 'TenCBc', cbd.HoTen 'TenCBd', dsrn.PheDuyet, lt.MaLop
FROM dbo.DanhSachRaNgoai dsrn
LEFT JOIN dbo.CanBo cbc ON cbc.MaCanBo = dsrn.MaCBc
LEFT JOIN dbo.CanBo cbd ON cbd.MaCanBo = dsrn.MaCBd
INNER JOIN dbo.HocVien lt ON lt.MaHocVien = dsrn.MaLT
WHERE dsrn.PheDuyet = -1 OR dsrn.PheDuyet = -2

