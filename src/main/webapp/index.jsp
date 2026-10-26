<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Management System</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f1f5f9; margin: 0; padding: 60px 20px; }
        main { max-width: 650px; margin: auto; background: white; padding: 36px; border-radius: 12px; text-align: center; }
        a { display: inline-block; background: #2563eb; color: white; padding: 12px 18px; border-radius: 6px; text-decoration: none; }
    </style>
</head>
<body>
<main>
    <h1>Student Management System</h1>
    <p>A simple CRUD web application built with Java Servlet, JSP, JDBC, and MySQL.</p>
    <a href="${pageContext.request.contextPath}/students">Manage Students</a>
</main>
</body>
</html>
