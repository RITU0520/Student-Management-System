# Student Management System (CRUD)

A small Java web application demonstrating Create, Read, Update, and Delete (CRUD) operations using Java Servlet, JSP, JDBC, and MySQL.

## Features
- Add a student
- List all students
- Edit student details
- Delete a student
- Prepared statements for SQL operations
- Maven build and WAR deployment

## Technology stack
- Java 8 or later
- Java Servlet API 4.0
- JSP and JSTL
- JDBC
- MySQL
- Apache Tomcat 9
- Maven

> This project uses the `javax.servlet` namespace and is intended for Tomcat 9. Tomcat 10+ uses `jakarta.servlet` and requires code/dependency changes.

## Project structure

```text
Student-Management-System/
├── src/main/java/com/student/
│   ├── DBConnection.java
│   ├── Student.java
│   ├── StudentDAO.java
│   └── StudentServlet.java
├── src/main/webapp/
│   ├── index.jsp
│   ├── student-form.jsp
│   ├── student-list.jsp
│   └── WEB-INF/web.xml
├── database.sql
├── pom.xml
├── .gitignore
└── README.md
```

## Setup

1. Install JDK, Maven, MySQL, and Apache Tomcat 9.
2. Run `database.sql` in MySQL Workbench or another MySQL client.
3. Configure database credentials using environment variables:
   - `DB_URL` (optional; default is `jdbc:mysql://localhost:3306/student_db`)
   - `DB_USER` (optional; default is `root`)
   - `DB_PASSWORD` (required if your MySQL user has a password)
4. Build from the project root:

   ```bash
   mvn clean package
   ```

5. Deploy `target/StudentManagement.war` to Tomcat 9's `webapps` directory, or run it from Eclipse.
6. Open `http://localhost:8080/StudentManagement/`.

## Database configuration

The app reads database settings from environment variables, so database passwords do not need to be stored in source code. If `DB_PASSWORD` is not set, the app uses an empty password; adjust this for your local MySQL setup.

## CRUD mapping

| Operation | Method | Description |
|---|---|---|
| Create | POST `/students` with `action=insert` | Add a student |
| Read | GET `/students` | List students |
| Update | POST `/students` with `action=update` | Update a student |
| Delete | POST `/students` with `action=delete` | Delete a student |

## Notes
- This is an educational starter project, not a production-ready application.
- Before public deployment, add authentication/authorization, CSRF protection, stronger validation, and production-grade error handling.
- Do not commit real passwords, tokens, or other secrets.


## Docker deployment

A `Dockerfile` is included for hosting on a Docker-compatible platform. Push the repository to GitHub, create a hosted MySQL database, and configure `DB_URL`, `DB_USER`, and `DB_PASSWORD` as environment variables in your hosting dashboard. Run `database.sql` against the hosted database, then deploy the repository as a Docker service. See `DEPLOYMENT.md` for details.
