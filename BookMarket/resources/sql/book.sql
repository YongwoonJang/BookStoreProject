CREATE TABLE IF NOT EXISTS book(
	b_id VARCHAR(20) NOT NULL,
	b_name VARCHAR(20),
	b_unitPrice INTEGER,
	b_author VARCHAR(50),
	b_publisher VARCHAR(20),
	b_description TEXT,
	b_category VARCHAR(20),
	b_unitsInStock LONG,
	b_totalPages LONG,
	b_releaseDate VARCHAR(20),
	b_condition VARCHAR(20),
	b_fileName VARCHAR(30),
	PRIMARY KEY (b_id)
)default CHARSET=utf8;

ALTER TABLE book CHANGE COLUMN p_publi

INSERT INTO book VALUES('ISBN0001', 'Bible', 1000, 'God', 'unknown', 'The best seller all over the world', 'Religion', 100, 10000, 'BC 300', 'brand new', 'bible.jpg');

select * from book;