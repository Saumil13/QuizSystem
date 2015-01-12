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
	  <div class="row">
		<div class="col-sm-10">
		  <h3>Your Result for Quizname</h3>
		  <% if Session("Admin") = True then %>
		  <a href="admin/" class="btn btn-success" role="button"> Administration </a>
		  <% end if %>
		  <a href="profile.asp" class="btn btn-info" role="button"> My Profile </a>
		  <a href="results.asp" class="btn btn-info" role="button"> See All Results </a>
		  <br />
		</div>
		<div class="col-sm-2"><a href="#" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="images/profile.jpg"></a>
		</div>
	  </div>
	  <br />
	 <%
		ResultID = QueryFilter(Request.QueryString("ResultID"))
		Set rs = conn.execute("Select * from QuizResults Where ID = "&ResultID&"")
if rs.eof then 
Response.redirect "Default.asp?H=999"
end if
%>
		
	  <div class="row">
		<div class="col-sm-9">
		  <div class="resume">
			<div class="panel panel-default">
			  <div class="panel-heading resume-heading">
				<div class="row">
				  <div class="col-lg-12">
					<div class="col-xs-12 col-sm-4">
					  <figure>
						<img class="img-circle img-responsive hidden-xs hidden-sm hidden-md" alt="" src="images/medal.png">
					  </figure>
					  <div class="row">
						<div class="col-xs-12 social-btns">
						  <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
							<a href="#" class="btn btn-social btn-block btn-google">
							<i class="fa fa-google"></i> </a>
						  </div>
						  <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
							<a href="#" class="btn btn-social btn-block btn-facebook">
							<i class="fa fa-facebook"></i> </a>
						  </div>
						  <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
							<a href="#" class="btn btn-social btn-block btn-twitter">
							<i class="fa fa-twitter"></i> </a>
						  </div>
						  <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
							<a href="#" class="btn btn-social btn-block btn-linkedin">
							<i class="fa fa-linkedin"></i> </a>
						  </div>
						</div>
					  </div>
					</div>
<%
Set getquestion = conn.execute("Select Count(ID) as NQuestions from Questions Where QuizID =  "&rs("QuizID")&" ")
NQuestions = getquestion("NQuestions")
getquestion.close : set getquestion = nothing

%>
					<div class="col-xs-12 col-sm-8">
					  <ul class="list-group">
						<li class="list-group-item"><i class="fa fa-sort-amount-asc"></i> Number of Question : <span class="badge"><%=NQuestions%></span></li>
						<li class="list-group-item"><i class="fa fa-check-square-o"></i> Correct Answers :  <span class="badge"><%=rs("NCorrectAnswers")%></span></li>
						<li class="list-group-item"><i class="fa fa-times"></i> Wrong Answers :  <span class="badge"><%=rs("NWrongAnswers")%></span></li>
						<li class="list-group-item"><i class="fa fa-circle-o"></i> Empty Answers :  <span class="badge"><%=rs("NEmptyAnswers")%></span></li>
						<li class="list-group-item last"><i class="fa fa-line-chart"></i> Total Points :  <span class="badge"><%=rs("Achievement")%></span></li>
					  </ul>
					</div>
				  </div>
				</div>
			  </div>
			  <div class="bs-callout bs-callout-danger">
				<h4>See your overall score on this quiz</h4>
				<ul class="list-group">
				  <a class="list-group-item inactive-link" href="#">
				  
<%
Set getsum = conn.execute("Select SUM(Achievement) as TotalAchievement from QuizResults Where QuizID =  "&rs("QuizID")&" ")
TotalAchievement = getsum("TotalAchievement")
getsum.close : set getsum = nothing

Set getsum = conn.execute("Select SUM(Difficulty) as TotalDifficulty from Questions Where QuizID =  "&rs("QuizID")&" ")
TotalDifficulty = getsum("TotalDifficulty")
getsum.close : set getsum = nothing

Set getsum = conn.execute("Select SUM(Achievement) as TotalAchievement from QuizResults")
AllAchievement = getsum("TotalAchievement")
getsum.close : set getsum = nothing

Set getsum = conn.execute("Select SUM(Difficulty) as TotalDifficulty from Questions")
AllDifficulty = getsum("TotalDifficulty")
getsum.close : set getsum = nothing


