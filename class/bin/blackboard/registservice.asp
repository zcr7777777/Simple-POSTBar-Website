<%
response.charset="utf-8"
reqcod=request("vcode")
mailname=request.cookies("mailname")
requid=request.cookies("requid")
reqpwd=request.cookies("reqpwd")
vcode=验证加密算法
if reqcod=cstr(vcode) then
set conna=server.CreateObject("adodb.connection")
sqla="insert into bregister values('" & requid & "','" & reqpwd & "','" & mailname & "')"
conna.open "signclass"
conna.execute(sqla)
conna.close
set conna=nothing
response.redirect("./loginservice.asp?reqpwd="&reqpwd)
else
response.write("<head><link rel='stylesheet' type='text/css' href='../css/istyle.css'></head><body><x>验证码错误：</x><button class= 'btn ' style= 'vertical-align:middle;' onclick=""location='./login.asp?requid="&requid&"'""><span>重试</span></button></body>")
end if
%>