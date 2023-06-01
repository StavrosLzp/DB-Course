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
select * from school_book Where school_school_id = 1;
update school_book set school_book_amount = 3 Where school_school_id = 1;
update reservation set reservation_status = "awaiting_pick_up" WHERE reservation_id = 100;




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

-- 3.1.4
select a.author_id, a.author_first_name, a.author_last_name, b.book_id from author a
left join book_author ba ON  ba.author_author_id = a.author_id
left join book b on b.book_id = ba.book_book_id
WHERE NOT EXISTS(SELECT * from borrowing WHERE book_book_id = b.book_id);

-- 3.1.5
-- Loans_per_school_admin_this_year View :
SELECT op.user_id, op.user_first_name, op.user_last_name, COUNT(b.borrowing_id) AS borrowings_count from library_user op
LEFT JOIN school s ON s.library_admin_user_id = op.user_id
LEFT JOIN library_user u ON s.school_id = u.school_id
LEFT JOIN borrowing b ON u.user_id = b.library_user_user_id
WHERE u.user_id <> 0
AND YEAR(b.borrowing_date) = YEAR(NOW())
GROUP BY s.school_id;

SELECT op1.user_id, op1.user_first_name, op1.user_last_name, op2.user_id AS user2_user_id, op2.user_first_name AS user2_first_name, op2.user_last_name AS user2_last_name, op2.borrowings_count
FROM Loans_per_school_admin_this_year op1
Join Loans_per_school_admin_this_year op2 ON op1.user_id < op2.user_id AND op1.borrowings_count = op2.borrowings_count
WHERE op1.borrowings_count > 20;

select * from Loans_per_school_admin_this_year View;


-- 3.1.6
Select c1.category_name, c2.category_name from book b
join book_category bc1 ON bc1.book_book_id = b.book_id
join book_category bc2 ON bc2.book_book_id = b.book_id AND bc1.category_category_id < bc2.category_category_id
join category c1 ON bc1.category_category_id = c1.category_id
join category c2 ON bc2.category_category_id = c2.category_id
order by c1.category_id, c2.category_id;

Select c1.category_name, c2.category_name AS category2_name, count(*) AS comb_amount from book b
join book_category bc1 ON bc1.book_book_id = b.book_id
join book_category bc2 ON bc2.book_book_id = b.book_id AND bc1.category_category_id < bc2.category_category_id
join category c1 ON bc1.category_category_id = c1.category_id
join category c2 ON bc2.category_category_id = c2.category_id
group by c1.category_id, c2.category_id
order by comb_amount Desc;


-- 3.1.7
-- books_written_per_author View :
select a1.author_id, a1.author_first_name, a1.author_last_name, count(b.book_id) AS books_written from author a1
left join book_author ba ON  ba.author_author_id = a1.author_id
left join book b on b.book_id = ba.book_book_id
group by a1.author_id
order by a1.author_id asc;


select author_id, author_first_name, author_last_name, books_written from books_written_per_author
where books_written <= (SELECT MAX(books_written) - 5 from books_written_per_author);





-- 3.2.1
SELECT book_id, book_title FROM book 
WHERE book_title like "Understand may story governm"
order by book_id;

SELECT b.book_id, b.book_title, c.category_name FROM book b
left join school_book sb on b.book_id = sb.book_book_id 
left join book_category bc on b.book_id = bc.book_book_id 
left join category c on c.category_id = bc.category_category_id
WHERE sb.school_school_id = 2
AND b.book_title like "%%" 
AND c.category_name like "%s%"
order by book_id;

SELECT b.book_id, b.book_title FROM book b
                left join school_book sb on b.book_id = sb.book_book_id
                left join book_category bc on b.book_id = bc.book_book_id
                WHERE sb.school_school_id = 4
                AND b.book_title like "%Smile%"
                AND bc.category_category_id = 1order by book_id;

SELECT b.book_id, b.book_title, sb.school_book_amount FROM book b
                left join school_book sb on b.book_id = sb.book_book_id ;
                
-- 3.2.2
-- View library_user_days_due
SELECT u.user_id, u.user_first_name, u.user_last_name, u.school_id, count(b.borrowing_id) AS currently_borrowed, max(datediff(curdate(), b.borrowing_date)) - 7 AS days_due from library_user u
left join borrowing b ON b.library_user_user_id = u.user_id
Where b.borrowing_status = "active"
group by u.user_id
order by days_due desc;



SELECT user_id, user_first_name, user_last_name, currently_borrowed, days_due FROM library_user_days_due
WHERE days_due > 0;

select * from reservation;
INSERT INTO reservation (book_book_id,library_user_user_id)        VALUES ("75", "17");	


-- 3.2.3
SELECT library_user_user_id, u.user_first_name, u.user_last_name, AVG(review_rating) AS average_rating
FROM review
left join library_user u ON u.user_id = library_user_user_id
Where school_id = 1
GROUP BY library_user_user_id;

SELECT c.category_name, AVG(r.review_rating) AS average_rating
FROM category c
JOIN book_category bc ON c.category_id = bc.category_category_id
JOIN book b ON bc.book_book_id = b.book_id
LEFT JOIN review r ON b.book_id = r.book_book_id
left join library_user u ON u.user_id = r.library_user_user_id
WHERE u.school_id = 1
GROUP BY c.category_id;




