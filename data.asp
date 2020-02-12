<!DOCTYPE html>
<html lang="en">
<head>

<!-- Bootstrap Core CSS -->
   <!--#include file="script.asp"-->
</head>
<body>
<!--#include file="navig.asp"-->
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Manage <b>Member</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="reg.asp" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
												
					</div>
                </div>
            </div>
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
        	<!--#include file="footer.asp"-->
    </div>


  

</body>
</html>                                		                            