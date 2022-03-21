<% response.charset="utf-8"
from=Request.QueryString("from")
if from="logout" then
Response.Write("<script>alert('成功登出! ')</script>")
end if
%>
<html>
<head>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="./css/istyle.css">
</head>
<body>
<ul>
  <li><b>在线选课</b></li>
<br>
  <li><a href="./blackboard/"><b>留言板</b></a></li>
</ul>
<div class="lefth">
<form action="./loginservice.asp" method="post" accept-charset="utf-8">
<x>
请填写学生信息：
</x>
<br>
<select name="student_grade">
<option value="1">1年级</option>
<option value="2">2年级</option>
<option value="3">3年级</option>
<option value="4">4年级</option>
<option value="5">5年级</option>
<option value="6">6年级</option>
</select>
<select name="student_class">
<option value="1">1班</option>
<option value="2">2班</option>
<option value="3">3班</option>
<option value="4">4班</option>
</select>
<br>
<x>
请填写学号：
</x>
<input type="text" name="student_name">
<br>
<button class="btn" style="vertical-align:middle"><span>登录</span></button>
</form>
</div>
<iframe src="./iframe/bottom.html" scrolling="no" frameborder="0" class="ifr"></iframe>
</body>
</html>
