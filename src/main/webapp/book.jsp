<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="addBook.jsp">
    <label>Title:</label><input type="text" name="title" required><br>
    <label>Author:</label><input type="text" name="author" required><br>
    <label>ISBN:</label><input type="text" name="ISBN" required><br>
    <input type="submit" value="Add Book">
</form>
</body>
</html>