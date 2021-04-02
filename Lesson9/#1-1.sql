start transaction;
insert into sample.users (select * from shop2.users where id = 1);
delete from shop2.users where id = 1;
select * from sample.users sa join shop2.users sh on sa.id = sh.id;
commit;