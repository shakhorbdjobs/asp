


<%
dim connStr
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "C:\inetpub\wwwroot\Alumniproj\alu.mdb"

%>



  <form action="" method="post" enctype="multipart/form-data" name =skills>  
   <div style="width:200px;border-radius:6px;margin:0px auto">  
<table border="1">  
   <tr>  
      <td colspan="2">Check your Skill::</td>  
   </tr>  
   <tr>  
      <td>PHP</td>  
      <td><input type="checkbox" name="techno[]" value="PHP"></td>  
   </tr>  
   <tr>  
      <td>.Net</td>  
      <td><input type="checkbox" name="techno[]" value=".Net"></td>  
   </tr>  
   <tr>  
      <td>Java</td>  
      <td><input type="checkbox" name="techno[]" value="Java"></td>  
   </tr>  
   <tr>  
      <td>Javascript</td>  
      <td><input type="checkbox" name="techno[]" value="javascript"></td>  
   </tr>  
   <tr>  
      <td colspan="2" align="center">
      <input type="submit" value="submit" name="sub"></td>  
   </tr>  
</table>  
</div>  
</form>  

<%
if request.form("submit")<> "" then  
dim chk 
chk=""



   sql="INSERT INTO Alumskills (alumskill)"
         sql=sql & " VALUES "
        sql=sql & "(" & Request.Form("techno[]") & ","
  
Set rowCollect = objConn1.execute(cp)
if ch = 1  then
      Response.write("dATA INSERTED")  
else  
      Response.write("dATA NOT INSERTED")    
end if
end if
%>


<%
sql="INSERT INTO Alumskills (alumskill)"
         sql=sql & " VALUES "
        sql=sql & "(" & Request.Form("techno[]") & ","



connStr.execute sql
Response.write(sql)

conn.close

%>






    <%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

                <% 
                Set rowCollect = objConn.execute("INSERT INTO AlumSkills")
                 dim i
                i = 0
                do until rowCollect.EOF 
                 'for each x in rowCollect.Fields
                i = i+1
                  %>
    <tbody>
      <tr>
        
        <td><% Response.Write(i) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills2")) %></td>
        <td>
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
        
<%
        strSQL="SELECT AllumSkill(ID) AS ID FROM almum"
        dim cbt,abt,strql
        cbt=Request.Form("Skills2")
        If(InStr(cbt,", ")>0) Then
        abt=Split(cbt,", ")
        strSQL="INSERT INTO Allumskills (Skills2) VALUES ("
        For Each x In abt
        strSQL=strSQL & Skills2 & ")"
        Set objConn=objConn.Execute(strSQL)
        Next
        End If
        
        %>


<%

When the ASP page is submitted & assuming that the admin has selected
only 1 club for a new coach, the table CoachClub can be populated
wtith the following SQL query:

INSERT INTO CoachClub(CoachID,ClubID) VALUES (" &
Request.Form("CoachID") & "," & Request.Form("ClubID") & ")"

CoachID is the name of the textbox & ClibID is the name of the select
list. The problem I am facing is when the admin selects multiple clubs
for a new teacher. This is how I tried it (I am first retrieving the
CoachID of the newly added coach in the DB table Coach so that the
CoachID of the new coach can be populated in the CoachClub DB table.

strSQL="SELECT MAX(CoachID) AS MaxCID FROM Coach"
Set objRS1=Server.CreateObject("ADODB.RECORDSET")
objRS1.Open strSQL,objConn
iMaxCID=objRS1("MaxCID")

'selecting multiple clubs means the next page will get the value as a
comma-delimited string. Hence I am using the Split function

strCID=Request.Form("CoachID")
If(InStr(strCID,", ")>0) Then
arrCID=Split(strCID,", ")
strSQL="INSERT INTO CoachClub (CoachID,ClubID) VALUES ("
For Each iEachCID In arrCID
strSQL=strSQL & iMaxTID & "," & iEachCID & ")"
Set objRS1=objConn.Execute(strSQL)
Next
End If
%>