<html>
<head>
<title>Edit Data</title>

 <!--#include file="script.asp"-->


</head>
<body>
<!--#include file="navig.asp"-->

<h2>Update Record</h2>

<%
Dim connStr, objConn
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>
<div class=container>
 <%
        dim dbshowID
        dbshowID=Request.QueryString("dbshowID")
        'Update Specific Id Record into Database        
        if Request.form("submit") <> ""  then
        
        'sql QUERY '
        
        Dim upSQL
        upSQL=" UPDATE alum SET "
        upSQL=upSQL &  "Name= '" & Request.Form("Name") & "',"
        upSQL=upSQL & "Email= '" & Request.Form("Email") & "',"
        upSQL=upSQL & "Phone= '" & Request.Form("Phone") & "',"
        upSQL=upSQL & "Birthday= '" & Request.Form("Birthday") & "',"
        upSQL=upSQL & "Batch= '" & Request.Form("Batch") & "',"
        upSQL=upSQL & "Gender= '" & Request.Form("Gender") & "',"
        upSQL=upSQL & "Department= " & Request.Form("Department") & ","
        upSQL=upSQL & "Bloodgroup=" & Request.Form("bgroup") & ","
        upSQL=upSQL & "Skills= '" & Request.Form("Skills") & "',"
        upSQL=upSQL & "Skills2= " & Request.Form("Skills2") & ""
        upSQL=upSQL & " WHERE ID= " & dbshowID & ""

        response.write(upSQL)

        Dim objCmd
        set objCmd = Server.Createobject("ADODB.Command")
        objCmd.ActiveConnection = objConn 
        objCmd.CommandText = upSQL
        objCmd.NamedParameters = true
        objCmd.execute
       
       response.write(upSQL)
        
        if err<>0 then

                response.write("No update permissions!")
            else
           %>
                <h2 style='color:green;font-weight:bold' ><% response.write("Record Id  " & dbshowID &"  Updated Successfully") %></h2> %>
            <%
            end if
        end if
        %>

</div>

<%
'Retrive Specific Id Record From Database
Set rowCollect = objConn.execute("SELECT * FROM alum WHERE ID= " & dbshowID & "")
  'response.write(rowCollect.Fields.Item("DiseaseName"))
%>

<div class="container main">

<div style="width:60%;margin:0 auto;">
<h3>Update Member</h3>
  <form  method="post" action="">
    <label for="fname">Name</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Name")) %>" name="Name" id="Name" aria-describedby="emailHelp"> 
    
    <label for="email">Email</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Email")) %>" name="Email" id="Name" aria-describedby="emailHelp">

    <label for="phone">Phone</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Phone")) %>" name="Phone" id="Phone" aria-describedby="emailHelp">

    <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="Birthday">  

    <label for="batch">Batch</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Batch")) %>" name="Batch" id="Batch" aria-describedby="emailHelp">

    <label for="gender">Gender</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Gender")) %>" name="Gender" id="Gender" aria-describedby="emailHelp">

    <label for="Skills">Skills set</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Skills")) %>" name="Skills" id="Skills" aria-describedby="emailHelp">

<%
Dim connStr3, objConn3
Set objConn3 = CreateObject("ADODB.Connection")
connStr3 = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn3.open connStr3

%>



  <%
      lp= "SELECT ID,bgp FROM Bgrp"
      Set rowCollect = objConn3.execute(lp)
        %> 

     <label for="bgrop">Blood Group</label>
    <select id="Bloodgrp" name="bgroup">
            <%do until rowCollect.EOF %>
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("bgp")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
    </select>
    
  
 <%
sp= "SELECT ID,dep_name FROM dep"
Set rowCollect = objConn.execute(sp)
%>

    <label for="department">Department</label>
    <select id="Department" name="Department">
            <%do until rowCollect.EOF %>
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("dep_name")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
    </select>   
<%
Dim connStr1, objConn1, getNames1
Set objConn1 = CreateObject("ADODB.Connection")
connStr1 = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn1.open connStr1
%>

<%
cp= "SELECT ID,skills_set FROM Skills2"
Set rowCollect = objConn1.execute(cp)
%>
    <p>Check your Skill:</p>
   
    <label class="checkbox-inline" for="Skills2">
        <%do until rowCollect.EOF %>
      <input type="checkbox" name="Skills2"
      value="<% response.write(rowCollect.Fields.Item("ID")) %>">
      <% response.write(rowCollect.Fields.Item("skills_set")) %> </label>
         <%
            rowCollect.MoveNext
            loop
            %>
            </label>
    <input type="submit" name="submit" value="Update">
        <input type="reset" value="Cancel" href="data.asp" >
        <a href="data.asp">
         <input type="check"  value="Back">
        </a>

</form>

    </div>
</div>


<%
 rowCollect.close
  objConn.close
%>
</div>
</div>


