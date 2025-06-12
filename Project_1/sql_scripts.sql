--Which Books Are Most Borrowed?
SELECT b.title, COUNT(*) AS borrow_count
FROM borrow_records br
JOIN books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;


--Average Borrow Duration.
SELECT 
    AVG(return_date - borrow_date) AS avg_borrow_days
FROM borrow_records
WHERE return_date IS NOT NULL;


--Which members have the most active borrows?
SELECT m.name, COUNT(*) AS active_borrows
FROM borrow_records br
JOIN members m ON br.member_id = m.member_id
WHERE br.return_date IS NULL
GROUP BY m.name
ORDER BY active_borrows DESC;


--Books by Genre and Availabilty.
SELECT m.name, COUNT(*) AS active_borrows
FROM borrow_records br
JOIN members m ON br.member_id = m.member_id
WHERE br.return_date IS NULL
GROUP BY m.name
ORDER BY active_borrows DESC;