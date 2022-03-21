<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html>
<head>
<title>删除帖子</title>
<link rel="stylesheet" type="text/css" href="../css/istyle.css">
</head>
<body>
<%
response.charset="utf-8"
id=request.querystring("id")
uid=request.querystring("uid")
cfm=request.querystring("confirmed")
uuid = Request.Cookies("uid")
if cfm=1 then 
if uid=uuid then
set conn=server.CreateObject("adodb.connection")
sql="delete from blackboard where tid='"&id&"'"
conn.open "signclass"
conn.execute(sql)
conn.close
set conn=nothing
response.redirect("./remove.asp?confirmed=2&id="&id)
else
response.cookies("uid")=""
response.cookies("pwd")=""
response.write("登录过期，请<a href='./login.asp'>重新登录</a>")
end if
else
if cfm=2 then
response.write("<x>帖子(ID:"&id&")已成功删除！</x><br><button class= 'btn ' style= 'vertical-align:middle;' onclick=""location='./'""><span>确定</span></button>")
else
response.write("<x>帖子一经删除无法恢复</x><br><x>是否仍要删除?</x><br><button class= 'btn ' style= 'vertical-align:middle;background-color: #555; ' onclick=""location='./'""><span>取消</span></button><button class= 'btn ' style= 'vertical-align:middle;' onclick=""location='./remove.asp?confirmed=1&id="&id&"&uid="&uid&"'""'><span>继续</span></button>")
end if
end if
%>
</body>
</html>