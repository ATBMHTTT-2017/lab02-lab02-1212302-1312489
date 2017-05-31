// this is sample security requirement.
DECLARE
input_manv CHAR (4);
 key CHAR (4);
 Begin
CREATE OR REPLACE PACKAGE enc_dec
AS
   FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC;
   FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC;
END;
/

CREATE OR REPLACE PACKAGE BODY enc_dec
AS
     encryption_type    PLS_INTEGER := DBMS_CRYPTO.ENCRYPT_DES
                                     + DBMS_CRYPTO.CHAIN_CBC
                                     + DBMS_CRYPTO.PAD_PKCS5;
     
     encryption_key     RAW (32) := UTL_RAW.cast_to_raw('MyEncryptionKey');
    
     FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC
     IS
        encrypted_raw      RAW (2000);
     BEGIN
        encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_RAW.CAST_TO_RAW (p_plainText),
           typ => encryption_type,
           key => encryption_key
        );
       RETURN encrypted_raw;
     END encrypt;
     FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC
     IS
        decrypted_raw      RAW (2000);
     BEGIN
        decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
            src => p_encryptedText,
            typ => encryption_type,
            key => encryption_key
        );
        RETURN (UTL_RAW.CAST_TO_VARCHAR2 (decrypted_raw));
     END decrypt;
END;




update HR.NhanVien nv
set nv.luong= enc_dec.encrypt (nv.luong);


select * from HR.NhanVien
where nv.matkhau=key and nv.manv=input_manv;

select manv, enc_dec.decrypt (nv.luong) from HR.NhanVien



grant execute on enc_dec to nhanVien
where nv.matkhau=key and nv.manv=input_manv;

create public synonym enc_dec for sys.enc_dec;

grant select on HR.NhanVien to nhanVien
where nv.matkhau=key and nv.manv=input_manv;


end;
