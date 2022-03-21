<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
response.charset="utf-8"
hide=Request.QueryString("hide")
err=Request.QueryString("err")
if err=1 then
response.write("<script>alert('密码不得为空')</script>")
end if
from=Request.QueryString("from")
if from="logout" then
response.write("<ul><li><b>留言板</b></li><br><li><a href='/'><b>在线选课</b></a></li></ul><div class='lefth'><x>是否继续登出？</x><br><button class= 'btn ' style= 'vertical-align:middle;background-color: #555; ' onclick=""location='./'""><span>取消</span></button><button class= 'btn ' style= 'vertical-align:middle;' onclick=""location='./login.asp?from=logoutensured'""'><span>继续</span></button></div>")
end if
if from="logoutensured" then
response.cookies("uid")=""
response.cookies("pwd")=""
response.redirect("./login.asp?from=logoutsucc")
end if
if from="logoutsucc" then
response.write("<script>alert('成功登出!')</script>")
end if
if from="index" then
response.write("<script>alert('请先登录/注册')</script>")
end if
if from="reg" then
reqpwd=request("reqpwd")
requid=request.cookies("requid")
response.cookies("uid")=requid
response.cookies("pwd")=reqpwd
response.redirect("./index.asp?from=reg")
end if
if from="errpwd" then
response.write("<script>alert('密码错误，请重试')</script>")
end if
%>
<html>
<head>
<title>注册/登录</title>
<link rel="stylesheet" type="text/css" href="../css/istyle.css">
</head>
<body>
<ul>
  <li><b>留言板</b></li>
  <br>
  <li><a href="/"><b>在线选课</b></a></li>
</ul>
<div class="lefth">
<%
if hide=1 then
hide=0
else
requid=Request.QueryString("requid")
if requid="" then
response.write("<x><b><h3>注册/登录</h3></b></x><form method= 'post ' accept-charset= 'utf-8 '><x>用户名：</x><input type= 'text ' name= 'requid'><br><button class= 'btn ' style= 'vertical-align:middle'><span>继续</span></button></form>")
else
Response.Cookies("requid") = requid
set rs=server.createobject("adodb.recordset")
Set conn=Server.CreateObject("Adodb.Connection")
conn.Open "signclass"
sql="select pwd from bregister where uid='"&requid&"'"
rs.open sql,conn,1,3
if rs.eof or rs.bof then
response.write("<x><b><h3>注册</h3></b></x><br><x>此用户名尚未注册，输入密码以完成注册</x><form action='./register.asp' method= 'post ' accept-charset= 'utf-8 '><x>密码:</x><input type= 'text ' name= 'reqpwd'><br><button class= 'btn ' style= 'vertical-align:middle'><span>注册</span></button></form>")
else
response.write("<x><b><h3>登录</h3></b></x><br><x>此用户名已注册，输入密码完成登录</x><br><form action='./loginservice.asp' method= 'post ' accept-charset= 'utf-8 '><x>密码:</x><input type= 'text ' name= 'reqpwd'><br><button class= 'btn ' style= 'vertical-align:middle'><span>登录</span></button></form><br><x>或者：</x><a href=./login.asp><x>[注册]</x></a><x>另一个账号→</x>")
end if
conn.close
set conn=nothing
end if
end if
%>
</div>
<div>
<iframe src="../iframe/bottom.html" scrolling="no" frameborder="0" class="ifr"></iframe>
</div>
</body>
</html>