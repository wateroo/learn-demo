<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <base
            href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="resources/jquery/jquery-2.1.1.min.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <style></style>
    <title>error</title>
    <script type="text/javascript">
        $(function () {
            $("#back").click(function () {
                window.history.back();
            });
        });
    </script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div>
                <a class="navbar-brand" href="index.html" style="font-size: 32px;">回到首页</a>
            </div>
        </div>
    </div>
</nav>

<div class="container" style="text-align: center;">
    <h2 class="form-signin-heading">
        <i class="glyphicon glyphicon-log-in"></i><span>详细信息</span>
    </h2>
    <h2>抱歉！您没有权限访问所请求的资源！</h2>
    <br/>
    <a href="javascript:void(0)" onclick="goBack()" id="back">返回上一页</a>
</div>
</body>
</html>