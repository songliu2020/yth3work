<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>登录失败</title>
<%--    <style>--%>
<%--        p{--%>
<%--            color: #b92c28;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<p>用户${username}登录失败</p>
</body>
</html>
