<!DOCTYPE html>
<!-- Template by Quackit.com -->
<html lang="en">
<head>
    <!--#include file="script.asp"-->
</head>
<body>
    <%
'Dim connStr, objConn, getNames
'Set objConn = CreateObject("ADODB.Connection")
'connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
'objConn.open connStr
%>
<%
'sp= "SELECT ID,dep_name FROM dep"
'Set rowCollect = objConn.execute(sp)
%>
     <!-- Navigation -->

<!--#include file="navig.asp"-->




<div align="center" style="border:1px solid red">
<h2 align="center">Search Data</h2>

<div align="center" style="border:1px solid red">
<form class="form-inline" action="Searchfr.asp">
  <label for="Name">Name:</label>
  <input type="text" id="Name" placeholder="Name" name="Name" >
  <label for="phone">Phone:</label>
  <input type="text" id="phone" placeholder="Enter Phone" name="phone">
  <label for="email">Email:</label>
  <input type="text" id="email" placeholder="Enter email" name="email">
  <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="Birthday">
   
    <label  for="Gender" >Gender </label>
        <label class="radio-inline" >
        <input input class="radio-inline" id="male" name="gender" type="radio" value="male" /> Male
     </label>
     <label  class="radio-inline" for="Gender" > 
     <input class="radio-inline"  id="female" name="gender" type="radio" value="female" /> Female </label>
  <button type="submit" value="submit">Search</button>
</form>
</div>

<div align="center" style="border:1px solid Blue">
          <table class="table table-striped table-hover">
                <thead>
                    <tr>
						
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
						<th>Phone</th>
                        <th>Batch</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Department</th>
                        <th>Blood Group</th>
                        <th>Skills</th>
                        <th>Programming Skills</th>
                        <th>Action</th>
                    </tr>
                </thead>

    <%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

  <% 
                Set rowCollect = objConn.execute("SELECT * FROM alum")
                 dim J
                J = 0
                do until rowCollect.EOF 
                 'for each x in rowCollect.Fields
                J = J+1
                  %>
    <tbody>
      <tr>
        
        <td><% Response.Write(J) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Name")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Email")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Phone")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Batch")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Birthday")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Gender")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Department")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Bloodgroup")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills2")) %></td>
        <td>
           <a href="ud_db.asp?dbshowID=<%response.write(rowCollect.Fields.Item("ID"))%>">Edit</a>
           <a href="del_db.asp?delID=<%response.write(rowCollect.Fields.Item("ID"))%>">Delete</a>
        </td>       
      </tr>
    </tbody>
    <%  
    'next 
        rowCollect.MoveNext
        loop
        rowCollect.close
        objConn.close
     %>
            </table>
</div>

</div>

   

</div>



<%

    dim check
    check=name
    check=Request.QueryString("check")

    if Request.form("submit") <> "" then

    Name = Request.form("Name")
    Phone = Request.form("phone")
    Email = Request.form("email")

      dim sqls
      sqls = "SELECT FROM alum WHERE Name '& &"

      
      

        Dim objCmd
        set objCmd = Server.Createobject("ADODB.Command")
        objCmd.ActiveConnection = objConn 
        objCmd.CommandText = sqls
        objCmd.NamedParameters = true
        objCmd.execute
        response.write(sqls)

        if err<>0 then
        response.write("NOD DATA FOUND")   
            else

            %>
                <% 
                Set rowCollect = objConn.execute("SELECT FROM alum WHEREe Name LIKE  '%S' ")
                 dim i
                i = 0
                do until rowCollect.EOF 
                 'for each x in rowCollect.Fields
                i = i+1
                  %>
    <tbody>
      <tr>
        
        <td><% Response.Write(i) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Name")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Phone")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Batch")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Birthday")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Gender")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Department")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Bloodgroup")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills2")) %></td>
        <td>
           <a href="ud_db.asp?dbshowID=<%response.write(rowCollect.Fields.Item("ID"))%>">Edit</a>
           <a href="del_db.asp?delID=<%response.write(rowCollect.Fields.Item("ID"))%>">Delete</a>
        </td>       
      </tr>
    </tbody>
    <%  
    'next 
        rowCollect.MoveNext
        loop
        rowCollect.close
        objConn.close
     %>
            </table> 
            <%
            end if


        end if
        %>


  
		<!-- Center Column -->
		<div class="col-sm-6">	
		</div><!--/Center Column-->
	</div><!--/container-fluid-->
	
		<!--#include file="footer.asp"-->	
     <!--#include file="dwjs.asp"-->
	
</body>
</html>
