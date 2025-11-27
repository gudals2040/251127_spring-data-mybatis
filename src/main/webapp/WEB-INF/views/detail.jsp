<%@ page import="kr.java.mybatis.domain.Post" %>
<%@ page import="kr.java.mybatis.domain.UserInfo" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이바티스 게시판 프로젝트</title>
</head>
<body>
    <nav>
        <a href="<%= request.getContextPath() %>/posts" >목록</a>
    </nav>
    <h1>게시글 상세</h1>
    <% Post p = (Post) request.getAttribute("post"); %>
    <% UserInfo ui = (UserInfo) session.getAttribute("loginUser"); %>
    <div>
        <p>제목 : <%= p.getTitle() %></p>
        <p>작성자 : <%= p.getAuthor().getNickname() %></p>
        <p>내용 : <%= p.getContent() %></p>
        <p>작성일시 : <%= p.getCreatedAt() %></p>
        <p>추천수 : <%= p.getLikeCount() %></p>
        <p>추천인 : <%= p.getLikedUsers() %></p>
        <form action="<%= request.getContextPath() %>/posts/<%= p.getId() %>/like" method="post">
            <button>
                <% if (p.getLikedUsers().stream()
                        .anyMatch(
                                (el) -> Objects.equals(el.getId(), ui.getId()))) { %>
                    추천 취소
                <% } else { %>
                    추천
                <% } %>
            </button>
        </form>
    </div>
</body>
</html>
