<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 작성</title>
</head>
<body>
    <h1>글 작성</h1>
    <form action="<%= request.getContextPath() %>/posts/create" method="post">
        <input name="title" placeholder="title"><br />
        <input name="content" placeholder="content"><br />
        <button>작성</button>
    </form>
</body>
</html>
