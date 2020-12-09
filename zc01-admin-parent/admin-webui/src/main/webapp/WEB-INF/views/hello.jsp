<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <base
            href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="resources/jquery/jquery-2.1.1.min.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/layer/layer.js"></script>
</head>
<body>
<div class="container">
    <form id="form">
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2">序号</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="id"/>
                </div>
                <label class="control-label col-sm-2">用户名</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="userName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">昵称</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="nickName"/>
                </div>
                <label class="control-label col-sm-2">密码</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="password" placeholder="请输入密码"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">注册时间</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="createTime"/>
                </div>
                <label class="control-label col-sm-2">密码</label>
                <div class="col-sm-4">
                    <select class="form-control" name="roleDesc">
                        <option value="0" selected="selected">请选择</option>
                        <optgroup label="管理员">
                            <option value="1">ADMIN</option>
                            <option value="2">ROOT</option>
                        </optgroup>
                        <optgroup label="普通用户">
                            <option value="3">Normal User</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">文本域</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="5" id="jsonText" style=" resize:vertical;"
                              name="textArea"></textarea>
                </div>
            </div>


            <div class="form-group">
                <label class="control-label col-sm-2 checkbox sr-only"></label>
                <div class="col-sm-4">
                    <div class="checkbox">
                        <label class="checkbox-inline">
                            <input name="subject" type="checkbox" id="inlineCheckbox1" value="option1"> 语文
                        </label>
                        <label class="checkbox-inline">
                            <input name="subject" type="checkbox" id="inlineCheckbox2" value="option2"> 数学
                        </label>
                        <label class="checkbox-inline">
                            <input name="subject" type="checkbox" id="inlineCheckbox3" value="option3"> 英语
                        </label>
                    </div>
                </div>
                <label class="control-label col-sm-2 sr-only">记住我?</label>
                <div class="col-sm-4">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="remenberMe"> 记住我?
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <div style="text-align: center;">
                        <button type="button" class="btn btn-default" id="a">layer弹框</button>
                        <button type="button" class="btn btn-default" id="b">数组-1</button>
                        <button type="button" class="btn btn-default" id="c">数组-2</button>
                        <button type="button" class="btn btn-default" id="d">数组-3</button>
                        <button type="button" class="btn btn-default" id="e">复杂对象</button>
                        <button type="button" class="btn btn-default">提交</button>
                        <button type="button" class="btn btn-default">提交</button>
                        <button type="button" class="btn btn-default">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
<script type="text/javascript">
    $("#a").click(function () {
        layer.msg("hello");
    });

    $("#b").click(function () {
        $.ajax({
            "url": "array1",			// 请求目标资源的地址
            "type": "post",						// 请求方式
            /**
             * 这种形式发送参数到后台，springMVC接收参数名字必须是'array[]'
             */
            "data": {							// 要发送的请求参数
                "array": [1, 2, 3]
            },
            "dataType": "json",					// 如何对待服务器端返回的数据
            "success": function (response) {		// 服务器端成功处理请求后调用的回调函数，response是响应体数据
                console.log(response);
            },
            "error": function (response) {		// 服务器端处理请求失败后调用的回调函数，response是响应体数据
                console.log(response);
            }
        });

    });

    $("#c").click(function () {
        $.ajax({
            "url": "array2",			// 请求目标资源的地址
            "type": "post",						// 请求方式
            /**
             * 这种形式发送参数到后台，springMVC接收参数可以使用一个对象去接受，
             * 但是对象中必须有个list类型的成员变量，名称也必须是“array”
             */
            "data": {							// 要发送的请求参数
                "array[0]": 5,
                "array[1]": 8,
                "array[2]": 12
            },
            "dataType": "json",					// 如何对待服务器端返回的数据
            "success": function (response) {		// 服务器端成功处理请求后调用的回调函数，response是响应体数据
                console.log(response);
            },
            "error": function (response) {		// 服务器端处理请求失败后调用的回调函数，response是响应体数据
                console.log(response);
            }
        });

    });


    $("#d").click(function () {
        // 准备好要发送到服务器端的数组
        var array = [5, 8, 12];
        console.log(array.length);
        // 将JSON数组转换为JSON字符串
        var requestBody = JSON.stringify(array);
        // "['5','8','12']"
        console.log(requestBody.length);
        $.ajax({
            "url": "array3",			// 请求目标资源的地址
            "type": "post",						// 请求方式
            "data": requestBody,				// 请求体
            "contentType": "application/json;charset=UTF-8",	// 设置请求体的内容类型，告诉服务器端本次请求的请求体是JSON数据
            "dataType": "json",					// 如何对待服务器端返回的数据
            "success": function (response) {		// 服务器端成功处理请求后调用的回调函数，response是响应体数据
                console.log(response);
            },
            "error": function (response) {		// 服务器端处理请求失败后调用的回调函数，response是响应体数据
                console.log(response);
            }
        });

    });

    $("#e").click(function () {
        // 准备好要发送到服务器端的数组
        const user = {
            userId: "1",
            userName: "Yang",
            nickName: "咩咩",
            createDate: "1994-11-12",
            lastUpdateDate: "1994-11-12",
            userOrder: "0",
            password: "Yang.....",
            userStatus: "true",
            phone: "17683883686",
            email: "897238156@qq.com",
            addressList: [
                {
                    id: "1",
                    name: "北京"
                },
                {
                    id: "2",
                    name: "上海"
                }
            ],
            map: {
                k1: "v1",
                k2: "v2"
            }
        };

        // 将JSON数组转换为JSON字符串
        var requestBody = JSON.stringify(user);
        console.log(requestBody);
        $.ajax({
            "url": "array4?userName='Yang'",			// 请求目标资源的地址
            "type": "post",						// 请求方式
            "data": requestBody,				// 请求体
            "contentType": "application/json;charset=UTF-8",	// 设置请求体的内容类型，告诉服务器端本次请求的请求体是JSON数据
            "dataType": "json",					// 如何对待服务器端返回的数据
            "success": function (response) {		// 服务器端成功处理请求后调用的回调函数，response是响应体数据
                console.log(response);
            },
            "error": function (response) {		// 服务器端处理请求失败后调用的回调函数，response是响应体数据
                console.log(response);
            }
        });

    });


    $("#bb").click(function () {
        $.ajax({
            async: true,
            beforeSend: function (XHR) {
                console.log("beforeSend(XHR)");
            },
            cache: true,
            complete: function (XHR, TS) {
                console.log("complete");
            },
            url: "${pageContext.request.contextPath}" + "/admin/user/list1",
            contentType: "application/json",
            data: {
                id: "1",
                acctId: "admin",
                nickName: "管理员"
            },
            dataType: "json",
            type: "GET",
            error: function () {
                console.log("请求失败时调用此函数");
            },
            success: function (data) {
                console.log("请求成功时调用此函数");
                $("#jsonText").val(JSON.stringify(data));
            }
        });
    });


</script>
</html>