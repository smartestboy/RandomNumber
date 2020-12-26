<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css.css">
<style type="text/css">
#one {
	width: 60px;
	height: 40px;
	background-color: #33FFFF;
	font: bold;
}
</style>
</head>
<body>
		<h1>下面的25宫格会随机分布1到25的数字，请在15秒内按顺序找到数字对应位置</h1>
		<!-- 展示时间 -->
		<div>
			<span id="id_S">0</span><span id=id_s>s</span>
		</div>
		<p id="hang" />
		<script type="text/javascript">
			function getDiffGroup(num, min, max) {
				var res = [];
				for ( var i = min; i <= max; i++) { //从最小数开始 加一 到最大数
					res.push(i);//将所有的数 push到数组中
				}
				res.sort(function() {
					return 0.5 - Math.random(); //随机数排序
				});
				var rst = [];
				for ( var i = 0; i < res.length; i += num) {
					rst.push(res.slice(i, i + num));//数组中放入截取后的数组
				}
				return rst;
			}
			var rst = getDiffGroup(5, 1, 25);//5*5二维数组
			console.log(rst.join('\n'));

			var str = "";

			//计时函数调用
			var timer = null;
			var count = 0;
			/* function clock() {
				alert(count);
				count++;
				document.getElementById("id_S").innerHTML = count;

			} */
			window.onload = function() {

				//时间开始、停止函数
				$("start").onclick = function() {
					alert(count);
					timer = self.setInterval(function clock() {
						alert(count);
						count++;
						document.getElementById("id_S").innerHTML = count;

					}, 1000);
				};
			};
			//str += "<h2>" +  + "<h2/>";
			str += '<table border="1">';

			for ( var x = 0; x < rst.length; x++) {
				str += "<tr>";
				for ( var y = 0; y < rst[x].length; y++) {
					str += "<a><td>" + rst[x][y] + "</td></a>";

				}
				str += "</tr>";
			}
			document.getElementById("hang").innerHTML = str;
		</script>
		<br />
		<!-- <button onclick="startX()">开始</button> -->
		<input type="button" value="开始" id="start" />
</body>
</html>

