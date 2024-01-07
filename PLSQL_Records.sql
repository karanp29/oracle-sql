

declare
type book is record
(title varchar2(50),
author varchar2(50),
bookid int
);
Book1 book;
Book2 book;

begin
Book1.title:='Master of Comp App';
Book1.author:='KP';
Book1.bookid:=201;

Book2.title:='Master of KP';
Book2.author:='PS';
Book2.bookid:=202;
dbms_output.put_line('Book1 details');
dbms_output.put_line('****************');
dbms_output.put_line('Book1 Title: '||Book1.title);
dbms_output.put_line('Book1 Author: '||Book1.author);
dbms_output.put_line('Book1 Subject: '|| Book1.bookid);
dbms_output.put_line('Book2 details');
dbms_output.put_line('****************');
dbms_output.put_line('Book1 Title: '||Book2.title);
dbms_output.put_line('Book1 Author: '||Book2.author);
dbms_output.put_line('Book1 Subject: '|| Book2.bookid);
end;
/
