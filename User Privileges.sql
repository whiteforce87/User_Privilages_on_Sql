create tablespace APPPROD_TS datafile '/u01/APPPROD_TS.dbf'

size 10M autoextend on next 10M maxsize 31G;

create tablespace APPTEST_TS datafile '/u01/APPTEST_TS.dbf'

size 1M autoextend on next 1M maxsize 31G;


create user APPUSER identified by "password"

default tablespace APPPROD_TS;

alter user APPUSER password expire;

grant connect to APPUSER;

alter user APPUSER quota unlimited on APPPROD_TS;


create user APPDBA identified by "password2";

grant connect to APPDBA;

grant dba to APPDBA;


create user APPTEST identified by "password3"

default tablespace APPTEST_TS;

alter user APPTEST quota 25M on APPTEST_TS;

grant connect to APPTEST;


create profile APPPROFILE limit PASSWORD_LIFE_TIME unlimited;

alter user APPUSER profile APPPROFILE;


create role HRRW;

grant select, insert, update, delete on hr.employees to HRRW;

grant select, insert, update, delete on hr.departments to HRRW;

grant select, insert, update, delete on hr.jobs to HRRW;

grant HRRW to APPUSER;


create role HRRO;

grant select on hr.employees to HRRO;

grant select on hr.departments to HRRO;

grant select on hr.jobs to HRRO;

grant HRRW to APPTEST;


create role HRRW;

grant select, insert,update,delete on hr.employees to HRRW;

grant select, insert,update,delete on hr.departments to HRRW;

grant select, insert,update,delete on hr.jobs to HRRW;

grant HRRW to APPUSER;


create role HRRO;

grant select on hr.employees to HRRO;

grant select on hr.departments to HRRO;

grant select on hr.jobs to HRRO;

grant HRRW to APPTEST;

