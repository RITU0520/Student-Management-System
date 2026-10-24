<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Form</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f1f5f9; padding: 35px 15px; }
        main { max-width: 480px; margin: auto; background: white; padding: 28px; border-radius: 12px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input { box-sizing: border-box; width: 100%; padding: 11px; margin-top: 6px; border: 1px solid #cbd5e1; border-radius: 5px; }
        button, .back { display: inline-block; margin-top: 20px; padding: 11px 16px; border: 0; border-radius: 5px; background: #2563eb; color: white; text-decoration: none; cursor: pointer; }
        .back { background: #64748b; }
    </style>
</head>
<body>
<main>
    <c:choose>
        <c:when test="${not empty student}"><h1>Edit Student</h1></c:when>
        <c:otherwise><h1>Add Student</h1></c:otherwise>
    </c:choose>

    <form action="${pageContext.request.contextPath}/students" method="post">
        <c:choose>
            <c:when test="${not empty student}">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${student.id}">
            </c:when>
            <c:otherwise>
                <input type="hidden" name="action" value="insert">
            </c:otherwise>
        </c:choose>

        <label for="name">Name</label>
        <input id="name" name="name" type="text" maxlength="100"
               value="<c:out value='${student.name}'/>" required>

        <label for="email">Email</label>
        <input id="email" name="email" type="email" maxlength="100"
               value="<c:out value='${student.email}'/>" required>

        <label for="course">Course</label>
        <input id="course" name="course" type="text" maxlength="100"
               value="<c:out value='${student.course}'/>" required>

        <button type="submit">Save Student</button>
        <a class="back" href="${pageContext.request.contextPath}/students">Cancel</a>
    </form>
</main>
</body>
</html>
