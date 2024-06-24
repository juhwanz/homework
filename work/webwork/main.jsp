<%@ include file="dbconn2.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        pstmt = conn.prepareStatement("SELECT * FROM poste");
        rs = pstmt.executeQuery(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
</style>
</head>
<body>
    <h1>게시판</h1>
    <!-- 글 쓰기 링크 -->
    <a href="writePost.jsp">글 쓰기</a>
    <h2>게시물 목록</h2>
    <table>
    <tr>
    <th>제목</th>
    <th>내용</th>
    <th>첨부 파일</th>
    <th>수정</th>
    <th>삭제</th>
    </tr>
    <% while(rs.next()) { %>
    <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("content") %></td>
            <td><a href="downloadFile.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("file_name") %></a></td>
    <!-- 수정 폼으로 이동하는 링크 -->
            <td><a href="editPost.jsp?id=<%= rs.getInt("id") %>">수정</a></td>
    <!-- 삭제 폼으로 이동하는 링크 -->
            <td><a href="deletePost.jsp?id=<%= rs.getInt("id") %>">삭제</a></td>
    </tr>
    <% } %>
    </table>
    </body>
    </html>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }   
    }
%>