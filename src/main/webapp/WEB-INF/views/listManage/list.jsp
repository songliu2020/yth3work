<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2020/6/27
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章列表</title>
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
    </style>
    <script>
        $(document).ready(function(){
            $("#btn_Create").click(function(){
                window.location.href="${ctx}/listManager/create";
            }) ;
            $(".cla_delete").bind("click",function () {
                if (confirm("确定要删除吗？")){
                    var id=$(this).attr("id");
                    window.location.href="${ctx}/listManager/delete/"+id;
                }
            });
            $(".cla_edit").bind("click",function () {
                window.location.href="${ctx}/listManager/update/${dict.id}";
            })
            $("#btn_Delete").bind("click",function () {
                var count = $("input[name='chkIds']:checked").length;
                if(count<1){
                    alert("至少勾选一项")
                }else{
                    if (confirm("确定要删除所选项吗？")){
                        $("#listFrm").attr({action:"${ctx}/listManager/delete", method:"POST"})
                        $("#listFrm").submit();
                    }
                }

            });
            checkAllFunction("#chkAll","chkIds");
        });
    </script>
</head>
<body>
<div class="container">
    <tags:nav/>
    <div class="div-border">
        <div class="page-header">
            <h3>栏目管理</h3>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-default" id="btn_Create">创建</button>
                <button type="button" class="btn btn-danger" id="btn_Delete">批量删除</button>
            </div>
            <div class="col-md-12">
                <form class="form-search" method="post" action="#">
                    <label>名称：</label> <input type="text" name="s_LIKE_name" class="input-medium" value="${param.s_LIKE_name}">
                    <button type="submit" class="btn btn-primary"><i class="icon-search"></i> Search</button>
                </form>
            </div>
        </div>
        <form id="listFrm">
            <table id="contentTable" class="table table-striped table-hover">
                <thead><tr>
                    <th><input type="checkbox" id="chkAll"></th>
                    <th>栏目号</th>
                    <th>栏目名称</th>
                    <th>栏目状态</th>
                    <th>管理</th></tr></thead>
                <tbody>
                <c:forEach items="${listManagers.content}" var="dict" varStatus="idxStatus">
                    <tr>
                        <td><input type="checkbox" name="chkIds" value="${listManager.id}"></td>
                        <td>${idxStatus.index+1}</td>
                        <td>${listManager.name}</td>
                        <td>${listManager.status.desc}</td>
                        <td>
                            <a href="${ctx}/dict/update/${listManager.id}">编辑</a>
                                <%--                    <a href="#" class="cla_edit" id="${dict.id}">编辑</a>--%>
                            |
                            <a href="#" class="cla_delete" id="${listManager.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <tags:pagination page="${listManagers}" paginationSize="${PAGE_SIZE}"/>
        </form>
    </div>

</div>

<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>