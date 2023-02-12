
------orcl_root
select user from dual;

show con_name;

select name, open_mode from v$pdbs;

alter pluggable database orclpdb open;


--------------orclpdb_sysdba
create user costin identified by costin;
grant connect, resource to costin;
grant execute on dbms_crypto to costin;
grant all privileges to costin;
commit;

--------------user=costin
select user from dual;

show con_name;
