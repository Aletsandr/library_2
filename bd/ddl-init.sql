CREATE TABLE IF NOT EXISTS Authors_books(	--авторы
	id SERIAL primary key,
	name_author varchar (255)  --номер билета
);

CREATE TABLE IF NOT EXISTS Publishing(	--идательство
	id SERIAL primary key,
	title_publishing varchar (255),  --название идательства
	address varchar (255),
	year_publication date
);

CREATE TABLE IF NOT EXISTS Books( --книги	
	id SERIAL primary key,
	title varchar (255), -- название
	number_of_pages varchar (255), -- кол-во страниц
	price decimal(10,2), --цена
	number_of_instances varchar (255), -- кол-во экземпляров
	genre varchar (255),    -- жанр
	--Authors_id bigint, -- авторы
	--foreign key (Authors_id)references Authors (id) on delete cascade,
	Publishing_id bigint,  -- издательство
	foreign key (Publishing_id)references Publishing (id) on delete cascade
);

CREATE TABLE IF NOT EXISTS Readers(	--читатели
	id SERIAL primary key,
	ticket_№ varchar (255),  --номер билета
	FIO varchar (255),
	address varchar (255),
	telephone_№ varchar (255)
);

CREATE TABLE IF NOT EXISTS Workers(	--работники
	id SERIAL primary key,
	FIO varchar (255)
);

CREATE TABLE IF NOT EXISTS books_connect( --связка	
	connect_id SERIAL primary key,
	books_id bigint,
	foreign key (books_id)references Books (id) on delete cascade,
	auther_id bigint,
	foreign key (auther_id)references Authors_books (id) on delete cascade
);

CREATE TABLE IF NOT EXISTS Extradition( --выдача	
	Extradition_id SERIAL primary key,
	start_date date,
	return_date date,
	actual_refund date, --фактичсекий возврат
	Books_id bigint,
	foreign key (Books_id)references Books (id) on delete cascade,
	Workers_id bigint,
	foreign key (Workers_id)references Workers (id) on delete cascade,
	Readers_id bigint,
	foreign key (Readers_id)references Readers (id) on delete cascade
);