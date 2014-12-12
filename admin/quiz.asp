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
            <h1 class="page-header">Quiz Management</h1>
			<a href="quiz.asp?Pages=Add" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> Add New</a>
          </div>
		 
        </div>
        <!-- /.row -->
        <%
          Page = ClearText(Request.QueryString("Pages"))
          If Page = "Edit" Then 
          	Call Edit
          Elseif Page = "Add" then
          	Call Add
          else
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
                <th>Quiz Title</th>
                <th>Question</th>
                <th>Time (sec)</th>
                <th>Created By</th>
                <th>Management</th>
              </tr>
            </thead>
            <tbody>
              <% set objRs = conn.execute("Select ID,MemberID,Title,Time,Active From Quizzes")
                do while not objRs.eof 
                
                %>
              <% set questioncount = conn.execute("Select count(ID) as Count from Questions Where QuizID = "&objRs("ID")&" ") %>
              <tr>
                <td><%=objRs("Title")%></td>
                <td><%=questioncount("Count")%> <a href="questions.asp?QD=<%=objRs("ID")%>">(edit questions)</a>	</td>
                <td><%=objRs("Time")%></td>
                <td><%=MemberName(objRs("MemberID"))%></td>
                <td>
                  <% If objRs("Active") = 0 Then %>
                  <a href="quiz-exec.asp?i=Active&qactive=1&ID=<%=objRs("ID")%>"><img src="../images/lock.png" alt="Active" width="16" height="16" /></a>
                  <% Else %>
                  <a href="quiz-exec.asp?i=Active&qactive=0&ID=<%=objRs("ID")%>"><img src="../images/unlock.png" alt="Passive" width="16" height="16" /></a>
                  <% End IF %>
                  <a href="quiz.asp?Pages=Edit&ID=<%=objRs("ID")%>"><img src="../images/edit.png" alt="Edit" width="16" height="16" /></a>
                  <a href="quiz-exec.asp?i=Delete&ID=<%=objRs("ID")%>"><img src="../images/delete.png" alt="Delete" width="16" height="16" /></a>
                </td>
              </tr>
              <% objRs.movenext : loop : objRs.close : set objRs = nothing %>
            </tbody>
          </table>
        </div>
        <% End IF %>
        <% Sub Add %>
        <h4>Add New Quiz</h4>
        <br />
        <form action="quiz-exec.asp?i=AddNew" method="post">
          <div class="form-group">
            <label for="fname">Quiz Title</label>
            <input type="text" class="form-control" name="title" value="" />
          </div>
          <div class="form-group">
            <label for="lname">Time (second)</label>
            <input type="number" class="form-control" name="time" value="" />
          </div>
          <div class="checkbox">
            <label>
            <input type="checkbox" name="active" value="1" > Active
            </label>
          </div>
          <button type="submit" class="btn btn-default">Save</button>
        </form>
        <% end sub %>
        <% Sub Edit %>
        <%
          strID = QueryFilter(Request.QueryString("ID"))
          strSQL = "Select * From Quizzes Where ID = "&strID&""
          Set objRs = Conn.Execute(StrSQL)
          %>
        <h4>Edit Quiz: <%=objRs("Title")%></h4>
        <br />
        <form action="quiz-exec.asp?i=Edit&D=<%=strID%>" method="post">
          <div class="form-group">
            <label for="fname">Quiz Title</label>
            <input type="text" class="form-control" name="title" value="<%=objRs("Title")%>" />
          </div>
          <div class="form-group">
            <label for="lname">Time (second)</label>
            <input type="number" class="form-control" name="time" value="<%=objRs("Time")%>" />
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