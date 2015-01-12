<!-- #include file="inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- #include file="inc/-head.asp" -->
  </head>
  <body>
<%
LoginGate()
%>
    <div class="container">
    <!-- #include file="inc/-modal.asp" -->
      <!-- Static navbar -->
    <!-- #include file="inc/-navigation.asp" -->
	<!-- #include file="inc/-err_messages.asp" -->
      <div class="content-area">       
          <div class="full">
            <h2>Quiz Management</h2>
			<div class="row">
			<div class="col-lg-12">
			<a href="profile.asp" class="btn btn-primary" role="button"> « Back to Profile</a>
			<a href="quiz.asp?Pages=Add" class="btn btn-info" role="button">Add New Quiz </a>
			</div>
			</div>
			<br />
			<div class="row">
			<div class="col-lg-12">

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
              <%
				strUID = Session("UserID")  ' setting strID as MemberID from active session
				set objRs = conn.execute("Select ID,MemberID,Title,Time,Active From Quizzes Where MemberID = "&strUID&"")
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
                  <a href="quiz-exec.asp?i=Active&qactive=1&ID=<%=objRs("ID")%>"><img src="images/lock.png" alt="Active" width="16" height="16" /></a>
                  <% Else %>
                  <a href="quiz-exec.asp?i=Active&qactive=0&ID=<%=objRs("ID")%>"><img src="images/unlock.png" alt="Passive" width="16" height="16" /></a>
                  <% End IF %>
                  <a href="quiz.asp?Pages=Edit&ID=<%=objRs("ID")%>"><img src="images/edit.png" alt="Edit" width="16" height="16" /></a>
                  <a href="quiz-exec.asp?i=Delete&ID=<%=objRs("ID")%>"><img src="images/delete.png" alt="Delete" width="16" height="16" /></a>
                </td>
              </tr>
              <% objRs.movenext : loop : objRs.close : set objRs = nothing %>
            </tbody>
          </table>
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
            <label for="fname">Short Description</label>
            <input type="text" class="form-control" name="description" value="" />
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
          <button type="submit" class="btn btn-success">Save</button>
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
            <label for="fname">Short Description</label>
            <input type="text" class="form-control" name="description" value="<%=objRs("Description")%>" />
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
          <button type="submit" class="btn btn-success">Save</button>
        </form>
        <%
          objRs.Close
          Set objRs = Nothing
          %>
        <% End Sub %>
					  </div>
			</div>			

          </div>

       
      </div>

    <!-- #include file="inc/-footer.asp" -->
    </div>
    <!-- /container -->
  </body>
</html>