<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <title>Patient Registration Form!</title>
    <link href="disease.css" rel="stylesheet" />

    <style>
        .home{border:1px solid black;width:20%;margin:0 autho;}
    </style>
  </head>
  <body>
    

    

<div id=diseaseLogo></div>




<div class="container">
  <nav class="navbar navbar-expand-lg navbar-light bg-dark">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-item nav-link" href="home.asp" style="color:white;">Registration</a>
      </li>

      <li class="nav-item active">
        <a class="nav-item nav-link" href="doctor.asp" style="color:white;">Add Doctor</a>
      </li>

      <li class="nav-item active">
        <a class="nav-item nav-link" href="disease.asp" style="color:white;">Add Disease</a>
      </li>
      
    </ul>
    <li class="form-inline my-2 my-lg-0">
        <a class="nav-item nav-link" href="disease.asp" style="color:white;">Show All Disease</a>
    </li>
  </div>
</nav>
</div>


<%
dim diseaseId
diseaseId=Request.QueryString("ID")
'response.write(diseaseId)
'response.end
%>


<%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>


<div class = "container">

        <%
        'Update Specific Id Record into Database
        if Request.form("submit") <> "" then
        

        Dim updateSQL
        'strSQL = "INSERT INTO patient(DiseaseName) VALUES('" & Form_Name & "')"
        updateSQL="UPDATE alum SET "
        updateSQL=updateSQL & "Name='" & Request.Form("Name") & "'"
        updateSQL=updateSQL & " WHERE Name=" & Name & ""
        on error resume next
        'response.write updateSQL
        'response.end

        Dim objCmd
        set objCmd = Server.Createobject("ADODB.Command")
        objCmd.ActiveConnection = objConn 
        objCmd.CommandText = updateSQL
        objCmd.NamedParameters = true
        objCmd.Execute

        if err<>0 then
            response.write("No update permissions!")
        else
        %>
            <h2 style='color:green;font-weight:bold' ><% response.write("Record Id  "& Name &"  Updated Successfully") %></h2>
        <%
        end if


        end if
        %>
</div>











<%
'Retrive Specific Id Record From Database
Set rowCollect = objConn.execute("SELECT * FROM alum WHERE Name=" & Name & "")

  'response.write(rowCollect.Fields.Item("DiseaseName"))
%>




<div class="container main">

<div style="width:60%;margin:0 auto;">
<h3>Update Member</h3>
  <form method="post" action="">
    <div class="form-group">
        <label for="Disease">Member Name</label>
        <input type="text" class="form-control" value="<% response.write(rowCollect.Fields.Item("Name")) %>" name="Name" id="Name" aria-describedby="emailHelp">
    </div>

    <!-- <button type="submit" class="btn btn-primary">Submit</button>-->
        <input type="submit" name="submit" value="Update">
        <input type="reset" value="Cancel">
    </form>
    </div>
</div>

<%
 rowCollect.close
  objConn.close
%>




    
<footer id="main-footer" class="bg-dark fixed-bottom">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <div class="py-4">
                        <h3 style='color:white'>Footer</h3>
                        <p style='color:white'>Copyright &copy; 2020</p>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#contactModal">Contact Us</button>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <div class="modal fade text-dark" id="contactModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="contactModalTitle">Contact Us</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/" method="post">
                        <div class="form-group">
                            <label for="Name">Name</label>
                            <input type="text" class="form-control" id="Name" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="Email">Email</label>
                            <input type="email" class="form-control" id="Email" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="Name">Message</label>
                            <textarea class="form-control"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>