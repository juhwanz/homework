<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Login Process</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    * {
        background-color: lightblue;
        font-family: Arial, sans-serif;
    }
    p {
        text-align: center;
        font-size: 24px;
    }
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

PreparedStatement pstmt = null;
ResultSet rs = null;
try {
    String sql = "SELECT * FROM Member WHERE id = ? AND passwd = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, passwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        out.println("<p>로그인이 성공했습니다.</p>");
    } else {
        out.println("<p>로그인이 실패했습니다. 아이디 또는 비밀번호를 확인하세요.</p>");
    }
} catch (SQLException ex) {
    out.println("<p>로그인이 실패했습니다.<br>");
    out.println("SQLException: " + ex.getMessage() + "</p>");
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>
<form>
    <button type="button" onclick="returnHome();">확인</button>
</form>
<script type="text/javascript">
    function returnHome() {
        window.location.href = "main.jsp";
    }
</script>
</body>
</html>
