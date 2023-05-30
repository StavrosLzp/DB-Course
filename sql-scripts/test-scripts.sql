SET PASSWORD FOR root@localhost=''; 

-- for VS CODE connection
CREATE USER 'sqluser'@'%' IDENTIFIED WITH mysql_native_password BY '';
GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%';
FLUSH PRIVILEGES;

use library;

select * from author;

select b.book_title from book b
	inner join book_author ba
    on b.book_id = ba.book_book_id
    inner join author a
    on a.author_id = ba.author_author_id
where a.author_id = 10;

select a.author_first_name from author a
	inner join book_author ba
    on a.author_id = ba.author_author_id
    inner join book b
	on b.book_id = ba.book_book_id
where b.book_id = 3;

SELECT c.category_name FROM book b
JOIN book_category bc ON b.book_id = bc.book_book_id
JOIN category c ON bc.category_category_id = c.category_id
WHERE b.book_id = 2;

INSERT INTO borrowing (borrowing_date, borrowing_status, book_book_id, library_user_user_id)
VALUES (CURDATE(), 'active', 12, 22);

INSERT INTO reservation (reservation_date, book_book_id, library_user_user_id)VALUES (CURDATE(), 1, 11);
INSERT INTO reservation (reservation_date, book_book_id, library_user_user_id)VALUES (CURDATE(), 1, 12);
INSERT INTO reservation (reservation_date, book_book_id, library_user_user_id)VALUES (CURDATE(), 1, 13);
INSERT INTO reservation (reservation_date, book_book_id, library_user_user_id)VALUES (CURDATE(), 1, 14);
select * from reservation;

INSERT INTO  borrowing (borrowing_date, book_book_id, library_user_user_id)VALUES (CURDATE(), 1, 14);

select * from library_user WHERE school_id = 1;
select * from borrowing where library_user_user_id = 82;

SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id = 3;
select * from reservation;
delete from reservation Where book_book_id = 1 AND reservation_status = 'awaiting_pick_up';

select * from library_user WHERE role_id = 3;


select * from school_book;

select * from library_user;

select role_id FROM library_user
WHERE username = 'Up' AND user_password = 'Pass';


SELECT s.school_id, s.school_name, COUNT(b.borrowing_id) AS borrowings_count
FROM school s
LEFT JOIN library_user u ON s.school_id = u.school_id
LEFT JOIN borrowing b ON u.user_id = b.library_user_user_id
WHERE b.borrowing_status ='active'
GROUP BY s.school_id;

select * from school;


select * from library_user where role_id = 4;

select * from library_user u 
Left join borrowing b ON u.user_id = b.library_user_user_id;

INSERT INTO borrowing (borrowing_date, borrowing_status, book_book_id, library_user_user_id)
VALUES (CURDATE(), 'active', 12, 82);

select * from library_user u 
Left join borrowing bo ON u.user_id = bo.library_user_user_id
left join book b on b.book_id = bo.book_book_id
left join book_category bc on bc.book_book_id = b.book_id
left join category c on c.category_id = bc.category_category_id
where c.category_name = "Poetry"
and u.role_id = 3; 

select * from category;

select a.author_id, a.author_first_name, a.author_last_name from author a
left join book_author ba ON  ba.author_author_id = a.author_id
left join book b on b.book_id = ba.book_book_id
left join book_category bc on bc.book_book_id = b.book_id
left join category c on c.category_id = bc.category_category_id
where c.category_name = "Poetry"
group by a.author_id
order by a.author_id;

INSERT INTO borrowing (book_book_id,library_user_user_id,borrowing_date,borrowing_status)            VALUES ("33", "7", "2022-03-07", "returned");
INSERT INTO borrowing (book_book_id,library_user_user_id,borrowing_date)            VALUES ("33", "7", "2022-03-07");



-- 3.1.3 
SELECT u.user_id, u.user_first_name, u.user_last_name, COUNT(b.borrowing_id) AS num_books_borrowed
FROM library_user u
JOIN borrowing b ON u.user_id = b.library_user_user_id
WHERE datediff(NOW(),u.user_birthdate) < 40 * 365
AND u.role_id = 3
GROUP BY u.user_id
ORDER BY num_books_borrowed DESC;

