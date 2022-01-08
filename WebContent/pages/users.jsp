<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
var ajaxDemo = function(json){//给方法定义一个json类型的参数
	/*
	就是这样的一个参数
	{
	"url": "http://localhost:8080/jsDemo/ajax/test",
	"param": "xx=xx&xxx=xx",
	"method": "POST",
	"async": true,
	"success":function(data){}
	}
	
	*/
	var xmlhttp;
	
	var url = json.url;//url
	var param = json.param;//请求参数
	var method = json.method;//http请求类型
	var async = json.async;//是否异步
	var callback = json.success;//回调函数
	
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
			//window.document.getElementById("h1").innerHTML = xmlhttp.responseText;
			//alert(xmlhttp.responseText);
			callback(xmlhttp.responseText);
		}
	}
	
	//设定请求（类型，URL，是否是异步）发送请求
	
	if(method == "GET"){
		//get
		xmlhttp.open("GET",url + "?" + encodeURI(param),async);//定义请求
		xmlhttp.send(null);//发送请求 
	}
	
	if(method == "POST"){
		//post
		xmlhttp.open("POST",url,async);//定义请求
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		xmlhttp.send(param);//发送请求
	}
	
}

var test = function(){
	ajaxDemo({
		"url": "http://localhost:8080/jsDemo/ajax/users",
		"param": "",
		"method": "POST",
		"async": true,
		"success":function(data){
			var html = "<tr>"
					+ "<th>姓名</th>"
					+ "<th>年龄</th>"
					+ "</tr>";
			var values = data.split("}, {");
			var temp = "";
			var vals;
			var name;
			var age;
			for(var i = 0; i < values.length; i++){
				temp = values[i].replace("}]","");
				vals = temp.split(",");
				name = vals[0].split(":")[1];//姓名的内容
				age = vals[1].split(":")[1];//年龄的内容
				html += "<tr>"
					+ "<td>" + name + "</td>"
					+ "<td>" + age + "</td>"
					+ "</tr>"
			}
			
			window.document.getElementById("tt").innerHTML = html;
		}
	});
}
//[{name:张三,age:11}, {name:李四,age:12}, {name:王五,age:13}]
//[{name:张三,age:11
//name:李四,age:12
//name:王五,age:13
</script>
</head>
<body>
<table id="tt" border="1">
	<tr>
		<th>姓名</th>
		<th>年龄</th>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
</table>
<input type="button" value="按钮" onclick="test();">
</body>
</html>