<!DOCTYPE html>
<html>
<body>

<h2>HTML Forms</h2>

<form metod ="post" action="">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="<%request.form("Name")%>"><% response.write("Name") %><br>
  
  <input type="submit" value="Submit">
</form> 


<%

'FIRST OPEN DATABASE CONNECTION'
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr ="Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr



%>
<section>
<%

    if Request.form("Submit")<> "" then
    
    Name=Request.form("fname")

    sql= "SELECT Name FROM alum where Name LIKE '% &Name& %'"

    response.write(sql)
    Set rowCollect = objConn.execute(cp)

    if err<>0 then
        response.write("Nothing Found")
        else
        response.write("data found")
        response.write("Name")
            end if
    end if



%>
</section>





<p>If you click the "Submit" button, the form-data will be sent to a page called "/action_page.php".</p>

</body>
</html>

