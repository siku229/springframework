show tables;
show databases;

select * from guest2;
create table guest2 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	email varchar(60),
	homepage varchar(60),
	vDate datetime default now(),
	hostIp varchar(50) not null,  
	content text not null
);

desc guest2;

insert into guest2 values (default, '관리자', 'jths0229@gmail.com', 'http://blog.daum.net/cjsk1126', default, '192.168.50.118', '방명록 서비스를 시작합니다.');
insert into guest2 values (default, '윤하', 'younha@gmail.com', 'http://www.c9ent.co.kr/', default, '210.20.54.29', '안녕하세요. 가수 윤하입니다.');

drop table guest2;

delete from guest2 where name='admin';