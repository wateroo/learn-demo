<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base
	href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/" />
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
						<input class="form-control" type="text" name="id" />
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
						<input class="form-control" type="text" name="password" placeholder="请输入密码" />
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
						<textarea class="form-control" rows="5" id="jsonText" style=" resize:vertical;" name="textArea"></textarea>
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
						<center>
						<button type="button" class="btn btn-default" id="a">layer弹框</button>
						<button type="button" class="btn btn-default" id="b">Ajax获取GET</button>
						<button type="button" class="btn btn-default" id="c">Ajax提交POST</button>
						<button type="button" class="btn btn-default" id="d">Ajax提交普通类型</button>
						<button type="button" class="btn btn-default">提交</button>
						<button type="button" class="btn btn-default">提交</button>
						<button type="button" class="btn btn-default">提交</button>
						<button type="button" class="btn btn-default">提交</button>
						</center>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">
	$("#a").click(function() {
		layer.msg("hello");
	});

	$("#b").click(function() {
		$.ajax({
			async : true,
			beforeSend : function(XHR) {
				console.log("beforeSend(XHR)");
			},
			cache : true,
			complete : function(XHR, TS) {
				console.log("complete");
			},
			url : "${pageContext.request.contextPath}" + "/admin/user/list1",
			contentType : "application/json",
			data : {
				id : "1",
				acctId : "admin",
				nickName : "管理员"
			},
			dataType : "json",
			type : "GET",
			error : function() {
				console.log("请求失败时调用此函数");
			},
			success : function(data) {
				console.log("请求成功时调用此函数");
				$("#jsonText").val(JSON.stringify(data));
			}
		});
	});
	
	$("#c").click(function() {
		$.ajax({
			async : true,
			beforeSend : function(XHR) {
				console.log("beforeSend(XHR)-----------");
				console.log(JSON.stringify(formToJson("form")));
			},
			cache : true,
			complete : function(XHR, TS) {
				console.log("complete--------------");
			},
			url : "${pageContext.request.contextPath}" + "/hello/user",
			contentType : "application/json",
			data : JSON.stringify(formToJson("form")),
			dataType : "json",
			type : "POST",
			error : function() {
				console.log("请求失败时调用此函数");
			},
			success : function(data) {
				console.log("请求成功时调用此函数");
				$("#jsonText").val(JSON.stringify(data));
			}
		});
	});
	
	
	$("#d").click(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}" + "/hello/1",
			//contentType : "application/json",
			data : $("#form").serialize(),
			//dataType : "json",
			type : "POST",
			error : function() {
				console.log("请求失败时调用此函数");
			},
			success : function(data) {
				console.log("请求成功时调用此函数");
				$("#jsonText").val(data);
			}
		});
	});
	
	
	
	function formToJson(formId){
		var data = {};
		var form  = $("#"+formId).serializeArray();
		$(form).each(function(){
			var name = this.name;
			var value = this.value;
			data[name] = value;
		});
		return data;
	}
</script>
</html>