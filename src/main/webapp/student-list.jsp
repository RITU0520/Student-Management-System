<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Students</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f1f5f9; padding: 30px 15px; }
        main { max-width: 1000px; margin: auto; background: white; padding: 25px; border-radius: 12px; overflow-x: auto; }
        .add, .edit, .delete { display: inline-block; padding: 8px 11px; border: 0; border-radius: 5px; color: white; text-decoration: none; cursor: pointer; font-size: 14px; }
        .add { background: #2563eb; }
        .edit { background: #15803d; }
        .delete { background: #dc2626; }
        table { width: 100%; border-collapse: collapse; margin-top: 22px; }
        th, td { text-align: left; border-bottom: 1px solid #e2e8f0; padding: 12px; }
        th { background: #eaf0f8; }
        form { display: inline; }
    </style>
</head>
<body>
<main>
    <h1>Student Management System</h1>
    <p>Manage student records with CRUD operations.</p>
    <a class="add" href="${pageContext.request.contextPath}/students?action=new">+ Add Student</a>

    <table>
        <thead>
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Course</th><th>Actions</th></tr>
        </thead>
        <tbody>
        <c:forEach var="s" items="${students}">
            <tr>
                <td><c:out value="${s.id}"/></td>
                <td><c:out value="${s.name}"/></td>
                <td><c:out value="${s.email}"/></td>
                <td><c:out value="${s.course}"/></td>
                <td>
                    <a class="edit" href="${pageContext.request.contextPath}/students?action=edit&id=${s.id}">Edit</a>
                    <form method="post" action="${pageContext.request.contextPath}/students"
                          onsubmit="return confirm('Are you sure you want to delete this student?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${s.id}">
                        <button class="delete" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty students}">
            <tr><td colspan="5">No students found. Add the first student.</td></tr>
        </c:if>
        </tbody>
    </table>
</main>
</body>
</html>
