package com.student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private StudentDAO dao;

    @Override
    public void init() {
        dao = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("new".equals(action)) {
                request.getRequestDispatcher("/student-form.jsp").forward(request, response);
                return;
            }

            if ("edit".equals(action)) {
                int id = parseId(request.getParameter("id"));
                Student student = dao.getStudentById(id);
                if (student == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
                    return;
                }
                request.setAttribute("student", student);
                request.getRequestDispatcher("/student-form.jsp").forward(request, response);
                return;
            }

            List<Student> students = dao.getAllStudents();
            request.setAttribute("students", students);
            request.getRequestDispatcher("/student-list.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID");
        } catch (SQLException e) {
            throw new ServletException("Database operation failed", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("insert".equals(action)) {
                dao.insertStudent(readStudent(request, 0));
            } else if ("update".equals(action)) {
                int id = parseId(request.getParameter("id"));
                if (!dao.updateStudent(readStudent(request, id))) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
                    return;
                }
            } else if ("delete".equals(action)) {
                int id = parseId(request.getParameter("id"));
                if (!dao.deleteStudent(id)) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
                    return;
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/students");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (SQLException e) {
            throw new ServletException("Database operation failed", e);
        }
    }

    private int parseId(String value) {
        int id = Integer.parseInt(value);
        if (id < 1) {
            throw new NumberFormatException("ID must be positive");
        }
        return id;
    }

    private Student readStudent(HttpServletRequest request, int id) {
        String name = clean(request.getParameter("name"));
        String email = clean(request.getParameter("email"));
        String course = clean(request.getParameter("course"));

        if (name.isEmpty() || email.isEmpty() || course.isEmpty()) {
            throw new IllegalArgumentException("Name, email, and course are required");
        }
        if (name.length() > 100 || email.length() > 100 || course.length() > 100) {
            throw new IllegalArgumentException("Fields must be 100 characters or fewer");
        }
        return new Student(id, name, email, course);
    }

    private String clean(String value) {
        return value == null ? "" : value.trim();
    }
}
