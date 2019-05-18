create table galleryboard(
	num int not null auto_increment,
	id varchar(10) not null,
	name varchar(10) not null,
	subject varchar(100) not null,
	content text not null,
	regist_day varchar(30),
	hit int,
	ip varchar(20),
	filename varchar(50),
	filesize long,
	PRIMARY KEY(num)
)default charset=utf8;

delete from galleryboard;

select * from galleryboard where 'context' like '%%' order by num limit '0','9'

select * from board where content like '%%' order by num limit 0,2;

select name from member where id = 'jyy3k';

select * from galleryboard;

insert into galleryboard values (32703','센과 치히로의 행방불명 포스터2.jpg','0:0:0:0:0:0:0:1','0','null',null,'null,'null,'null,'4');

insert into galleryboard values (32703','센과 치히로의 행방불명 포스터5.jpg','0:0:0:0:0:0:0:1','0','2019-04-20',센과 치히로의 행방불명,'센과 치히로의 행방불명,'장용운,'jyy3k,'4')

insert into galleryboard values (32703,'센과 치히로의 행방불명 포스터7.jpg','0:0:0:0:0:0:0:1',0,'2019-04-20',센과 치히로의 행방불명,'센과  치히로의 행방불명,'장용운,'jyy3k',4)

update galleryboard set id = 'jyy3k', name = '장용운', subject = '리락쿠마와 여름을', content = '리락쿠마와 여름을', regist_day = '2019-04-30' ip = '0:0:0:0:0:0:0:1',filename = 'still_022.jpg', filesize= 99806 where num = 4