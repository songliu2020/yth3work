<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <!--******** css ********************************************--->
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
    <style>
        form{
            border-color: #d5d5d5;
            border-style: solid;
            border-width: 1px;
            border-radius: 10px;
            padding: 0 20px;
            background-color: #dff0d8;
        }
    </style>
</head>
<body>
<div class="container">
    <tags:nav/><!--导航菜单-->
    <div class="row" style="margin-top: 100px">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <form action="${ctx}/login" method="post" class="form-horizontal" role="form">
                <h1 class="text-center">用户登录</h1>
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">用户名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">密码:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="password"  name="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <p style="color: #b92c28">${message}</p
                    </div>
                </div>
                <div class="form-group" style="margin-top: 35px">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn btn-primary" style="width: 60%;margin-left: 10px">登录</button>
                    </div>
                </div>
            </form>
            <%--    <c:if test="message!=''">--%>
        </div>
        <div class="col-md-4">
        </div>
    </div>

<%--    </c:if>--%>
</div>
<!--******** js ********************************************--->
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
