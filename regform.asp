
<%

    if Request.form("submit") <> "" then

        dim messagei
        Name= request.Form("firstname")
        Email= request.Form("email")
        Phone= request.Form("Phone")
        BirthDay= request.Form("Birthday")
        Batch= request.Form("batch")
        Gender= request.Form("gender")
        Department= request.Form("Department")
        BloodGroup= request.Form("bgroup")
        Skills= request.Form("skills")
        Skills2= request.Form("skills2")

        

        dim gndr
        gndr = Request.Form("Gender")

        dim depa
        depa = Request.form("Department")

        dim bgrps
        bgrps = Request.form("bgroup")



    if  Name = ""  then
                Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")
     
    elseif Email ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Phone ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Birthday ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Batch ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Gender ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Department ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif BloodGroup ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Skills ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")

    elseif Skills2 ="" then
            Response.Write("<h4 style='color:red'>Field Must not be empty</h4>")
 else
    Dim sql
         sql="INSERT INTO alum (Name,Email,"
         sql=sql & "Birthday,Phone,Batch,Gender,Department,Bloodgroup,Skills,Skills2)"
         sql=sql & " VALUES "
        sql=sql & "('" & Request.Form("firstname") & "',"
        sql=sql & "'" & Request.Form("email") & "',"
        sql=sql & "'" & Request.Form("Birthday") & "',"
        sql=sql & "'" & Request.Form("phone") & "',"
        sql=sql & "'" & Request.Form("batch") & "',"
        sql=sql & "'" & Request.Form("gender") & "',"
        sql=sql & "" & Request.Form("department") & ","
        sql=sql & "" & Request.Form("bgroup") & ","
        sql=sql & "'" & Request.Form("skills") & "',"
        sql=sql & "" & Request.Form("Skills2") & ")"



        if err<>0 then
        Response.Write("<h2 style='color:red'>" & "Data Insrting error</h3>")
        else
        Response.Write("<h2 style='color:green'>" & " Data Added Successfully</h3>")
        end if

        
    end if
    end if

%>
 <form name ="form" action="reg.asp" method="post" >

<div class="container-fluid">

	
    <label for="fname"> Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name.." >

    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your email.." ><i></i>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" placeholder="Your Phone.." ><i></i>

    <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="Birthday">   

    <label for="batch">Batch</label>
    <input type="text" id="batch" name="batch" placeholder="Your Batch." ><i></i>
    
     <label  for="gender" >Gender </label>
        <label class="radio-inline" >
        <input id="male" name="gender" type="radio" value="male" /> Male
     </label>
     <label  class="radio-inline" for="gender" > <input class="radio-inline"  id="female" name="gender" type="radio" value="female" /> Female </label>
     </div>
     <div class="container-fluid">
    <%
    'Database Query execution'
    sp= "SELECT ID,dep_name FROM dep"
    Set rowCollect = objConn.execute(sp)%>

      
    <label for="department">Department</label>
    
    <select id="Department" name="Department">
            <%do until rowCollect.EOF %>
            
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("dep_name")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
             
    <%
      lp= "SELECT ID,bgp FROM Bgrp"
      Set rowCollect = objConn3.execute(lp)
        %>         
      
    </select>
    <label for="bgrop">Blood Group</label>
    <select id="Bloodgrp" name="bgroup">
            
            <%do until rowCollect.EOF %>
            
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("bgp")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
    </select>
 
    <label for="skills">Skills</label>
    <input type="text" id="profession" name="skills" placeholder="Your Skills"><i><% =messagei %></i>

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
  <form name="check" method="post">  
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

            <input type="submit" name="submit" value="Submit" />
 </div>
   </form>
