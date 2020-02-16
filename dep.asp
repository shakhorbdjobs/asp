
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

    <div class="form-group">
        <label for="Department">Choose Department:</label>
        <select id="Department" name="Department">
            <option>Select</option>
            <%do until rowCollect.EOF %>
            <option value="<% response.write(rowCollect.Fields.Item("ID")) %>"><% response.write(rowCollect.Fields.Item("dep_name")) %></option>
            <%
            rowCollect.MoveNext
            loop
            %>
            </select>
    </div>
