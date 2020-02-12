<!DOCTYPE html>
<html lang="en">
<head>
    <!--#include file="script.asp"-->
</head>
<body>
    <!-- Navigation INCLUDE FILE -->
<!--#include file="navig.asp"-->

    <%
    'opening db connection
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr ="Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

<%
    'opening db connection
Dim connStr3, objConn3, getNames3
Set objConn3 = CreateObject("ADODB.Connection")
connStr3 = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn3.open connStr3
%>


<!--#include file="regform.asp"-->
 

</div>
   
 
		<!-- Center Column -->
		<div class="col-sm-6">	
		</div><!--/Center Column-->
	</div><!--/container-fluid-->
	
		<!--#include file="footer.asp"-->	
     <!--#include file="dwjs.asp"-->
	</div>
</body>
</html>
