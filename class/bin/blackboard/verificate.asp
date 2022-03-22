<% response.charset="utf-8" %>

<%
response.write("<head><link rel='stylesheet' type='text/css' href='../css/istyle.css'></head><body><x><b><h3>验证邮箱</h3></b></x><br><form action='./registservice.asp' method= 'post ' accept-charset= 'utf-8 '><x>验证码：</x><input type= 'text ' name= 'vcode'><br><button class= 'btn ' style= 'vertical-align:middle'><span>确认</span></button></form></body>")
%>