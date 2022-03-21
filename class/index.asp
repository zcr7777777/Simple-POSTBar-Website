<% 
response.charset="utf-8"
uid = Request.Cookies("username")
if uid="" then
response.redirect("./bin/login.asp")
end if
%>
<html>
<head>
<title>在线选课</title>
<link rel="stylesheet" type="text/css" href="./bin/css/istyle.css">
</head>
<body>
<ul>
  <li><b>在线选课</b></li>
  <br>
  <li><x>欢迎，</x></li>
  <br><x>
  <% response.write("NO." & uid) %>
  </x><br>
  <li><a href="./bin/blackboard/"><b>留言板</b></a></li>
  <br>
  <li><a href="./bin/logout.asp"><b>登出</b></a></li>
</ul>
<div class="lefth">
<x>
请选择您要报名的课程：
</x>
<br>
<form action="./bin/submit.asp" method="post" accept-charset="gbk">
<select name="class_id">
<option value="class_a1">测试班级1</option>
<option value="class_a2">测试班级2</option>
</select>
<br>
<x>
请填写学生姓名：
</x>
<input type="text" name="student_name">
<br>
<button class="btn" style="vertical-align:middle"><span>提交</span></button>
</form>
</div>
<iframe src="./bin/iframe/bottom.html" scrolling="no" frameborder="0" style="position:absolute;width:99%;height:100px;bottom:0;text-align:center;"></iframe>
</body>
</html>