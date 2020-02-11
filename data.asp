<!DOCTYPE html>
<html lang="en">
<head>

<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/buton.css" rel="stylesheet">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Alumni Data</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="new.css">
<link type="text/javascript" href="des.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-globe"></span> Logo</a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="index.asp">Home</a>
                    </li>
                    <li>
                        <a href="data.asp">Show List</a>
                    </li>
                    <li>
                        <a href="reg.asp">Registration</a>
                    </li>
					
                </ul>

				<!-- Search -->
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control">
					</div>
					<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Search</button>
				</form>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>




<%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>


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
                        <th>Gender</th>
                        <th>Department</th>
                        <th>Blood Group</th>
                        <th>Skills</th>
                        <th>Programming Skills</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <% 
             
                'set rowCollect = objConn.execute("SELECT * FROM alum")
 Set rowCollect = objConn.execute("SELECT * FROM alum")
                'response.Write(rowCollect)
               

    'response.write rowCollect(0,0)
    'response.write rowCollect.Fields.count-1
    'for i = 0 to ubound()

    'response.end
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
        <div class="small-print">
        	<div class="container">
        		<p><a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact</a></p>
        		<p>Copyright &copy; alumni.com 2015 </p>
        	</div>
        </div>
    </div>


  

</body>
</html>                                		                            