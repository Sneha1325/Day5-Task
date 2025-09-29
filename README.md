# Day5-Task
# Library Database – JOIN Query Examples

This document contains SQL examples of different types of joins (LEFT, RIGHT, INNER, FULL OUTER) based on a Library database.

---

## 🗂️ Tables Involved

- **Books** (Book_Id, Title, Price, Author_Id)
- **Author** (Author_Id, Author_Name)
- **Member** (Member_Id, Name)
- **Staff** (Staff_Id, Staff_Name, Designation)
- **Loan** (Loan_Id, Member_Id, Book_Id, Staff_Id, Issue_Date, Return_Date, Amount)

---

## 📝 Queries in This File

### 1️⃣ LEFT JOIN – Books with Authors
Shows all books, their price, and the author’s name (if exists):

```sql
SELECT Books.Title AS Book_name,
       Books.Price AS Price,
       Author.Author_Name AS Author
FROM Books
LEFT JOIN Author
ON Books.Author_Id = Author.Author_Id;
```

### 2️⃣ RIGHT JOIN – Staff who issued books & Member names
Shows staff details and members for each loan (even if some member/loan missing):

```sql
SELECT Staff.Staff_Id,
       Staff.Staff_Name,
       Loan.Issue_Date AS Given_Date,
       Member.Name AS Student_Name
FROM Member
RIGHT JOIN Loan
ON Loan.Member_Id = Member.Member_Id
RIGHT JOIN Staff
ON Staff.Staff_Id = Loan.Staff_Id
WHERE Member.Name IS NOT NULL;
```

### 3️⃣ INNER JOIN – Only Books whose Author exists
Shows books and their authors, but only where the author exists:

```sql
SELECT Books.Book_Id,
       Books.Title,
       Author.Author_Name
FROM Books
INNER JOIN Author
ON Books.Author_Id = Author.Author_Id;
```

### 4️⃣ FULL OUTER JOIN (simulated in MySQL)
MySQL doesn’t support FULL OUTER JOIN directly. Combine LEFT JOIN + RIGHT JOIN using `UNION`:

```sql
SELECT Books.Book_Id, Books.Title, Author.Author_Name
FROM Books
LEFT JOIN Author
ON Books.Author_Id = Author.Author_Id

UNION

SELECT Books.Book_Id, Books.Title, Author.Author_Name
FROM Books
RIGHT JOIN Author
ON Books.Author_Id = Author.Author_Id;
```

This returns:
- All books (even if no author)
- All authors (even if no book)

---

