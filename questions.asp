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
  <%
    strID = QueryFilter(Request.QueryString("QD"))
    strSQL = "Select * From Quizzes Where ID = "&strID&""
    Set objRs = Conn.Execute(StrSQL)
    if objRs.eof then
    response.redirect "quiz.asp"
    end if
    QuizTitle = objRs("Title")
    QuizTime = objRs("Time")
    objRs.close : set objrs = nothing
    %>
    <div class="container">
    <!-- #include file="inc/-modal.asp" -->
      <!-- Static navbar -->
    <!-- #include file="inc/-navigation.asp" -->
	<!-- #include file="inc/-err_messages.asp" -->
      <div class="content-area">       
          <div class="full">
            <h2>Quiz {<%=QuizTitle%>} Question Management</h2>
			<div class="row">
			<div class="col-lg-12">
			<a href="quiz.asp" class="btn btn-primary" role="button"> « Back to Quizzes</a>
			<a href="questions.asp?QD=<%=strID%>&Pages=Add" class="btn btn-info" role="button">Add a question </a>
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
                <th>Question #</th>
                <th>Difficulty</th>
                <th>Created By</th>
                <th>Management</th>
              </tr>
            </thead>
            <tbody>
              <% set objRs = conn.execute("Select ID,MemberID,QuizID,Question,Difficulty,Active From Questions Where QuizID = "&strID&"")
                m = 1
                  do while not objRs.eof
                  Select case(objRs("Difficulty"))
                  case 5
                  Difficulty = "Easy"
                  case 10
                  Difficulty = "Normal"
                  case 20
                  Difficulty = "Hard"
                  end select
                
                  %>
              <tr>
                <td>Question <%=m%></td>
                <td><%=Difficulty%></td>
                <td><%=MemberName(objRs("MemberID"))%></td>
                <td>
                  <% If objRs("Active") = 0 Then %>
                  <a href="questions-exec.asp?i=Active&qactive=1&ID=<%=objRs("ID")%>&D=<%=strID%>"><img src="images/lock.png" alt="Active" width="16" height="16" /></a>
                  <% Else %>
                  <a href="questions-exec.asp?i=Active&qactive=0&ID=<%=objRs("ID")%>&D=<%=strID%>"><img src="images/unlock.png" alt="Passive" width="16" height="16" /></a>
                  <% End IF %>
                  <a href="questions.asp?Pages=Edit&ID=<%=objRs("ID")%>&QD=<%=strID%>"><img src="images/edit.png" alt="Edit" width="16" height="16" /></a>
                  <a href="questions-exec.asp?i=Delete&ID=<%=objRs("ID")%>&D=<%=strID%>"><img src="images/delete.png" alt="Delete" width="16" height="16" /></a>
                </td>
              </tr>
              <% m=m+1 : objRs.movenext : loop : objRs.close : set objRs = nothing %>
            </tbody>
          </table>
		   <% End IF %>
		   <% Sub Add %>
        <h4>Add New Question</h4>
        <br />
        <form action="questions-exec.asp?i=AddNew" method="post">
          <input type="hidden" name="QuizID" value="<%=strID%>" />
          <div class="form-group">
            <label for="fname">Difficulty</label>
            <select name="difficulty" class="form-control">
              <option value="5">Easy</option>
              <option value="10">Normal</option>
              <option value="20">Hard</option>
            </select>
          </div>
          <div class="form-group">
            <label for="fname">Question</label>
            <textarea class="form-control" name="question"></textarea>
          </div>
          <%
            dim i
            for i = 1 to 4 step 1 %>
          <div class="form-group">
            <label for="lname">Answer <%=i%>:</label>
          </div>
          <div class="row">
            <div class="form-group">
              <div class="col-md-10"><input type="text" class="form-control" name="answer" value="" /></div>
              <div class="col-md-2"><input type="radio" class="form-control" name="isanswer" value="<%=i%>" ></div>
            </div>
          </div>
          <% next %>
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
          strID2 = QueryFilter(Request.QueryString("ID"))
          strSQL = "Select * From Questions Where ID = "&strID2&""
          Set objRs = Conn.Execute(StrSQL)
          %>
        <h4>Edit Question</h4>
        <br />
        <form action="questions-exec.asp?i=Edit" method="post">
          <input type="hidden" name="QuizID" value="<%=strID%>" />
          <input type="hidden" name="QuestionID" value="<%=strID2%>" />
          <div class="form-group">
            <label for="fname">Difficulty</label>
            <select name="difficulty" class="form-control">
              <option value="5" <% if objRs("Difficulty") = 5 then %> selected<% end if %> >Easy</option>
              <option value="10" <% if objRs("Difficulty") = 10 then %> selected<% end if %>>Normal</option>
              <option value="20" <% if objRs("Difficulty") = 20 then %> selected<% end if %>>Hard</option>
            </select>
          </div>
          <div class="form-group">
            <label for="fname">Question</label>
            <textarea class="form-control" name="question"><%=objrs("Question")%></textarea>
          </div>
          <% 
            dim i : i = 1
            set rs = Conn.Execute("Select * from Options Where QuesionID = "&strID2&" order by ID asc") %>
          <% do while not rs.eof %>
          <div class="form-group">
            <label for="lname">Answer <%=i%>:</label>
          </div>
          <div class="row">
            <div class="form-group">
              <div class="col-md-10"><input type="text" class="form-control" name="answer" value="<%=rs("Name")%>" /></div>
              <div class="col-md-2"><input type="radio" class="form-control" name="isanswer" value="<%=i%>"<% if rs("TrueAnswer") = True then %> checked<% end if %> ></div>
            </div>
          </div>
          <% i=i+1 : rs.movenext : loop :rs.close : set rs = nothing %>
          <div class="checkbox">
            <label>
            <input type="checkbox" name="active" value="1"  <% IF objRs("Active") = True Then Response.Write("checked=""checked""") %>> Active
            </label>
          </div>
          <button type="submit" class="btn btn-default">Save</button>
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