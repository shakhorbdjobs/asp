

<%
'RESPONSE.WRITE REQUEST.FORM()

set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "C:\inetpub\wwwroot\Alumniproj\alu.mdb"


sql="INSERT INTO alum (Name,Email,"
sql=sql & "Birthday,Phone,Batch,Gender,Department,Bloodgroup,Skills,Skills2)"
sql=sql & " VALUES "
sql=sql & "('" & Request.Form("Name") & "',"
        sql=sql & "'" & Request.Form("email") & "',"
        sql=sql & "'" & Request.Form("Birthday") & "',"
        sql=sql & "'" & Request.Form("phone") & "',"
        sql=sql & "'" & Request.Form("batch") & "',"
        sql=sql & "'" & Request.Form("gender") & "',"
        sql=sql & "" & Request.Form("department") & ","
        sql=sql & "" & Request.Form("bgroup") & ","
        sql=sql & "'" & Request.Form("skills") & "')"
        'sql=sql & "" & Request.Form("Skills2") & ")"


  '' sk ="INSERT INTO Alumskill (alumskil) VALUES (" & request.form("skills2") & ")"
          Csk=Request.Form("Skills2")
         strSQL="INSERT INTO Alumskills(skill) VALUES("strSQL=strSQL & Csk & ")"
        'Response.Write(strSQL)    
        'dim cbt,chk,strSQL
        'Csk=Request.Form("Skills2")
        'c=1
        'If(InStr(Csk,", ")>0) Then
        'arr=Split(Csk,", ")
        'strSQL="INSERT INTO Allumskills(skill) VALUES ("
        'For Each x In chk
        'strSQL=strSQL & Csk & ")"
        'c=c+1
        'Set conn=conn.Execute(strSQL)
        'Next
        'End If

Response.Write(strSQL)
       



'RESPONSE.END()
'on error resume next
conn.Execute sql,strSQL, recaffected
'conn.Execute strSQL
if err<>0 then
  Response.Write(err)
else
   
Response.Redirect "data.asp"
  
end if
conn.close
%>



