# Library Management System (Database)

## Project Overview

This project implements a **Library Management System** using PostgreSQL. It consists of a set of tables designed to track books, authors, library members, and borrowing records. The system is structured to store and manage information about books, authors, and members of the library, as well as monitor the borrowing and return process of books.

## Tables in the Database

### 1. `authors` Table

The `authors` table stores information about the authors of the books in the library.

- **Columns:**
  - `author_id`: A unique identifier for each author (Primary Key).
  - `name`: The name of the author.

### 2. `books` Table

The `books` table holds information about each book available in the library. It is linked to the `authors` table via the `author_id`.

- **Columns:**
  - `book_id`: A unique identifier for each book (Primary Key).
  - `title`: The title of the book.
  - `author_id`: Foreign key linking to the `authors` table.
  - `genre`: The genre of the book.
  - `published_year`: The year the book was published.
  - `available`: A boolean indicating whether the book is available for borrowing.

### 3. `members` Table

The `members` table contains information about the library members, such as their name, email, and the date they joined the library.

- **Columns:**
  - `member_id`: A unique identifier for each member (Primary Key).
  - `name`: The name of the member.
  - `email`: The email address of the member.
  - `join_date`: The date the member joined the library.

### 4. `borrow_records` Table

The `borrow_records` table tracks the borrowing history of books by members. It records the date the book was borrowed and returned.

- **Columns:**
  - `record_id`: A unique identifier for each borrowing record (Primary Key).
  - `book_id`: Foreign key linking to the `books` table, indicating which book was borrowed.
  - `member_id`: Foreign key linking to the `members` table, indicating which member borrowed the book.
  - `borrow_date`: The date the book was borrowed.

## Relationships

- **`authors` to `books`**: One author can have many books, but each book has only one author.
- **`books` to `borrow_records`**: One book can be borrowed many times, but each borrowing record refers to a single book.
- **`members` to `borrow_records`**: One member can borrow multiple books, but each borrowing record belongs to a single member.

## Usage

The system allows users to:

1. Add new authors, books, and members to the library.
2. Record book borrowing and returning actions.
3. Query the database to get a list of available books, books borrowed by specific members, and overdue books.
4. Track the borrowing history of books and members.


