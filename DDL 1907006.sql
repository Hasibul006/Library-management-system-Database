
drop table fine;
drop table borrowings;
drop table patron;
drop table book;
drop table librarians;


-- creating table patron
Create table patron( patron_id number(20)check(patron_id>=10000 AND patron_id<=99999), name varchar(30) NOT NULL,email varchar(20) NOT NULL, contact_no number(11) NOT NULL, no_of_borrowings number(20) check(no_of_borrowings >= 0), primary key(patron_id));

-- creating table book
Create table book(book_id number(20) check (book_id>=100000 AND book_id <= 999999), name varchar(50) NOT NULL, author varchar(30) NOT NULL, genre varchar(50) NOT NULL, availability_status varchar(13) NOT NULL check (availability_status IN ('available' , 'unavailable')),
primary key(book_id));

--creating table librarians
Create table librarians( librarian_id number check(librarian_id >= 100 AND librarian_id<=999), name varchar(30) NOT NULL, email varchar(30) NOT NULL, contact_no NUMBER NOT NULL, primary key(librarian_id));

--creating table borrowings
Create table borrowings( borrowing_id NUMBER check(borrowing_id>1000000 AND borrowing_id<=9999999),patron_id number(20)check(patron_id>=10000 AND patron_id<=99999),book_id number(20) check (book_id>=100000 AND book_id <= 999999),librarian_id number check(librarian_id >= 100 AND librarian_id<=999),borrowing_date DATE NOT NULL, return_date DATE ,primary key(borrowing_id),foreign key(patron_id)references patron,foreign key(book_id)references book,foreign key(librarian_id)references librarians);

--creating table fine
Create table fine( fine_id NUMBER check(fine_id >=1000 AND fine_id<=9999), borrowing_id NUMBER check(borrowing_id>1000000 AND borrowing_id<=9999999), fine_ammount NUMBER check(fine_ammount>=0) ,payment_date DATE NOT NULL , primary key(fine_id),foreign key(borrowing_id) references borrowings);






-- adding new column
alter table patron add department varchar(30);

-- modify a column
alter table patron modify department char(30);

-- rename a column
alter table patron rename column department to department2;

-- drop a column
alter table patron drop column department2;






