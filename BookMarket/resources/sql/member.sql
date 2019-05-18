create table member (
	id varchar(10) not null,
	password varchar(10) not null,
	name varchar(10) not null,
	gender varchar(4),
	birth varchar(10),
	mail varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50),
	primary key(id)
) default CHARSET=utf8;

select * from member;

insert into member values ('1','new1234!','jang','male','20190301','jyy3k@ddd.com','010-3333-3333','23th street N.Y','20190314');

delete from member

select * from member where id is 'jyy3k';

Select * from Member where id in (jyy3k2);