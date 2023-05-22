USE library;

DELETE FROM BOOK;

INSERT INTO `book` (`book_ISBN`, `book_title`, `book_page_no`, `book_subject`, `book_language`) VALUES (77, 'Nisi dolores consequatur ut cumque ratione doloribus.', 2174699, 'Et sit optio aut placeat expedita eius autem.', 'de');
INSERT INTO `book` (`book_ISBN`, `book_title`, `book_page_no`, `book_subject`, `book_language`) VALUES (244, 'Qui assumenda ut dolores nobis doloremque perspiciatis.', 274004859, 'Natus architecto sed non perferendis aut nemo', 'ru');
INSERT INTO `book` (`book_ISBN`, `book_title`, `book_page_no`, `book_subject`, `book_language`) VALUES (755, 'Facere aliquam rerum illo saepe non mollitia.', 0, 'Similique facilis hic nostrum autem dolor inv', 'cn');

INSERT INTO school (school_name, school_principal_name, school_admin_name, school_mail_address, city, school_phone_number,school_email) VALUES ('ECE NTUA','Koziris','test_admin','zografou','Athens','6980004000','testemail@gmail.com');

select * from school;