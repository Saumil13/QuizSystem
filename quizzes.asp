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
            <h2> Please choose a quiz listed below. </h2>
			
<div class="row">
<% set rs = conn.execute("select * from Quizzes Where Active = 1 ")
do while not rs.eof 
Minutes = rs("Time")/60
%>
<div class="col-xs-12 col-sm-6 col-md-3">	
<div class="well">
<div class="media">
<div class="media-body">
<h4 class="media-heading"><%=rs("Title")%></h4>
<p>Short description</p>
<ul class="list-inline list-unstyled">
<li><span><i class="glyphicon glyphicon-play-circle"></i> <a href="doquiz.asp?ID=<%=rs("ID")%>">Select &amp; Begin</a></span></li>
<li>|</li>
<li>
<span><i class="fa fa-facebook-square"></i></span>
<span><i class="fa fa-twitter-square"></i></span>
</li>
<li>|</li>
<li>
<span><i class="fa fa-clock-o"></i> <%=formatnumber(Minutes,2)%> mins</span>
</li>
</ul>
</div>
</div>
</div>
</div>
<% rs.movenext : loop : rs.close : set rs = nothing %>




</div>
	
	
<nav>
  <ul class="pagination">
    <li class="disabled"><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
  </ul>
</nav>
          </div>

       
      </div>

    <!-- #include file="inc/-footer.asp" -->
    </div>
    <!-- /container -->
  </body>
</html>