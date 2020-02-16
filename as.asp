<% 'Show All Record %>
<section id = showAll>

<div class="container">
  <h2>All Records</h2>          
  <table class="table table-hover">
    <thead>
      <tr>
        <th>SL</th>
        <th>Name</th>
        <th>Phone</th>
        <th>BirthDate</th>
        <th>Gender</th>
        <th>Action</th>
      </tr>
    </thead>
    <% 
    Set rowCollect = objConn.execute("SELECT Name,Email,Phone,Batch FROM alu")

    'response.write rowCollect(0,0)
    'response.write rowCollect.Fields.count-1
    'for i = 0 to ubound()

    'response.end
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
        <td><% Response.Write(rowCollect.Fields.Item("Email")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Phone")) %></td>
        <td><% Response.Write(rowCollect.Fields.Item("Batch")) %></td>
        <td>
           <a href="EditDoctor.asp?doctorId=<%response.write(rowCollect.Fields.Item("ID"))%>">Edit</a>
           <a href="">View</a>
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
