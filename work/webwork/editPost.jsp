<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, org.apache.commons.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
int id = Integer.parseInt(request.getParameter("id"));
pstmt = conn.prepareStatement("SELECT * FROM posts WHERE id = ?");
pstmt.setInt(1, id);
rs = pstmt.executeQuery();
if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
    <form action="updatePost.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
    제목: <input type="text" name="title" value="<%= rs.getString("title") %>"><br>
    내용: <textarea name="content"><%= rs.getString("content") %></textarea><br>
    <!-- 기존 파일 다운로드 링크 -->
    <p>첨부 파일: <a href="downloadFile.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("file_name") %></a></p>
    <!-- 새 파일 선택 input -->
    <p>새로운 파일 선택: <input type="file" name="newFile"></p>
    <input type="submit" value="수정">
    </form>
    <!-- 게시판 목록으로 돌아가는 링크 -->
    <a href="board.jsp">목록으로</a>
    </body>
    </html>
    <%
} else {
out.println("해당 게시물을 찾을
수 없습니다.");
}
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