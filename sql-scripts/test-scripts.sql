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
where b.book_id = 1;

SELECT c.category_name FROM book b
JOIN book_category bc ON b.book_id = bc.book_book_id
JOIN category c ON bc.category_category_id = c.category_id
WHERE b.book_id = 2;

INSERT INTO borrowing (borrowing_date, status, book_book_id, library_user_user_id)
VALUES ('2023-05-27', 'active', 2, 14);


select * from library_user WHERE school_id = 1;
select * from borrowing;
SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id = 3;
select * from reservation;

select * from school_book;


