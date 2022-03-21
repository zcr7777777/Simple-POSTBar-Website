<%
response.charset="utf-8"
reqpwd=Request.QueryString("reqpwd")
requid=request.Cookies("requid")
set rs=server.createobject("adodb.recordset")
Set conn=Server.CreateObject("Adodb.Connection")
conn.Open "signclass"
sql="select pwd from bregister where uid='"&requid&"'"
rs.open sql,conn,1,3
if rs.eof or rs.bof then
cod=0
else
cod=1
end if
conn.close
set conn=nothing
if requid="" then
cod=1
end if
if reqpwd="" then
cod=2
response.redirect("./login.asp?requid="&requid&"&err=1")
end if
if cod=1 then
response.write("参数错误：已注册或cookies配置错误")
end if
if cod=0 then
set conna=server.CreateObject("adodb.connection")
sqla="insert into bregister values('" & requid & "','" & reqpwd & "')"
conna.open "signclass"
conna.execute(sqla)
conna.close
set conna=nothing
response.redirect("./login.asp?from=reg&reqpwd="&reqpwd)
end if
%>