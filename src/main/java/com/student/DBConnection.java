package com.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {

    private DBConnection() {
    }

    public static Connection getConnection() throws SQLException {

        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        if (url == null || url.trim().isEmpty()) {
            throw new SQLException("DB_URL is not configured.");
        }

        if (user == null || user.trim().isEmpty()) {
            throw new SQLException("DB_USER is not configured.");
        }

        if (password == null || password.isEmpty()) {
            throw new SQLException("DB_PASSWORD is not configured.");
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                "MySQL JDBC driver not found in the application.", e
            );
        }

        return DriverManager.getConnection(url, user, password);
    }
}
