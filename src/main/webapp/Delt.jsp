<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;

    String id = request.getParameter("id");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcURL = "jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002";
        conn = DriverManager.getConnection(jdbcURL);

        String deleteQuery = "DELETE FROM message WHERE id = ?";
        pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setInt(1, Integer.parseInt(id));
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("submition.jsp");
        } else {
            out.println("<p>Message not found.</p>");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p>An error occurred while deleting the message.</p>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

