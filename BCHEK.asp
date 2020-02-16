


<%

if request.form("submit") <> "" then
      
      response.write("okk")
    
      
      'dim sql
      'sql= "INSERT INTO Alumskills (ID,Alumid,)"
end if


 %>


<%
Dim connStr1, objConn1
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

   if request.form(check==1)
   {
     sql= INSERT INTO Alumskills WHERE ID " & nameID &"
     

   }