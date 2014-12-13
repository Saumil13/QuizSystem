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
            <h1 class="page-header">Members Management</h1>
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <%
          Page = ClearText(Request.QueryString("Pages"))
          If Page = "Edit" Then 
          	Call Edit
          Else
          Page = "Overview"
          End IF
          %>
        <% If Page = "Overview" Then %>
        <!-- /.row -->
        <div class="row">
		<!-- #include file="inc/-err_messages.asp" -->
          <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
              <tr>
                <th>Name Surname</th>
                <th>E-Mail</th>
                <th>Registration Date</th>
                <th>Management</th>
              </tr>
            </thead>
            <tbody>
              <% set objRs = conn.execute("Select ID,Name,Surname,EMail,Active,RegistrationDate From Members")
                do while not objRs.eof %>
              <tr>
                <td><%=objRs("Name") & " " & objRs("Surname")%></td>
                <td><%=objRs("EMail")%></td>
                <td><%=objRs("RegistrationDate")%></td>
                <td>
                  <% If objRs("Active") = 0 Then %>
                  <a href="members-exec.asp?i=Active&qactive=1&ID=<%=objRs("ID")%>"><img src="../images/lock.png" alt="Passive" width="16" height="16" /></a>
                  <% Else %>
                  <a href="members-exec.asp?i=Active&qactive=0&ID=<%=objRs("ID")%>"><img src="../images/unlock.png" alt="Active" width="16" height="16" /></a>
                  <% End IF %>
                  <a href="members.asp?Pages=Edit&ID=<%=objRs("ID")%>"><img src="../images/edit.png" alt="Edit" width="16" height="16" /></a>
                  <a href="members-exec.asp?i=Delete&ID=<%=objRs("ID")%>"><img src="../images/delete.png" alt="Delete" width="16" height="16" /></a>
                </td>
              </tr>
              <% objRs.movenext : loop : objRs.close : set objRs = nothing %>
            </tbody>
          </table>
        </div>
        <% End IF %>
        <% Sub Edit %>
        <%
          strID = QueryFilter(Request.QueryString("ID"))
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
        <% End Sub %>
        <!-- /.row -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- #include file="inc/-footer.asp" -->
  </body>
</html>