%>
					<div class="progress">
					  <div data-placement="top" style="width: <%=TotalAchievement%>%;" 
						aria-valuemax="<%=TotalDifficulty%>" aria-valuemin="0" aria-valuenow="<%=TotalAchievement%>" role="progressbar" class="progress-bar progress-bar-success">
						<span class="sr-only"><%=TotalAchievement%>%</span>
						<span class="progress-type">Your Score</span>
					  </div>
					</div>
					<div class="progress">
					  <div data-placement="top" style="width: <%=AllAchievement%>%;" aria-valuemax="<%=AllDifficulty%>" aria-valuemin="0" aria-valuenow="1" role="progressbar" class="progress-bar progress-bar-warning">
						<span class="sr-only"><%=AllAchievement%>%</span>
						<span class="progress-type">Average</span>
					  </div>
					</div>
					<div class="progress-meter">
					  <div style="width: 25%;" class="meter meter-left"><span class="meter-text">Failed</span></div>
					  <div style="width: 25%;" class="meter meter-left"><span class="meter-text">Average</span></div>
					  <div style="width: 30%;" class="meter meter-right"><span class="meter-text">Excellent</span></div>
					  <div style="width: 20%;" class="meter meter-right"><span class="meter-text">Very Good</span></div>
					</div>
				  </a>
				</ul>
			  </div>
			</div>
		  </div>
		</div>
		<%
		rs.close : set rs = nothing
		%>
		
		<%
		  strID = Session("UserID")
		  strSQL = "Select * From Members Where ID = "&strID&""
		  Set objRs = Conn.Execute(StrSQL)
		  %>
		<div class="col-sm-3">
		  <!--left col-->
		  <ul class="list-group">
			<li class="list-group-item text-muted" contenteditable="false">Profile Overview</li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Joined</strong></span> <%=objRs("RegistrationDate")%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Last seen</strong></span> <%=objRs("LastLogin")%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">E-Mail</strong></span> <%=objRs("EMail")%>              </li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Activation: </strong></span> <% IF objRs("Active") = True Then Response.Write("Actived") Else Response.Write("Pasive") End IF %>
			</li>
		  </ul>
		<%
		  objRs.Close
		  Set objRs = Nothing
		  %>
 <%
'Published Quizzes Calculation
 Set pubquizzes = conn.execute("Select Count(ID) as PQuizzes from Quizzes Where MemberID =  "&strID&" ")
PQuizzes = pubquizzes("PQuizzes")
pubquizzes.close : set pubquizzes = nothing

'Taken Quizzes Calculation
 Set takquizzes = conn.execute("Select Count(QuizID) as TQuizzes from QuizResults Where MemberID =  "&strID&" ")
TQuizzes = takquizzes("TQuizzes")
takquizzes.close : set takquizzes = nothing

'High Score Calculation
 Set highscore = conn.execute("Select MAX(Achievement) as HScore from QuizResults Where MemberID =  "&strID&" ")
HScore = highscore("HScore")
highscore.close : set highscore = nothing

'Completed Quizzes Calculation
 Set compquizzes = conn.execute("Select Count(QuizID) as CompletedQuizzes from QuizResults Where MemberID =  "&strID&" And TimeOut = 0 ")
CompletedQuizzes = compquizzes("CompletedQuizzes")
compquizzes.close : set compquizzes = nothing

'Uncompleted Quizzes Calculation
 Set uncompquizzes = conn.execute("Select Count(QuizID) as UnCompletedQuizzes from QuizResults Where MemberID =  "&strID&" And TimeOut = 1 ")
UnCompletedQuizzes = uncompquizzes("UnCompletedQuizzes")
uncompquizzes.close : set uncompquizzes = nothing

 %>
		  <ul class="list-group">
			<li class="list-group-item text-muted">Activity Overview <i class="fa fa-dashboard fa-1x"></i>
			</li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Published Quizzes</strong></span> <%=PQuizzes%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Taken Quizzes</strong></span> <%=TQuizzes%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">High Score</strong></span> <%=HScore%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Completed Quizzes</strong></span> <%=CompletedQuizzes%></li>
			<li class="list-group-item text-right"><span class="pull-left"><strong class="">Uncompleted Quizzes</strong></span> <%=UnCompletedQuizzes%></li>
		  </ul>
		</div>
		<!--/col-3-->

	  </div>
	</div>
  </div>
  <!-- #include file="inc/-footer.asp" -->
</div>
<!-- /container -->
</body>
</html>