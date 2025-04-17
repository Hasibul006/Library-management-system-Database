--PL/SQL variable declaration and print value

set serveroutput on
declare 
name book.name%type;
author book.author%type;
begin
select name,author into name,author from book where name='1984';
dbms_output.put_line(name || ' '||author);
end;
/

--Row type
set serveroutput on
declare 
p patron%rowtype;
begin
select patron_id,name,email,contact_no,no_of_borrowings into p.patron_id,p.name,p.email,p.contact_no,p.no_of_borrowings from patron where name = 'D';
dbms_output.put_line(p.name || ' '||p.no_of_borrowings);

end;
/


--loop and cursor

set serveroutput on
declare 
cursor pat is select name from patron;
p patron.name%type;
begin
open pat;
loop 
  fetch pat into p;
  exit when pat%notfound;
dbms_output.put_line(p);
end loop;
close pat;
end;
/




--array and loop
DECLARE
   n NUMBER := 1;
   name2 book.name%TYPE;
   TYPE bookarray IS VARRAY(11) OF book.name%TYPE;
   A_NAME bookarray :=bookarray ();
BEGIN
   n := 1;
   FOR x IN 0..9
   LOOP
      SELECT name INTO name2 FROM book WHERE book_id = x+100000;
      A_NAME.EXTEND;
      A_NAME(n) := name2;
      n := n + 1;
   END LOOP;

   FOR i IN A_NAME.FIRST..A_NAME.LAST
   LOOP
      DBMS_OUTPUT.PUT_LINE(A_NAME(i));
   END LOOP;
END;
/


--if else

set serveroutput on
declare
num patron.no_of_borrowings%type;
begin
select no_of_borrowings into num from patron where name='B';
if(num = 0)then
  dbms_output.put_line('No book is borrowed');
elsif(num=1)then
   dbms_output.put_line('1 book is borrowed');
elsif(num=2)then
   dbms_output.put_line('2 books are borrowed');
elsif(num=2)then
   dbms_output.put_line('2 books are borrowed');
elsif(num=3)then
   dbms_output.put_line('3 books are borrowed');
else 
   dbms_output.put_line('more than 3 books are borrowed');
end if;
end;
/


--procedure
create or replace procedure insert_book(
  p_book_id   IN book.book_id%TYPE,
  p_name      IN book.name%TYPE,
  p_author    IN book.author%TYPE,
  p_genre     IN book.genre%TYPE,
  p_availability_status IN book.availability_status%TYPE
) AS
BEGIN
  insert into book values(p_book_id, p_name, p_author, p_genre, p_availability_status);
  
  dbms_output.put_line('Book inserted successfully.');
exception
  when DUP_VAL_ON_index then
    dbms_output.put_line('Error: Book with ID ' || p_book_id || ' already exists.');
  end;
/

BEGIN
  insert_book(100010, 'Database', 'JJJ', 'DBMS', 'available');
END;
/


--Trigger1

set serveroutput on
create or replace trigger insertion
after insert on book 
REFERENCING OLD AS o NEW AS n
for each row 
begin
INSERT INTO borrowings VALUES(1000013,10001,:n.book_id,100,TO_DATE('2023-05-10','YYYY-MM-DD'),TO_DATE('2023-05-24','YYYY-MM-DD'));
end;
/


--Trigger2

set serveroutput on
create or replace trigger deletion
after delete on borrowings 
referencing old as o new as n
for each row 
begin
delete from fine where borrowing_id = :o.borrowing_id;
end;
/


--Trigger3

set serveroutput on
create or replace trigger updating
after update on borrowings
referencing old as o new as n
for each row     
begin
delete from fine where borrowing_id = :o.borrowing_id;
end
/



