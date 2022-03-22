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
mailtoname=request("mailname")
set rsa=server.createobject("adodb.recordset")
Set conna=Server.CreateObject("Adodb.Connection")
conna.Open "signclass"
sqla="select pwd from bregister where mailname='"&mailtoname&"'"
rsa.open sqla,conna,1,3
if rsa.eof or rsa.bof then
vcode=验证加密算法
 Set myMail=CreateObject("CDO.Message")
 myMail.Subject="Verification Mail"
 myMail.From="发件人"
 myMail.To=mailtoname
 myMail.TextBody="Verification Code:"&vcode
 myMail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
 myMail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp服务器"
 myMail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=465
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
 myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusername") = "邮箱账号"
 myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "邮箱密码（授权码）"
 myMail.Configuration.Fields.Update
 myMail.Send
 set myMail=nothing
response.cookies("mailname")=mailtoname
response.cookies("reqpwd")=reqpwd
response.redirect("./verificate.asp")
else
response.write("<head><link rel='stylesheet' type='text/css' href='../css/istyle.css'></head><body><x>此邮箱已被注册，请更换并</x><button class= 'btn ' style= 'vertical-align:middle;' onclick=""location='./login.asp?requid="&requid&"'""><span>重试</span></button></body>")
end if
end if
%>