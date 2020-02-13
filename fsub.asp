

<%
'RESPONSE.WRITE REQUEST.FORM()

set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "C:\inetpub\wwwroot\Alumniproj\alu.mdb"


sql="INSERT INTO alum (Name,Email,"
sql=sql & "Birthday,Phone,Batch,Gender,Department,Bloodgroup,Skills)"
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
      '  sk ="INSERT INTO Alumskill (alumskil) VALUES (" & request.form("skills2") & ")"
          'Csk=Request.Form("Skills2")
          Response.Write(sql)
          conn.Execute(sql)

          Pl = "SELECT MAX(ID) as ID FROM alum" 
          Response.Write(Pl)
          Set rowCollect =  conn.Execute(Pl)


          Response.Write(rowCollect.Fields.Item("ID"))

         strSQL="INSERT INTO Alumskills(skill) VALUES(" & Request.Form("Skills2") & ")"
        'Response.Write(strSQL)    
        'dim cbt,chk,strSQL
        Csk=Request.Form("Skills2")
        'c=1
        'If(InStr(Csk,", ")>0) Then
        arr=Split(Csk,",")
        Response.Write(Csk)
        
        For Each x In arr
          strSQL="INSERT INTO Allumskills(skill,alumid) VALUES ( "
          strSQL=strSQL & Csk & ", " & rowCollect.Fields.Item("ID") & " )"
           objConn.execute(strSQL)
        Next
        
        'End If
response.end
Response.Write(strSQL)
       
       
   
          da= "INSERT INTO Allumskills(skills) FROM P1"
          objConn.execute(da)
          
  
    Response.Write(da)

'RESPONSE.END()
'on error resume next
conn.Execute sql,strSQL, recaffected

if err<>0 then
  Response.Write(err)
else
   
Response.Redirect "data.asp"
  
end if
conn.close
%>



