(SYS)
connect / as sysdba
create user hr identified by abcd;
grant create create session to hr;
grant create to hr;
(HR)
connect hr/abcd;

--Tao bang
create table NHANVIEN(
       maNV char (4) not null,
       hoTen varchar2 (50),
       diaChi varchar2 (50),
       dienThoai number (11, 0),
       email varchar2 (50),
       maPhong char (5),
       chiNhanh char (5),
       luong number,
	   matkhau char(4),
       primary key (maNV)
);
create table CHINHANH(
        maCN char (5),
        tenCN varchar2 (50),
        truongCN char(4),
        primary key  (maCN)
);
create table DUAN(
       maDA char (5) not null,
       tenDA varchar2 (50),
       kinhPhi float,
       phongchuTri char(5),
       truongDA char (4),
       primary key (maDA)
);
create table PHONGBAN(
       maPhong char (5) not null,
       tenPhong varchar2 (50) not null,
       truongPhong char (4) ,
       ngayNhanChuc date,
       soNhanVien number,
       chiNhanh char (5),
       primary key (maPhong)
);
create table PHANCONG(
       maNV char (5) not null,
       duAn char (5),
       vaiTro varchar2 (50),
       phuCap float,
       primary key (maNV, duAn)
);
create table CHITIEU(
       machiTieu char (5) not null,
       tenchiTieu varchar2 (50),
       soTien float,
       duAn char (5),
       primary key (machiTieu)
);


alter table DUAN
    add constraint FK_NHANVIEN_DUAN
    foreign key  (truongDA)
    references  NHANVIEN (maNV);

--Tao khoa ngoai:
alter table CHINHANH
    add constraint FK_NHANVIEN_CHINHANH
    foreign key  (truongCN)
    references  NHANVIEN (maNV);
 --
alter table PHONGBAN
    add constraint FK_NHANVIEN_PHONGBAN
    foreign key  (truongPhong)
    references  NHANVIEN;
alter table PHONGBAN
    add constraint FK_NHANVIEN_CHINHANH
    foreign key  (chiNhanh)
    references  CHINHANH (maCN);

-- Phân công:
alter table PHANCONG
    add constraint FK_PHANCONG_DUAN
    foreign key  (duAn)
    references  DUAN (maDA);
alter table PHANCONG
    add constraint FK_PHANCONG_NHANVIEN
    foreign key  (maNV)
    references  NHANVIEN (maNV);

alter table CHITIEU
    add constraint FK_CHITIEU_DUAN
    foreign key  (duAn)
    references  DUAN (maDA);
 
 alter table DUAN
    add constraint FK_DUAN_PHONGBAN
    foreign key  (phongchuTri)
    references  PHONGBAN (maPhong);

--Insert into table:
------table CHINHANH
 insert into CHINHANH(maCN, tenCN, truongCN) values ('CN001', 'Ho Chi Minh city', 'NV01');
 insert into CHINHANH(maCN, tenCN, truongCN) values ('CN002', 'Ha Noi capital', 'NV03');
 insert into CHINHANH(maCN, tenCN, truongCN) values ('CN003', 'Can Tho province', 'NV05');
 insert into CHINHANH(maCN, tenCN, truongCN) values ('CN004', 'Thanh Hoa province', 'NV04');
 insert into CHINHANH(maCN, tenCN, truongCN) values ('CN005', 'Tien Giang provice', 'NV07');
