--create role
create role truongChiNhanh;
create role truongPhong;
create role truongDuAn;
create role nhanVien;
create role giamDoc;

--Gan quyen ket noi cho tat ca user
GRANT CREATE SESSION TO PUBLIC;

--nhan  vien 
grant select,update on HR.NHANVIEN to NHANVIEN;
grant select on HR.CHINHANH to NHANVIEN
grant select on HR.PHONGBAN to NHANVIEN
grant select on HR.DUAN to NHANVIEN;
grant select on HR.PHANCONG to NHANVIEN;

-- truong phong 
--gan quyen them thong tin va update vao phan cong cho quyen truong phong
grant insert, select,update on HR.PHANCONG to TRUONGPHONG;
grant insert, select,update on HR.DUAN to TRUONGPHONG;



-- truong du an
grant insert, select , update on HR.CHITIEU to TRUONGDUAN;
grant insert, select,update on HR.PHANCONG to TRUONGDUAN;



 

--Gan role cho cac user truong phong
grant truongPhong to "NV01", "NV04", "NV05","NV06","NV07";
--Tao ket noi cac truong phong
grant create session to "NV01", "NV04", "NV05","NV06","NV07","NV09","NV10"


grant truongChiNhanh to "NV11","NV12", "NV14", "NV13","NV15";
grant create session to "NV11","NV12", "NV14", "NV13","NV15";

grant truongDuAn to "NV01", "NV04", "NV05","NV06","NV07","NV09","NV10";
grant create session to "NV01", "NV04", "NV05","NV06","NV07","NV09","NV10";

grant nhanVien to "NV01","NV02","NV03", "NV04", "NV05","NV06","NV07","NV08","NV09","NV10","NV11","NV12","NV13", "NV14", "NV15","NV16","NV17","NV18";
grant create session to "NV01","NV02","NV03", "NV04", "NV05","NV06","NV07","NV08","NV09","NV10","NV11","NV12","NV13", "NV14", "NV15","NV16","NV17","NV18";

grant giamDoc to "NV19","NV20","NV21";
grant create session to "NV19","NV20","NV21";
