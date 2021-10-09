```sql
--创建登录用户
create login poseidon_rw with password='Middleware2020' ,default_database=test_db;
--创建用户，并跟登录用户关联
create user poseidon_rw for login poseidon_rw with default_schema=dbo;
--可以调整默认的schema
--alter user poseidon_rw with default_schema=dbo;
--把用户添加到dbo的角色组
exec sp_addrolemember 'db_owner' , poseidon_rw;

--参考：https://blog.csdn.net/past__time/article/details/80431723
```
