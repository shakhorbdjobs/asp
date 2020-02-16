<html>
<body>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "C:\inetpub\wwwroot\Alumniproj\alu.mdb"

set rs = Server.CreateObject("ADODB.recordset")
rs.open "SELECT * FROM alum",conn
%>

<h2>List Database</h2>
<table border="1" width="100%">
<tr>
<%
for each x in rs.Fields
  response.write("<th>" & ucase(x.name) & "</th>")
next
%>
</tr>
<% do until rs.EOF %>
<tr>
<form method="post" action="del_db.asp">
<%
for each x in rs.Fields
  if lcase(x.name)="Name" then%>
    <td>
    <input type="submit" name="ID" value="<%=x.value%>">
    </td>
  <%else%>
    <td><%Response.Write(x.value)%></td>
  <%end if
next
%>
</form>
<%rs.MoveNext%>
</tr>
<%
loop
conn.close
%>
</table>

</body>
</html>