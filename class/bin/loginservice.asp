<html>
<head>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="./css/istyle.css">
</head>
<body>
<%
response.charset="utf-8"
sname=request("student_name")
sgrade=request("student_grade")
sclass=request("student_class")
if sname="" then
response.write("<body><x>学号不得为空</x><br>")
response.write("<li style='list-style-type: none;width: 70px;'><a href='./login.asp'>返回</a></li></body>")
else
Response.Cookies("class") = sclass
Response.Cookies("grade") = sgrade
Response.Cookies("username") = sname
response.redirect("/")
end if
%>
</body>
</html>