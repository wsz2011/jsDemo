<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
var ajaxDemo = function(){
	var xmlhttp;
	//判断是什么浏览器，根据浏览器不同，给xmlhttp赋值不同的对象
	if(window.XMLHttpRequest){//如果存在，就是IE7+、Firefox、Chrome、Safari 以及 Opera
		xmlhttp = new XMLHttpRequest();
	}else{//否则，就是IE5 和 IE6 
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	//设定回调函数
	//原理，XMLHttpRequest的属性readyState,服务器和XMLHttpRequest一直在通信，每次的通信
	//都会使readyState发生变化，变化时会触发onreadystatechange
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){//符合这2个条件就响应成功
			//回调代码
			//readyState,readyState,responseText,responseXML
			window.document.getElementById("h1").innerHTML = xmlhttp.responseText;
			//alert(xmlhttp.responseText);
		}
	}
	
	//设定请求（类型，URL，是否是异步）发送请求
	var url = "http://localhost:8080/jsDemo/ajax/test";
	var param = "name=屋顶会&age=20"
	//get
	/* xmlhttp.open("GET",url + "?" + encodeURI(param),true);//定义请求
	xmlhttp.send(null);//发送请求 */
	
	//post
	xmlhttp.open("POST",url,true);//定义请求
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
	xmlhttp.send(param);//发送请求
	
}

var test = function(){
	ajaxDemo();
	//给服务器服务端做了延迟2秒处理，如果先填充h2,后填充h1，证明ajax是异步
	//因为从代码顺序来看，h2的代码在h1的后面
	window.document.getElementById("h2").innerHTML = "屋顶辉是笨蛋笨蛋！！！";
}

</script>
</head>
<body>
<h1 id="h1">你好</h1>
<h2 id="h2">屋顶会</h2>
<input type="button" value="按钮" onclick="test();">
</body>
</html>