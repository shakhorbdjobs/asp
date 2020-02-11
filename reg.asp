<!DOCTYPE html>
<!-- Template by Quackit.com -->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Alumni Registration</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/buton.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>
<%

sp= "SELECT ID,dep_name FROM dep"
Set rowCollect = objConn.execute(sp)
%>


     <!-- Navigation -->
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
<form name ="form" action="fsub.asp" method="post" onsubmit="return validateForm()">
<div class="container-fluid">

	
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name.." required>

    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your email.." required>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" placeholder="Your Phone.." required>

    <label for="phone">Batch</label>
    <input type="text" id="batch" name="batch" placeholder="Your Batch." required>
    
     <label  for="gender" >Gender </label>
        <label class="radio-inline" >
        <input id="male" name="gender" type="radio" value="male" /> Male
     </label>
     <label  class="radio-inline" for="gender" > <input class="radio-inline"  id="female" name="gender" type="radio" value="female" /> Female </label>
     
    
    <label for="department">Department</label>
    <select id="Department" name="Department">
            <option>Select</option>
            <%do until rowCollect.EOF %>
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("dep_name")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
            
      
    </select>

    <label for="bgroup">Blood Group</label>
    <input type="text" id="profession" name="bgroup" placeholder="Your Blood Group">
 
    <label for="profession">Skills</label>
    <input type="text" id="profession" name="skills" placeholder="Your Skills">

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

<div class="col-sm-6">
    <p>Check your Skill:</p>
  <form>  
    <label class="checkbox-inline" for="skills">
        <%do until rowCollect.EOF %>
      <input type="checkbox" name="Skills2"
      value="<% response.write(rowCollect.Fields.Item("ID")) %>">
      <% response.write(rowCollect.Fields.Item("skills_set")) %> </label>
         <%
            rowCollect.MoveNext
            loop
            %>
            </label>
  </form>
</div>
    
    <input type="submit" value="Submit" />
  </form>
		<!-- Center Column -->
		<div class="col-sm-6">
		

		</div><!--/Center Column-->


	  
	</div><!--/container-fluid-->
	
	<footer>
		<div class="footer-blurb">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 footer-blurb-item">
						<h3><span class="glyphicon glyphicon-text-size"></span> Alumni</h3>
						<p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>
						<p><a class="btn btn-default" href="#">Procrastinate</a></p>
					</div>
			
				

				</div>
				<!-- /.row -->	
			</div>
        </div>
        
        <div class="small-print">
        	<div class="container">
        		<p><a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact</a></p>
        		<p>Copyright &copy; Example.com 2015 </p>
        	</div>
        </div>
	</footer>

	
    <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
	<!-- IE10 viewport bug workaround -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	
	<!-- Placeholder Images -->
	<script src="js/holder.min.js"></script>
	
</body>

</html>
