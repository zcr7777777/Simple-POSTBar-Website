<head>
<link rel="stylesheet" type="text/css" href="./css/istyle.css">
</head>
<%
response.charset="utf-8"
sname=request("student_name")
sgrade=request.cookies("grade")
sclass=request.cookies("class")
cclass=request("class_id")
if sname="" then
response.write("<body><x>姓名不得为空</x><br>")
else
set conn=server.CreateObject("adodb.connection")
sql="insert into "& cclass &" values('" & sname & "','" & sgrade & "','" & sclass & "')"
conn.open "signclass"
conn.execute(sql)
conn.close
set conn=nothing
response.write("<body><x>提交成功</x><br>")
end if
response.write("<li style='list-style-type: none;width: 70px;'><a href='../index.asp'>返回</a></li></body>")
%>