create table galleryripple(
	num int not null auto_increment,
	parent int not null,
	id varchar(10) not null,
	name varchar(10) not null,
	content text not null,
	regist_day varchar(30),
	ip varchar(20),
	PRIMARY KEY(num)
)default CHARSET=utf8;