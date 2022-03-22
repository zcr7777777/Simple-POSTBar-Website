<%
Response.Cookies("username")=""
Response.Cookies("class")=""
Response.Cookies("grade")=""
Response.Redirect("./login.asp?from=logout")
%>