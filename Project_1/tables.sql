-- Authors Table
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Books Table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT REFERENCES authors(author_id) ON DELETE CASCADE,
    genre VARCHAR(100),
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

-- Members Table
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);

-- Borrowing Records Table
CREATE TABLE borrow_records (
    record_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    borrow_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);