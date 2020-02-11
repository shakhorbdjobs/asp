<html>
<head>
<title>Edit Data</title>
<link href="css/custom.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/buton.css" rel="stylesheet">
    <link href="updatee.css" rel="stylesheet">

</head>
<body>
<h2>Update Record</h2>
<%
dim dbshowID,dbshowName
dbshowName= Request.QueryString("dbshowName")
dbshowID=Request.QueryString("dbshowID")
'response.write(dbshowID)
'response.end
%>
<div>
<%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

 <%
        'Update Specific Id Record into Database
        if Request.form("submit") <> "" then
        Dim upSQL
        'strSQL = "INSERT INTO patient(DiseaseName) VALUES('" & Form_Name & "')"
        upSQL="UPDATE alum SET "
        upSQL=upSQL & "Name='" & Request.Form("Name") & "'"
        updSQL=upSQL & " WHERE ID=" & dbshowID & ""
        on error resume next
        'response.write updateSQL
        'response.end
        Dim objCmd
        set objCmd = Server.Createobject("ADODB.Command")
        objCmd.ActiveConnection = objConn 
        objCmd.CommandText = upSQL
        objCmd.NamedParameters = true
        objCmd.Execute

        if err<>0 then
            response.write("No update permissions!")
        else
        %>
            <h2 style='color:green;font-weight:bold' ><% response.write("Record Id  "&dbshowID&" Updated Successfully") %></h2>
        

<%
        end if
        end if
        %>


</div>
<div>

<%
'Retrive Specific Id Record From Database
Set rowCollect = objConn.execute("SELECT * FROM alum WHERE ID=" &dbshowID& "")

  'response.write(rowCollect.Fields.Item("DiseaseName"))
%>

<div class="container main">

<div style="width:60%;margin:0 auto;">
<h3>Update Member</h3>
  <form  method="post" action="">
    <label for="fname">Name</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Name")) %>" name="Name" id="Name" aria-describedby="emailHelp"> 
    
    <label for="fname">Email</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Email")) %>" name="Email" id="Name" aria-describedby="emailHelp">

    <label for="fname">Phone</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Phone")) %>" name="Phone" id="Phone" aria-describedby="emailHelp">

    <label for="fname">Batch</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Batch")) %>" name="Batch" id="Batch" aria-describedby="emailHelp">

    <label for="fname">Gender</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Gender")) %>" name="Gender" id="Gender" aria-describedby="emailHelp">


     <label for="fname">Blood Group</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Bloodgroup")) %>" name="Bloodgroup" id="Bloodgroup" aria-describedby="emailHelp">

  <label for="Skills">Skills set</label>
    <input type="text" value="<% response.write(rowCollect.Fields.Item("Skills")) %>" name="Skills" id="Skills" aria-describedby="emailHelp">

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