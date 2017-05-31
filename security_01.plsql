
--create role
create role r_truongChiNhanh;
create role r_truongPhong;
create role r_truongDuAn;
create role r_nhanVien;
create role r_giamDoc;
--phan quyen cho cac role
grant select on CHINHANH to r_nhanVien;
grant select on PHONGBAN to r_nhanVien;
grant select,update on NHANVIEN to r_nhanVien;
grant select on DUAN to r_nhanVien;
grant select on PHANCONG to r_nhanVien;

-- truongphong
grant select,update on PHANCONG TO r_truongPhong;
grant select on CHITIEU TO r_truongPhong;


-- truong du an
grant select,update on CHITIEU TO r_truongDuAn;
--cac quyen nhu sau
-- Gi?i pháp mã hóa thông tin l??ng ?? ch? nhân viên ???c phép xem l??ng c?a mình.

--Tao package ma hoa gom 2 ham ma hoa va giai ma
CREATE OR REPLACE PACKAGE crypt IS
  FUNCTION pack_encrypt(input_data IN VARCHAR2, key_id IN VARCHAR2)  RETURN RAW DETERMINISTIC;
  FUNCTION pack_decrypt(input_data IN RAW,key_id IN VARCHAR2) RETURN VARCHAR2 DETERMINISTIC;
END crypt;

--Ham ma hoa va giai ma--
CREATE OR REPLACE PACKAGE BODY crypt IS 
  function pack_encrypt(input_data in varchar2,key_id in varchar2) RETURN RAW DETERMINISTIC
  is
  	encrypted_raw raw(1024);
    raw_data raw (128) := UTL_RAW.cast_to_raw(input_data);
    key_data raw (128) := UTL_RAW.cast_to_raw(kew_id);
  begin
  
       encrypted_raw := dbms_crypto.encrypt(
          src => raw_data,
          typ => DBMS_CRYPTO.ENCRYPT_DES+DBMS_CRYPTO.CHAIN_CBC+DBMS_CRYPTO.PAD_PKCS5,
          key => key_data);
      return encrypted_raw;
  end pack_encrypt;
  
  function pack_decrypt(input_data in raw,key_id in varchar2) RETURN VARCHAR2 DETERMINISTIC
  is
    decrypted_raw raw(2000);
    raw_data raw (128) := UTL_RAW.cast_to_raw(input_data);
  begin
       decrypted_raw := dbms_crypto.decrypt(
          src => input_data,
          typ => DBMS_CRYPTO.ENCRYPT_DES+DBMS_CRYPTO.CHAIN_CBC+DBMS_CRYPTO.PAD_PKCS5,
          key => raw_data);
      return utl_raw.cast_to_varchar2(decrypted_raw);
  end pack_decrypt;
end luong_crypt;

--Xem luong
create or replace procedure View_Salary
as
  user_login varchar2(50);
  output raw(200);
  luong_output varchar2(50);
begin
  user_login := SYS_CONTEXT('userenv','SESSION_USER');
  user_login := lower(user_login);
  select luong into output
  from NHANVIEN where maNV=user_login;
  luong_output := luong_crypt.pack_decrypt(output,user_login||user_login);
end View_Salary;
