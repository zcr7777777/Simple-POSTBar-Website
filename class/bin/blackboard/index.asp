<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
response.charset="utf-8"
uid = Request.Cookies("uid")
pwd = Request.Cookies("pwd")
if uid="" or pwd="" then
ck=0
response.redirect("./login.asp?from=index")
else
ck=1
end if
from=Request.QueryString("from")
if from="login" then
response.write("<script>alert('登录成功')</script>")
end if
if from="reg" then
response.write("<script>alert('注册成功')</script>")
end if
if from="create" then
response.write("<script>alert('ID:"&request.querystring("cidd")&" 发帖成功')</script>")
end if
%>
<html>
<head>
<title>留言板</title>
<link rel="stylesheet" type="text/css" href="../css/istyle.css">
</head>
<body>
<ul>
  <li><b>留言板</b></li>
  <br>
  <li><a href="/"><b>在线选课</b></a></li>
  <br>
  <li><a href="./login.asp?from=logout&hide=1"><b>登出</b></a></li>
  <br>
  <br>
  <li><b>支持链接</b></li>
  <li><a href="https://www.w3school.com.cn/"><b>W3school</b></a></li>
  <br>
  <li><a href="https://hsk.oray.com/"><b>花生壳</b></a></li>
  <br>
  <li><a href="http://www.ipyingshe.com/"><b>闪库</b></a></li>
  <br>
  <li><a href="http://www.mysql.com/"><b>MySQL</b></a></li>
  <br>
  <li><a href="http://www.iis.net/"><b>IIS</b></a></li>
  <br>
  <li><b>制作</b></li>
  <li><b><h3 style="color: blue; font-size: 1.5em; background-color: yellow; text-align: center;">Leo唐</h3></b></li>
</ul>
<div class="lefth">
<a href="./?redirect=create"><x style="font-size: 1.5em;"><b>创建新帖</b></x></a>
<hr>
<%
if ck=1 then
set rs=server.createobject("adodb.recordset")
Set conn=Server.CreateObject("Adodb.Connection")
conn.Open "signclass"
sql="select * from blackboard"
rs.CursorLocation=3
rs.open sql,conn,1,3
rscnt=rs.recordcount
response.cookies("cid")=rscnt+1
if rscnt=0 then
response.write("没有条目")
else
rs.movelast
for i=0 to rscnt-2
unsigned=rs(1)
tuid=rs(0)
if unsigned="0" then
response.write("<b>发帖用户:</b>"&tuid)
else
response.write("<b style='color: red;'>匿名用户</b>")
end if
resp=rs(3)
tresp=mid(resp,1,4)&"年"&mid(resp,5,2)&"月"&mid(resp,7,2)&"日"&mid(resp,9,2)&"时"&mid(resp,11,2)&"分"
response.write("<b> 发帖时间:</b>"&tresp&" ")
tid=rs(4)
response.write(" <b>ID:</b>"&tid)
if tuid=uid then
response.write(" <a href='./remove.asp?confirmed=0&id=" & tid & "&uid=" & uid & "'><x  style='color: #555;'><b>删除本贴</b></x></a>")
end if
resp=rs(2)
response.write("<br><b>帖子正文:</b><table><tr><td style='word-break:break-all'>"&resp&"</td></tr></table>")
response.write("<hr>")
rs.moveprevious
next
unsigned=rs(1)
tuid=rs(0)
if unsigned="0" then
tuid=rs(0)
response.write("<b>发帖用户:</b>"&tuid)
else
response.write("<b style='color: red;'>匿名用户</b>")
end if
resp=rs(3)
tresp=mid(resp,1,4)&"年"&mid(resp,5,2)&"月"&mid(resp,7,2)&"日"&mid(resp,9,2)&"时"&mid(resp,11,2)&"分"
response.write("<b> 发帖时间:</b>"&tresp&" ")
tid=rs(4)
response.write("<b> ID:</b>"&tid)
if tuid=uid then
response.write(" <a href='./remove.asp?confirmed=0&id=" & tid & "&uid=" & uid & "'><x  style='color: #555;'><b>删除本贴</b></x></a>")
end if
resp=rs(2)
response.write("<br><b>帖子正文:</b><table><tr><td style='word-break:break-all'>"&resp&"</td></tr></table>")
response.write("<hr>")
response.write("共计" & rscnt & "条目")
end if
conn.close
set conn=nothing
end if
rd=request.querystring("redirect")
if rd="create" then
response.redirect("./create.asp")
end if
%>
</div>
</body>
</html>