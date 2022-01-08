<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){//初始事件就是初始化页面的一些东西
	/* test();
	alert("world"); */
	$("#h1").text("<a href=''>欢迎您</a>");
	$("#h2").html("<a href=''>超链接</a>");
});
var test = function(){
	alert("hello");
}
</script>
</head>
<body>
<h1 id="h1"></h1>
<h2 id="h2"></h2>
</body>
</html>