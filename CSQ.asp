<%

    dim check
    check=Request.QueryString("Name")

    if Request.form("submit") <> "" then

    Name = Request.form("Name")
    Phone = Request.form("phone")
    Email = Request.form("email")

      dim sqls
      sqls = "SELECT * FROM alum WHERE Name LIKE'%'&Name& '%'"

      objConn.execute(sqls)
      
        if err<>0 then
        response.write("NOD DATA FOUND")   
            else

            %>
                <% 
                Set rowCollect = objConn.execute("SELECT FROM alum WHERE Name LIKE  '%S' ")
                 dim i
                i = 0
                do until rowCollect.EOF 
                 'for each x in rowCollect.Fields
                i = i+1
                  %>
    <tbody>
      <tr>
        
        <td><% Response.Write(i) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Name")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Phone")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Batch")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Birthday")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Gender")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Department")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Bloodgroup")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Skills2")) %></td>
        <td>
           <a href="ud_db.asp?dbshowID=<%response.write(rowCollect.Fields.Item("ID"))%>">Edit</a>
           <a href="del_db.asp?delID=<%response.write(rowCollect.Fields.Item("ID"))%>">Delete</a>
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
            </table> 
            <%
            end if


        end if
        %>











<label for="phone">Phone:</label>
  <input type="text" id="phone" placeholder="Enter Phone" name="phone">
  <label for="email">Email:</label>
  <input type="text" id="email" placeholder="Enter email" name="email">
  <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="Birthday">
   
    <label  for="Gender" >Gender </label>
        <label class="radio-inline" >
        <input input class="radio-inline" id="male" name="gender" type="radio" value="male" /> Male
     </label>
     <label  class="radio-inline" for="Gender" > 
     <input class="radio-inline"  id="female" name="gender" type="radio" value="female" /> Female </label>