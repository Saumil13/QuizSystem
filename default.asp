<!-- #include file="inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- #include file="inc/-head.asp" -->
  </head>
  <body>
    <div class="container">
    <!-- #include file="inc/-modal.asp" -->
      <!-- Static navbar -->
    <!-- #include file="inc/-navigation.asp" -->
	<!-- #include file="inc/-err_messages.asp" -->
      <div class="content-area">
    <!-- #include file="inc/-slider.asp" -->
        <div class="row">
          <div class="col-md-8 leftsidebar">
            <h2> Welcome to Quiz System </h2>
            <p>Whats new?</p>
			<%
			' we are getting release notes from settings table. it can modify from admin panel in general settings section.
          strSQL = "Select * From Settings"
          Set objRs = Conn.Execute(StrSQL)
          %>
            <p>
			
			<%=HTMLRead(objRs("ReleaseNotes"))%>
			</p>
		<%
          objRs.Close
          Set objRs = Nothing
          %>
          </div>
          <div class="col-md-4 rightsidebar">
            <h2> Create your free quiz </h2>
            <p>You can create your own quiz in a few simple steps. Everyone can solve and system will automatically grade quizzes and show the quiz results online. </p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6 col-md-3">
          <a href="#" class="thumbnail">
          <img src="images/logo.png" alt="...">
          </a>
        </div>
        <div class="col-xs-6 col-md-3">
          <a href="#" class="thumbnail">
          <img src="images/logo.png" alt="...">
          </a>
        </div>
        <div class="col-xs-6 col-md-3">
          <a href="#" class="thumbnail">
          <img src="images/logo.png" alt="...">
          </a>
        </div>
        <div class="col-xs-6 col-md-3">
          <a href="#" class="thumbnail">
          <img src="images/logo.png" alt="...">
          </a>
        </div>
      </div>
    <!-- #include file="inc/-footer.asp" -->
    </div>
    <!-- /container -->
  </body>
</html>