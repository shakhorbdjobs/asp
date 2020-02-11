
<link href=css/profile.css rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<%
dim dbshowID,dbshowName
dbshowName= Request.QueryString("dbshowName")
dbshowID=Request.QueryString("dbshowID")
'response.write(dbshowID)
'response.end
%>
<div>
<%
Dim connStr, objConn, getNames
Set objConn = CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\inetpub\wwwroot\Alumniproj\alu.mdb"
objConn.open connStr
%>

<%
'Retrive Specific Id Record From Database
Set rowCollect = objConn.execute("SELECT Name,Email,Phone,Batch FROM alum")

  'response.write(rowCollect.Fields.Item("DiseaseName"))
%>

<div class="container">
	<div class="row">
		<h2 value="<% response.write(rowCollect.Fields.Item("Name")) %>"> </h2>
        
        
       <div class="col-md-7 ">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 value="<% response.write(rowCollect.Fields.Item("Name")) %> ">User Profile </h4>
  
  </div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                <input id="profile-image-upload" class="hidden" type="file">
<div style="color:#999;" >click here to change profile image</div>
                <!--Upload Image Js And Css-->
           
              
   
                
                
                     
                     
                     </div>
              
              <br>
    
              <!-- /input-group -->
            </div>
            <div class="col-sm-6">
            <h4 style="color:#00b1b1;" value=""> </h4></span>
              <span><p value="<% response.write(rowCollect.Fields.Item("Name")) %>">Aspirant</p></span>            
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
<div class="col-sm-5 col-xs-6 tital ">First Name: <% response.write(rowCollect.Fields.Item("Name")) %> </div><div class="col-sm-7 col-xs-6 "><% response.write(rowCollect.Fields.Item("Name")) %></div>
     <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Phone:  <% Response.Write(rowCollect.Fields.Item("Name")) %></div><div class="col-sm-7"> <% response.write(rowCollect.Fields.Item("Phone")) %></div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Email:</div><div class="col-sm-7"> Huddedar</div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Batch:</div><div class="col-sm-7"></div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Department:</div><div class="col-sm-7"></div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Gender:</div><div class="col-sm-7"></div>

 <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Blood Group:</div><div class="col-sm-7"></div>

 <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Skills:</div><div class="col-sm-7"></div>


            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div>  
    <script>
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script>     
   </div>
</div>




         