Use Library;


-- Left Join
Select Books.Title as Book_name,Books.Price as Price,Author.Author_Name as Author From Books 
Left Join Author 
On Books.Author_Id=Author.Author_Id;

-- Right Join
Select Staff.Staff_id,Staff.Staff_Name,Loan.Issue_Date as Given_Date,Member.Name as Student_Name From Member
Right join Loan 
on Loan.Member_Id=Member.Member_ID
Right join Staff on Staff.Staff_Id=Loan.Staff_Id
Where Member.Name is not null ;

-- Inner Join
SELECT Books.Book_Id,Books.Title,Author.Author_Name FROM Books
INNER JOIN Author
ON Books.Author_Id = Author.Author_Id;

-- Full Join
SELECT Books.Book_Id,Books.Title,Author.Author_Name
FROM Books
LEFT JOIN Author
ON Books.Author_Id = Author.Author_Id

UNION

SELECT Books.Book_Id,Books.Title,Author.Author_Name
FROM Books
RIGHT JOIN Author
ON Books.Author_Id = Author.Author_Id;
    
    
