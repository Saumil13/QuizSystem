<!-- #include file="../inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- #include file="inc/-head.asp" -->
  </head>
  <body>
    <div id="wrapper">
      <!-- Navigation -->
      <!-- #include file="inc/-nav.asp" -->
      <div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h1 class="page-header">My Profile</h1>
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
          <%
          strID = Session("UserID")
          strSQL = "Select * From Members Where ID = "&strID&""
          Set objRs = Conn.Execute(StrSQL)
          %>
        <h4>Edit User: <%=objRs("EMail")%></h4>
        <br />
        <form action="members-exec.asp?i=Edit&D=<%=strID%>" method="post">
          <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" class="form-control" name="firstname" value="<%=objRs("Name")%>" />
          </div>
          <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" class="form-control" name="lastname" value="<%=objRs("Surname")%>" />
          </div>
          <div class="form-group">
            <label for="lname">E-Mail Address</label>
            <input type="email" class="form-control" name="email" value="<%=objRs("EMail")%>" />
          </div>
          <div class="form-group">
            <label for="lname">Password (do not type if you dont change)</label>
            <input type="password" class="form-control" name="password"  />
          </div>
          <div class="checkbox">
            <label>
            <input type="checkbox" name="active" value="1" <% IF objRs("Active") = True Then Response.Write("checked=""checked""") %>> Active
            </label>
          </div>
          <button type="submit" class="btn btn-default">Save</button>
        </form>
        <%
          objRs.Close
          Set objRs = Nothing
          %>
        <!-- /.row -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- #include file="inc/-footer.asp" -->
  </body>
</html>