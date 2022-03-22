<%
text=request("text")
unsigned=request("unsigned")
uid=request.cookies("uid")
tim=year(now())&right("0"&month(now()),2)&right("0"&day(now()),2)&right("0"&hour(now()),2)&right("0"&minute(now()),2)
cid=request.cookies("cid")
set conn=server.CreateObject("adodb.connection")
sql="insert into blackboard values('" & uid & "','" & unsigned & "','" & text & "','" & tim & "','" & cid & "')"
conn.open "signclass"
conn.execute(sql)
conn.close
set conn=nothing
response.redirect("./?from=create&cidd="&cid)
%>