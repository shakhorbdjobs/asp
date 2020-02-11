
<html>
<body>



<h2>Delete Record</h2>
<%
dim delID
delID=Request.QueryString("delID")
'response.write(dbshowID)
'response.end
%>
<div>
<%

' set conn=Server.CreateObject("ADODB.Connection")
'conn.Provider="Provider=Microsoft.ACE.OLEDB.12.0;"
'conn.Open "Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"

'cid=Request.QueryString("delID") -->



Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

 <%

        Dim delSQL
        delSQL="DELETE FROM alum"
        delSQL=delSQL & " WHERE ID=" & delID & ""
        on error resume next
     
        
        Dim objCmd
        set objCmd = Server.Createobject("ADODB.Command")
        objCmd.ActiveConnection = objConn
        objCmd.CommandText = delSQL
        objCmd.NamedParameters = true
        objCmd.Execute

         if err<>0 then
    response.write("no update!")
  else

    response.write("Record " & delID & " was deleted!")

    Response.Redirect "data.asp"
   
  end if
  
 objConn.close
        %>

     
      

</div>







</div>
</div>



