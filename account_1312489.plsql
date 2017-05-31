---create account
--create account:
----------Nhan vien la:
---------truong chi nhanh la:
---------giam doc la:
--Tao user hr de quan tri co so du lieu
create user hr identified by abcd;



create user "NV01" identified by abcd;
create user "NV02" identified by abcd;
create user "NV03" identified by abcd;
create user "NV04" identified by abcd;
create user "NV05" identified by abcd;
create user "NV06" identified by abcd;
create user "NV07" identified by abcd;
create user "NV08" identified by abcd;
create user "NV09" identified by abcd;
create user "NV10" identified by abcd;
create user "NV11" identified by abcd;
create user "NV12" identified by abcd;
create user "NV13" identified by abcd;
create user "NV14" identified by abcd;
create user "NV15" identified by abcd;
create user "NV16" identified by abcd;
create user "NV17" identified by abcd;
create user "NV18" identified by abcd;
create user "NV19" identified by abcd;
create user "NV20" identified by abcd;
create user "NV21" identified by abcd;

--Gan quyen ket noi cho hr
grant create session to hr;

grant  execute on DBMS_RLsS to hr
grant create procedure to hr;
grant exempt access policy to hr;
grant create to hr;

--Cap quyen quan tri cho hr
grant dba to hr;