-----table PHONGBAN
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT001', 'KT dien','NV10', 5, 'CN001');
  insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT002', 'Co khi', 'NV01', 5, 'CN001');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT003', 'KT o to', 'NV06', 3, 'CN002');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT004', 'KT dan dung', 'NV04 ', 2, 'CN004');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT005', 'KT sua xe', 'NV07', 5, 'CN005');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT006', 'KT dien lanh', 'NV05', 3, 'CN003');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT007', 'bao tri-sua chua', 'NV09 ', 2, 'CN002');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT008', 'KT dien', 'NV12', 3, 'CN003');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT009', 'bao chua', 'NV08 ', 2, 'CN005');
 insert into PHONGBAN(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT009', 'KT Kh HD', 'NV03 ', 2, 'CN004');
--Insert into table NHANVIEN
insert into NHANVIEN (maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV01', 'Nguyen Thanh AN', 'Q1 Ho Chi Minh',null, 'an@gmail.com', 'KT002', 'CN001', 19000000,'NV01');

insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV02', 'Tran Quang BINH', 'Q2 Ho Chi Minh',null, 'binh@gmail.com', 'KT002', 'CN001', 17000000,'NV03');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV03', 'Nguyen Hai CANG', 'Hang Bong, Ha Noi',null, 'cang@gmail.com', 'KT003', 'CN002', 13000000,'NV04');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV04', 'Le Van DUNG', 'Thanh Hoa',null, 'dung@gmail.com', 'KT004', 'CN004', 21000000,'NV05');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV05', 'Nguyen Thanh HAU', 'Ninh Kieu, Can Tho',null, 'hau@gmail.com', 'KT003', 'CNCT', 23000000,'NV06');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV06', 'Dao Ba THANH', 'Hang Dao, Ha Noi',null, 'thanh@gmail.com', 'KT003', 'CN002', 21000000,'NV07');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV07', 'Nguyen Le HAI', 'Cai Be, Tien Giang',null, 'hai@gmail.com', 'KT005', 'CN005', 22000000,'NV08');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV08', 'Nguyen Ngoc OANH', 'Q2 Ho Chi Minh',null, 'oanh@gmail.com', 'KT001', 'CN001', 34000000,'NV09');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV09', 'Le Ngoc HOANG', 'Thanh Hoa',null, 'hoang@gmail.com', 'KT007', 'CN004', 22000000,'NV10');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV10', 'Nguyen Le TRUNG', 'Q8 Ho Chi Minh',null, 'trung@gmail.com', 'KT001', 'CN001', 32000000,'NV11');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV11', 'Tran Bao NGOC', 'Thanh Hoa',null, 'ngoc@gmail.com', 'KT004', 'CN004', 27000000,'NV12');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV12', 'Le Trong HIEU', 'Co Do, Can Tho',null, 'hieu@gmail.com', 'KT006', 'CN003', 25000000,'NV13');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV13', 'Hoang Thi THOM', 'Hang Chai',null, 'thom@gmail.com', 'KT003', 'CN002', 35000000,'NV12');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV14', 'Vu Ngoc BENH', 'Q9 Ho Chi Minh',null, 'benh@gmail.com', 'KT002', 'CN001', 31000000,'NV15');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV15', 'Le Tan LOI', 'Thanh Hoa',null, 'loi@gmail.com', 'KT007', 'CN004', 16000000,'NV16');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV16', 'Tran Thai TRONG', 'My Tho, Tien Giang',null, 'trong@gmail.com', 'KT005', 'CN005', 23000000,'NV17');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV17', 'Vu Van Dang', 'Q4 Ho Chi Minh',null, 'gang@gmail.com', 'KT001', 'CN001', 21000000,'NV18');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV18', 'Pham Binh MINH', 'Binh Thuy, Can Tho',null, 'minh@gmail.com', 'KT006', 'CN003', 17000000,'NV02');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV19', 'Thuan Quang DUC', 'Thanh Hoa',null, 'duc@gmail.com', 'KT007', 'CN004', 19000000,'NV19');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV20', 'Vuong ngoc TOAN', 'Thanh Hoa',null, 'toan@gmail.com', 'KT004', 'CN004', 26000000,'NV20');
insert into NHANVIEN(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong, matkhau) values ('NV21', 'Le Tri HOC', 'Q1 Ho Chi Minh',null, 'hoc@gmail.com', 'KT001', 'CN001', 25000000,'NV21');
---insert into DUAN
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA001', 'Du An 01', 200000, 'KT001', 'NV10');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA002', 'Du An 02', 300000, 'KT002', 'NV01');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA003', 'Du An 03', 100000, 'KT003', 'NV06');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA004', 'Du An 04', 500000, 'KT004', 'NV04');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA005', 'Du An 05', 700000, 'KT005', 'NV07');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA006', 'Du An 06', 800000, 'KT006', 'NV05');
insert into DUAN(maDA, tenDA,kinhPhi, phongchuTri, truongDA)  values ('DA007', 'Du An 07', 250000, 'KT007', 'NV09');

--Insert into table PHANCONG

insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV10', 'DA001', 'Nhan vien', 200000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV01', 'DA002', 'Nhan Vien', 400000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV11', 'DA003', 'Nhan vien', 300000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV13', 'DA004', 'Nhan Vien', 200000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV02', 'DA005', 'Nhan Vien', 150000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV03', 'DA006', 'Nhan Vien', 230000);
insert into PHANCONG (maNV, duAn, vaiTro, phuCap)  values ('NV05', 'DA007', 'Nhan Vien', 210000);

--insert into table CHITIEU
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT001', 'Chi tieu can thiet 1', 220000, 'DA01');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT001', 'Chi tieu can thiet 1', 260000, 'DA02');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT003', 'Chi tieu can thiet 3', 280000, 'DA03');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT004', 'Chi tieu can thiet 3', 300000, 'DA04');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT005', 'Chi tieu can thiet 5', 350000, 'DA05');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT006', 'Chi tieu can thiet 6', 320000, 'DA06');
insert into CHITIEU (maChiTieu, tenChTieu, soTien,duAn) values ('CT007', 'Chi tieu can thiet 7', 290000, 'DA07');

--Cập nhật trưởng chi nhánh
update CHINHANH set truongChiNhanh = 'NV11' where maCN='CN001';
update CHINHANH set truongChiNhanh = 'NV12' where maCN='CN002';
update CHINHANH set truongChiNhanh = 'NV13' where maCN='CN003';
update CHINHANH set truongChiNhanh = 'NV14' where maCN='CN004';
update CHINHANH set truongChiNhanh = 'NV15' where maCN='CN005';

--cập nhật phòng ban

UPDATE PHONGBAN SET truongPhong = 'NV06' WHERE maPhong = 'KT010';
UPDATE PHONGBAN SET truongPhong = 'NV04' WHERE maPhong = 'KT011';
UPDATE PHONGBAN SET truongPhong = 'NV05' WHERE maPhong = 'KT012';

UPDATE PHONGBAN SET truongPhong = 'NV03' WHERE maPhong = 'KT013';
UPDATE PHONGBAN SET truongPhong = 'NV01' WHERE maPhong = 'KT014';
UPDATE PHONGBAN SET truongPhong = 'NV07' WHERE maPhong = 'KT015';