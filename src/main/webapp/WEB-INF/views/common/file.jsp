<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>列表</title>
    <!--******** css ********************************************--->
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
    <style>
        .div-border{
            border-color: #d5d5d5;
            border-style: solid;
            border-width: 1px;
            border-radius: 5px;
            margin-top: 50px;
            padding: 0 20px;
        }
        .btn-sub{
            margin-top: 20px;
            width: 60px;
        }
    </style>
</head>
<body>
<div class="container">
    <tags:nav/><!--导航菜单-->
    <div class="div-border">
        <h2>文件上传(表单)</h2>
        <form action="${ctx}/file/upload" method="post" enctype="multipart/form-data">
            <input type="file" name="file">
            <input class="btn btn-primary btn-sub" type="submit" value="提交">
        </form>

        <hr>
        <h2>文件下载</h2>
        <a href="${ctx}/file/download">文件下载</a>
    </div>

</div>
<!--******** js ********************************************--->
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
