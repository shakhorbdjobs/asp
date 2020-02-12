

<%


'RESPONSE.WRITE REQUEST.FORM()





set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "C:\inetpub\wwwroot\Alumniproj\alu.mdb"


sql="INSERT INTO alum (Name,Email,"
sql=sql & "Birthday,Phone,Batch,Gender,Department,Bloodgroup,Skills,Skills2)"
sql=sql & " VALUES "
sql=sql & "('" & Request.Form("firstname") & "',"
sql=sql & "'" & Request.Form("email") & "',"
sql=sql & "'" & Request.Form("Birthday") & "',"
sql=sql & "'" & Request.Form("phone") & "',"
sql=sql & "'" & Request.Form("batch") & "',"
sql=sql & "'" & Request.Form("gender") & "',"
sql=sql & "" & Request.Form("department") & ","
sql=sql & "" & Request.Form("bgroup") & ","
sql=sql & "'" & Request.Form("skills") & "',"
sql=sql & "" & Request.Form("Skills2") & ")"





Response.Write(sql)
'RESPONSE.END()
'on error resume next
conn.Execute sql ,recaffected

if err<>0 then
  Response.Write(err)
else
   
Response.Redirect "data.asp"
  
end if
conn.close
%>



