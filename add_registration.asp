<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <title>Patient Registration Form!</title>

    <link href="home.css" rel="stylesheet" />

    <style>
        .home{border:1px solid black;width:20%;margin:0 autho;}
    </style>
    
  </head>
  <body>
    

    
<div id="logo" class=""></div>


<div class="container">
  <nav class="navbar navbar-expand-lg navbar-light bg-dark">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
    <!--#include file ="inc/header.asp"-->
    <li class="form-inline my-2 my-lg-0">
        <a class="nav-item nav-link" href="add_registration.asp" style="color:white;">All Registered Patient</a>
    </li>
  </div>
</nav>
</div>

<div class="container">

<%
Dim connStr, objConn
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Test\PatientRegistration\Registration.mdb"
objConn.open connStr
%>

</div>




<%
   Name= request.Form("Name")
   doctorId= request.Form("Doctor")
   fromDate= request.Form("fromDate")
   toDate= request.Form("toDate")
   Gender= request.Form("Gender")
%>



<% 'Show All Record %>
<section id = showAll style="margin-bottom:250px;margin-top:25px;">

<div class="container">
  <form method="post" action="">
  <div class="row">
    <div class="col-md-6">
           <div class="row">
              <div class="col-md-3">
                 <h4>Name</h4>
              </div>
              <div class="col-md-9">
                 <input type="text" class="form-control" value="<% response.write(Name) %>" id="Name" name="Name"  placeholder="Enter Name">
              </div>
           </div>
      </div>
      <div class="col-md-6">
           <div class="row">
              <div class="col-md-3">
                 <h4>Doctor</h4>
              </div>
              <% 
                 Set doctor = objConn.execute("SELECT DISTINCT ID,Name FROM Doctor") 
              %>
              <div class="col-md-9">
                <select id="Doctor" name="Doctor">
                    <option value="">Select</option>
                    <%do until doctor.EOF %>
                     <option <% if doctorId <> "" then  if cint(doctorId) = cint(doctor.Fields.Item("ID"))  then response.write "selected" end If  end If%> value="<% response.write(doctor.Fields.Item("ID")) %>"><% response.write(doctor.Fields.Item("Name")) %></option>
                     <%
                      doctor.MoveNext
                      loop
                      doctor.close
                      'objConn.close
                      %>
                 </select>
              </div>
           </div>
      </div>
  </div>
  <div class="row">
    <div class="col-md-6">
           <div class="row">
              <div class="col-md-3">
                 <h4>BirthDate</h4>
              </div>
              <div class="col-md-4">
                 From<input type="date" class="form-control" id="fromDate" value="<% response.write(fromDate) %>" name="fromDate"  placeholder="Enter BirthDate">
              </div>
              <div class="col-md-4">
                 To<input type="date" class="form-control" id="toDate" value="<% response.write(toDate) %>" name="toDate"  placeholder="Enter BirthDate">
              </div>
           </div>
      </div>
      <div class="col-md-6">
           <div class="row">
              <div class="col-md-3">
                 <h4>Gender</h4>
              </div>
              <div class="col-md-9">
                 <div class="radio">
                 <% if Gender = "Male" then %>
                      <input type="radio" name="Gender" value="Male" checked> Male
                      <input type="radio" name="Gender" value="Female"> Female
                      <input type="radio" name="Gender" value="Other"> Other
                  <%
                      elseif Gender = "Female" then
                  %>
                      <input type="radio" name="Gender" value="Male"> Male
                      <input type="radio" name="Gender" value="Female" checked> Female
                      <input type="radio" name="Gender" value="Other"> Other
                  <%
                      elseif Gender = "Other" then
                  %>
                      <input type="radio" name="Gender" value="Male"> Male
                      <input type="radio" name="Gender" value="Female"> Female
                      <input type="radio" name="Gender" value="Other" checked> Other
                  <%
                      else
                  %>
                      <input type="radio" name="Gender" value="Male"> Male
                      <input type="radio" name="Gender" value="Female"> Female
                      <input type="radio" name="Gender" value="Other"> Other
                  <%end if%>
                  </div>
              </div>
           </div>
      </div>
  </div> 
  <input type="submit" name="Search" value="Search" class="btn btn-primary" style='Float:right'> 
  </form>
  
  <h2 style='text-align:center;margin-top:40px'>All Records</h2>         
  <table class="table table-hover">
    <thead>
      <tr>
        <th>SL</th>
        <th>Name</th>
        <th>Phone</th>
        <th>BirthDate</th>
        <th>Gender</th>
        <th>Doctor</th>
        <th>Disease</th>
        <th>RegisterDate</th>
        <th>AdmitDate</th>
        <th>Action</th>
      </tr>
    </thead>
    <% 
    dim count
    if Request.form("Search") <> "" then

        Name= request.Form("Name")
        doctorId= request.Form("Doctor")
        fromDate= request.Form("fromDate")
        toDate= request.Form("toDate")
        Gender= request.Form("Gender")

        dim stringBilder,whereClause,stringBilderDoctor,stringBilderGender,stringBuilderFromDate,fromToUpperDate
        
        'whereClause ="where"

        ' if Name <> "" then 
        '   count = count+1
        '   'response.write(count)
        '   stringBilderName = stringBilderName & " r.Name = '"&Name&"' "
        ' end if

        ' if doctorId <> "" then 
        '   count = count + 1
        '   'response.write(count)
        '   if count <> 1 then
        '      stringBilderDoctor = stringBilderDoctor & " and d.ID = "&doctorId&" "
        '   else
        '      stringBilderDoctor = stringBilderDoctor & " d.ID = "&doctorId&" "
        '   end if


        ' end if


        ' if Gender <> "" then 
        '   count = count + 1
        '   'response.write(count)
        '   if count <> 1 then
        '      stringBilderGender = stringBilderGender & " and r.Gender = '"&Gender&"' "
        '   else
        '      stringBilderGender = stringBilderGender & " r.Gender = '"&Gender&"' "
        '   end if
        ' end if

        'Slv-1
        whereClause ="where"

        if Name = "" AND doctorId = "" AND fromDate = "" AND toDate = "" AND Gender = "" then
           whereClause =""
        end if

        if Name <> "" then 
          count = count+1
          'response.write(count)
          stringBilderName = stringBilderName & " r.Name = '"&Name&"' "
        end if

        if doctorId <> "" then 
          count = count + 1
          'response.write(count)
          if count <> 1 then
             stringBilderDoctor = stringBilderDoctor & " and "
          end if

          stringBilderDoctor = stringBilderDoctor & " d.ID = "&doctorId&" "
          
        end if


        if Gender <> "" then 
          count = count + 1
          'response.write(count)
          if count <> 1 then
             stringBilderGender = stringBilderGender & " and "
          end if

          stringBilderGender = stringBilderGender & " r.Gender = '"&Gender&"' "
        end if


        if fromDate <> "" then 
          count = count + 1
          'response.write(count)
          if count <> 1 then
             fromToUpperDate = fromToUpperDate & " and "
          end if
             fromToUpperDate = fromToUpperDate & " r.birthdate >= #"&fromDate&"# "


          'quer = "SELECT * from register where birthdate >=  "&fromDate&""
          'response.write quer
          'Set fromToUpper = objConn.execute("SELECT * from register where BirthDate >= "&fromDate&"")
        end if
        

        if toDate <> "" then 
          count = count + 1
          if count <> 1 then
             toLowerDate = toLowerDate & " and "
          end if
             toLowerDate = toLowerDate & " r.birthdate <= #"&toDate&"# "
        end if


        if fromDate <> "" AND toDate <> "" then 
          count = count + 1
          if count <> 1 then
             toBetweenDate = toBetweenDate & " and "
          end if
             toBetweenDate = toBetweenDate & " r.birthdate between  #"&fromDate&"# AND #"&toDate&"# "
        end if

        




        'Slv-2
        ' whereClause = "" '"where"

        ' if Name <> "" then 
        '   whereClause = whereClause & " r.Name = '"&Name&"' "
        ' end if

        ' if doctorId <> "" then 

        '   if whereClause <> "" then
        '     whereClause = whereClause & " and "
        '   End if

        '   whereClause = whereClause & " d.ID = "&doctorId&" "
          
        ' end if


        ' if Gender <> "" then 
        '   if whereClause <> "" then
        '     whereClause = whereClause & " and "
        '   End if

        '   whereClause = whereClause & " r.Gender = '"&Gender&"' "
        ' end if

        ' if whereClause <> "" then
        '   whereClause = " where " & whereClause 
        ' End if

        

          sql = "SELECT r.ID, r.Name AS Patient, r.Phone, r.BirthDate, r.Gender, d.Name AS Doctor, p.DiseaseName, r.RegisterDate, r.AdmitDate FROM (register AS r LEFT JOIN Doctor AS d ON r.Doctor = d.id) LEFT JOIN patient AS p ON r.disease = p.id "&whereClause&" "&stringBilderName&" "&stringBilderDoctor&" "&stringBilderGender&" "&fromToUpperDate&" "&toLowerDate&" "&toBetweenDate&" "

 
        'Set rowCollect = objConn.execute("SELECT r.ID, r.Name AS Patient, r.Phone, r.BirthDate, r.Gender, d.Name AS Doctor, p.DiseaseName, r.RegisterDate, r.AdmitDate FROM ((register AS r inner JOIN Doctor AS d ON r.Doctor = d.id) inner JOIN patient AS p ON r.disease = p.id) where (r.Name = '"&Name&"' AND r.Gender = '"&Gender&"' AND d.ID = "&doctorId&") AND (((r.[BirthDate]) Between '"&fromDate&"' And '"&toDate&"'))")
        response.write(sql)


        Set rowCollect = objConn.execute("SELECT r.ID, r.Name AS Patient, r.Phone, r.BirthDate, r.Gender, d.Name AS Doctor, p.DiseaseName, r.RegisterDate, r.AdmitDate FROM (register AS r LEFT JOIN Doctor AS d ON r.Doctor = d.id) LEFT JOIN patient AS p ON r.disease = p.id "&whereClause&" "&stringBilderName&" "&stringBilderDoctor&" "&stringBilderGender&"  "&fromToUpperDate&" "&toLowerDate&" "&toBetweenDate&" ")
    else
        Set rowCollect = objConn.execute("SELECT r.ID, r.Name AS Patient, r.Phone, r.BirthDate, r.Gender, d.Name AS Doctor, p.DiseaseName, r.RegisterDate, r.AdmitDate FROM (register AS r LEFT JOIN Doctor AS d ON r.Doctor = d.id) LEFT JOIN patient AS p ON r.disease = p.id")
    end if 

     'Set rowCollect = objConn.execute("SELECT r.ID, r.Name AS Patient, r.Phone, r.BirthDate, r.Gender, d.Name AS Doctor, p.DiseaseName, r.RegisterDate, r.AdmitDate FROM (register AS r LEFT JOIN Doctor AS d ON r.Doctor = d.id) LEFT JOIN patient AS p ON r.disease = p.id")
    
    dim i
    i = 0
    
       do until rowCollect.EOF 
           'for each x in rowCollect.Fields
           i = i+1
    %>
    <tbody>
      <tr>
        
        <td><% Response.Write(i) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Patient")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Phone")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("BirthDate")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Gender")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Doctor")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("DiseaseName")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("RegisterDate")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("AdmitDate")) %></td>
        <td>
           <a href="EditRegistration.asp?registerId=<%response.write(rowCollect.Fields.Item("ID"))%>">Edit</a>
           <a href="add_registration.asp?deleteId=<%response.write(rowCollect.Fields.Item("ID"))%>">Delete</a>
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

<div>
</section>










<!--#include file ="inc/footer.asp"-->