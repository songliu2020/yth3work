<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <style>
        p{
            color: #4cae4c;
        }
    </style>
</head>
<body>
<p>你输入的用户名：${username}</p>
</body>
</html>
