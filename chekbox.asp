
<%
Dim connStr1, objConn1, getNames1
Set objConn1 = CreateObject("ADODB.Connection")
connStr1 = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn1.open connStr1
%>
<%

sp= "SELECT ID,skills_set FROM Skills2"
Set rowCollect = objConn1.execute(sp)



%>


<div class="col-sm-6">
    <p>Check your Skill:</p>
  <form>  
    <label class="checkbox-inline" for="skills">
        <%do until rowCollect.EOF %>
      <input type="checkbox" 
      value="<% response.write(rowCollect.Fields.Item("ID")) %>">
      <% response.write(rowCollect.Fields.Item("skills_set")) %> </label>
         <%
            rowCollect.MoveNext
            loop
            %>
            </label>
  </form>
</div>
 




    