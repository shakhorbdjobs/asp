<!DOCTYPE html>
<html lang="en">
<head>
    <!--#include file="script.asp"-->
</head>
<body>
  
     <!-- Navigation -->

<!--#include file="navig.asp"-->

    <%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>


<div align="center" style="border:1px solid red">
<h2 align="center">Search Data</h2>

<div align="center" style="border:1px solid red">
<form class="form-inline" action="">
  <label for="Name">Name:</label>
  <input type="text" id="Name" placeholder="Name" name="Name" >

  <input type="submit" name="Submit" value="submit" class="btn btn-primary"> 
</form>

</div>
<% response.write("checking ")%>

 <table class="table table-striped table-hover">
                <thead>
                    <tr>						
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
           <%
            if Request.form("Submit") <> "" then

              
              name=request.form("Name") 
              sql= "SELECT * FROM alum WHERE Name='"&name&"'"
             'set cp= objConn.execute("SELECT * FROM alum WHERE Name='"& request.form("Name") &"'")
              response.write(sql)
            else
            
              set cp= objConn.execute("SELECT * FROM alum")
               
            end if
            dim i
            i = 0
            do until cp.EOF 
            i = i+1  %>
            
        <tbody>
         
        <tr>
        <td><% Response.Write(i) %></td>
        <td><% Response.Write(cp.Fields.Item("Name")) %></td>
        <td>
           <a href="ud_db.asp?dbshowID=<%response.write(cp.Fields.Item("ID"))%>">Edit</a>
           <a href="del_db.asp?delID=<%response.write(cp.Fields.Item("ID"))%>">Delete</a>
        </td>       
      </tr>
    </tbody> 
     
             <%  
        'next 
        cp.MoveNext
        loop
        cp.close
        objConn.close
     %>    
     </table>
    </div>
    </div>

		<!-- Center Column -->
		<div class="col-sm-6">	
		</div><!--/Center Column-->
	</div><!--/container-fluid-->
	
		<!--#include file="footer.asp"-->	
     <!--#include file="dwjs.asp"-->
	
</body>
</html>
