set pagesize 1000
set linesize 2000

-- Inserting data into the patron table
INSERT INTO patron VALUES(10001,'A','a@google.com',1234567890,5);
INSERT INTO patron VALUES(10002,'B','b@google.com',9876543210,3);
INSERT INTO patron VALUES(10003,'C','c@google.com',5555555555,0);
INSERT INTO patron VALUES(10004,'D','d@google.com',1111111111,2);
INSERT INTO patron VALUES(10005,'E','e@google.com',9999999999,7);
INSERT INTO patron VALUES(10006,'F','f@google.com',4444444444,1);
INSERT INTO patron VALUES(10007,'G','g@google.com',2222222222,0);
INSERT INTO patron VALUES(10008,'H','h@google.com',6666666666,4);
INSERT INTO patron VALUES(10009,'I','i@google.com',8888888888,2);
INSERT INTO patron VALUES(10010,'J','j@google.com',3333333333,6);


-- Inserting data into the book table
INSERT INTO book VALUES(100000, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 'available');
INSERT INTO book VALUES(100001, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 'unavailable');
INSERT INTO book VALUES(100002, 'Pride and Prejudice', 'Jane Austen', 'Romance', 'available');
INSERT INTO book VALUES(100003, '1984', 'George Orwell', 'Dystopian', 'available');
INSERT INTO book VALUES(100004, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 'unavailable');
INSERT INTO book VALUES(100005, 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Fantasy', 'available');
INSERT INTO book VALUES(100006, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'unavailable');
INSERT INTO book VALUES (100007, 'To the Lighthouse', 'Virginia Woolf', 'Modernist', 'available');
INSERT INTO book VALUES(100008, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 'available');
INSERT INTO book VALUES(100009, 'The Hunger Games', 'Suzanne Collins', 'Dystopian', 'unavailable');


-- Inserting data into the librarians table
INSERT INTO librarians VALUES(100, 'laibrarian-1', 'laibrarian1@example.com', 111111);
INSERT INTO librarians VALUES(101,'laibrarian-2','laibrarian2@example.com', 222222);
INSERT INTO librarians VALUES(102, 'laibrarian-3', 'laibrarian3@example.com', 333333);
INSERT INTO librarians VALUES(103, 'laibrarian-4', 'laibrarian4@example.com', 444444);
INSERT INTO librarians VALUES(104, 'laibrarian-5', 'laibrarian5@example.com', 555555);
INSERT INTO librarians VALUES(105, 'laibrarian-6', 'laibrarian6@example.com', 666666);
INSERT INTO librarians VALUES(106, 'laibrarian-7', 'laibrarian7@example.com', 777777);
INSERT INTO librarians VALUES(107, 'laibrarian-8', 'laibrarian8@example.com', 888888);
INSERT INTO librarians VALUES(108, 'laibrarian-9', 'laibrarian9@example.com', 999999);
INSERT INTO librarians VALUES(109, 'laibrarian-10', 'laibrarian10@example.com', 123456);


-- Inserting data into the borrowings table
INSERT INTO borrowings VALUES(1000001,10001,100000,100,TO_DATE('2023-05-10','YYYY-MM-DD'),TO_DATE('2023-05-24','YYYY-MM-DD'));
INSERT INTO borrowings VALUES(1000002, 10002, 100002, 101, TO_DATE('2023-05-11','YYYY-MM-DD'), NULL);
INSERT INTO borrowings VALUES(1000003, 10003, 100004, 102, TO_DATE('2023-05-12','YYYY-MM-DD'), TO_DATE('2023-06-02','YYYY-MM-DD'));
INSERT INTO borrowings VALUES(1000004, 10004, 100006, 103, TO_DATE('2023-05-13','YYYY-MM-DD'), NULL);
INSERT INTO borrowings VALUES(1000005, 10005, 100008, 104, TO_DATE('2023-05-14','YYYY-MM-DD'), TO_DATE('2023-05-29','YYYY-MM-DD'));
INSERT INTO borrowings VALUES(1000006, 10006, 100001, 105, TO_DATE('2023-05-15','YYYY-MM-DD'), NULL);
INSERT INTO borrowings VALUES(1000007, 10007, 100003, 106, TO_DATE('2023-05-16','YYYY-MM-DD'),TO_DATE('2023-05-23','YYYY-MM-DD'));
INSERT INTO borrowings VALUES(1000008, 10008, 100005, 107, TO_DATE('2023-05-17','YYYY-MM-DD'),TO_DATE('2023-06-01','YYYY-MM-DD'));
INSERT INTO borrowings VALUES(1000009, 10009, 100007, 108, TO_DATE('2023-05-18','YYYY-MM-DD'), NULL);
INSERT INTO borrowings VALUES(1000010, 10010, 100009, 109, TO_DATE('2023-05-19','YYYY-MM-DD'),TO_DATE( '2023-05-28','YYYY-MM-DD'));


-- Inserting data into the fine table
INSERT INTO fine VALUES(1000,1000001, 50,TO_DATE('2023-05-26','YYYY-MM-DD'));
INSERT INTO fine VALUES(1001, 1000003, 0,TO_DATE('2023-05-31','YYYY-MM-DD'));
INSERT INTO fine VALUES(1002, 1000005, 75,TO_DATE('2023-05-30','YYYY-MM-DD') );
INSERT INTO fine VALUES(1003, 1000007, 0,TO_DATE('2023-05-24','YYYY-MM-DD') );
INSERT INTO fine VALUES(1004, 1000008, 25,TO_DATE('2023-05-31','YYYY-MM-DD') );
INSERT INTO fine VALUES(1005, 1000010, 0,TO_DATE('2023-05-29','YYYY-MM-DD') );


-- Displaying table data using SELECT command
select * from patron;
select * from book;
select * from librarians;
select * from borrowings;
select * from fine;
select * from patron where NAME ='A';

--nested subquery
select * from patron where patron_id = ( select patron_id from borrowings where borrowing_id = (select borrowing_id from fine where fine_id = 1005));

-- update the data in the table
select * from book where book_id = 100005;
update book set name='Harry potter and the half blood prince' where book_id = 100005;
select * from book where book_id = 100005;


-- deleting row from a table
INSERT INTO patron VALUES(10011,'k','k@google.com',9999999999,8);
select * from patron where patron_id = 10011;
delete from patron where patron_id = 10011;


--union, intersect
select name from book where genre='Classic' union select name from book where genre='Romance';

select name from book where genre='Classic' intersect select name from book where availability_status='available';

--with clause
with max_borrow(val) as (select max(no_of_borrowings) from patron) select * from patron,max_borrow where patron.no_of_borrowings=max_borrow.val;


--Aggregate function
select count(*) from patron;
select max(no_of_borrowings) from patron;
select avg(fine_ammount) from fine;

--Group by and Having
select genre,count(*) as no_of_books from book group by genre having count(*)<3 ;


--Nested subquery
select * from patron where patron_id=(select patron_id from borrowings where borrowing_id = (select borrowing_id from fine where fine_id=1001));

--Set Membership(AND, OR,NOT)
select * from book where genre ='Classic' and book_id in (select book_id from borrowings);

select * from patron where no_of_borrowings>2 or patron_id in(select patron_id from borrowings where borrowing_id not in(select borrowing_id from fine));

--some/all/exists/unique
select name from patron where no_of_borrowings>some(select no_of_borrowings from patron where no_of_borrowings>3);

select name from patron where no_of_borrowings>all(select no_of_borrowings from patron where no_of_borrowings<5);

select name from book where genre='Classic' and exists(select * from borrowings);


--String operations
select name from book where name like '%To%';
select name from book where name like 'The%';

--Join operations
select * from patron natural join borrowings where name='C';
select name from patron join borrowings using(patron_id);

--views
drop view fantasy;
create view fantasy as select * from book where genre='Fantasy';
select * from fantasy;








