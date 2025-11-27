<%@ page import="kr.java.mybatis.domain.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이바티스 게시판 프로젝트</title>
</head>
<body>
    <nav>
        <a href="<%= request.getContextPath() %>/" >메인페이지</a>
    </nav>
    <h1>게시글 상세</h1>
    <% UserInfo uiWithPosts = (UserInfo) request.getAttribute("posts"); %>
    <% UserInfo uiWithLikedPosts = (UserInfo) request.getAttribute("likedPosts"); %>
    <div>
        <p><%= uiWithPosts.getPosts() %></p>
        <p><%= uiWithLikedPosts.getLikedPosts() %></p>
    </div>
</body>
</html>
