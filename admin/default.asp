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
            <h1 class="page-header">Quick Overview</h1>
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <%
          strSQL = "Select Count(ID) As Calc From Quizzes"
          set objRs = Conn.Execute(strSQL)
          NofQuiz = objRs("Calc")
          objRs.Close
          
          strSQL = "Select Count(ID) As Calc From Questions"
          set objRs = Conn.Execute(strSQL)
          NofQuestion = objRs("Calc")
          objRs.Close
          
          strSQL = "Select Count(ID) As Calc From Members Where Active = 1"
          set objRs = Conn.Execute(strSQL)
          NofMembers = objRs("Calc")
          objRs.Close
          
          strSQL = "SELECT max(Achievement) As Calc From QuizResults"
          set objRs = Conn.Execute(strSQL)
          if objRs.eof then
          TheHighestScore = ""
          end if
          TheHighestScore = objRs("Calc")
          objRs.Close
          if isnull(TheHighestScore) then
          TheHighestScore = "0"
          end if
          
          
          %>
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="panel panel-orange">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-3">
                    <i class="fa fa-file-text fa-5x"></i>
                  </div>
                  <div class="col-xs-9 text-right">
                    <div class="huge"><%=NofQuiz%></div>
                    <div>Number of Quizzes</div>
                  </div>
                </div>
              </div>
              <a href="quiz.asp">
                <div class="panel-footer">
                  <span class="pull-left">View All Quizzes</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-3">
                    <i class="fa fa-question fa-5x"></i>
                  </div>
                  <div class="col-xs-9 text-right">
                    <div class="huge"><%=NofQuestion%></div>
                    <div>Number of Questions</div>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer">
                  <span class="pull-left">View All Questions</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-3">
                    <i class="fa fa-users fa-5x"></i>
                  </div>
                  <div class="col-xs-9 text-right">
                    <div class="huge"><%=NofMembers%></div>
                    <div>Active Members</div>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer">
                  <span class="pull-left">View All Members</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-3">
                    <i class="fa fa-line-chart  fa-5x"></i>
                  </div>
                  <div class="col-xs-9 text-right">
                    <div class="huge"><%=TheHighestScore%></div>
                    <div>The highest score</div>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer">
                  <span class="pull-left">View All Scores</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
                </div>
              </a>
            </div>
          </div>
        </div>
        <!-- /.row -->
        <div class="row">
          <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
              <tr>
                <th>Name Surname</th>
                <th>E-Mail</th>
                <th>Last Login</th>
                <th>Registration Date</th>
              </tr>
            </thead>
            <tbody>
              <% set rs = conn.execute("Select * From Members Where Active = 1")
                do while not rs.eof %>
              <tr>
                <td><%=rs("Name")%> <%=rs("Surname")%></td>
                <td><%=rs("EMail")%></td>
                <td><%=rs("LastLogin")%></td>
                <td><%=rs("RegistrationDate")%></td>
              </tr>
              <% rs.movenext : loop : rs.close : set rs = nothing %>
            </tbody>
          </table>
        </div>
        <!-- /.row -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- #include file="inc/-footer.asp" -->
  </body>
</html>