<%@ page import="kr.java.mybatis.domain.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이바티스 게시판 프로젝트</title>
</head>
<body>
    <h1>마이바티스 게시판 프로젝트</h1>
    <% if (session.getAttribute("loginUser") == null) { %>
    <nav>
        <a href="register">회원가입</a>
        <a href="login">로그인</a>
    </nav>
    <% } else { %>
    <nav>
        <p>
            <% UserInfo info = (UserInfo) session.getAttribute("loginUser"); %>
            <%= info.getUserLogin().getUsername() %> <br>
            <%= info.getNickname() %> <br>
            <%= info.getEmail() %>
        </p>
        <a href="posts">글 목록</a>
        <a href="posts/create">글 작성</a>
        <a href="profile">프로필</a>
    </nav>
    <% } %>
</body>
</html>
