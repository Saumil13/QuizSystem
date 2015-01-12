      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="default.asp"><img alt="Brand" src="images/logo.png"></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="default.asp">Home</a></li>
              <li><a href="about.asp">About</a></li>
              <li><a href="how-it-works.asp">How it works?</a></li>
			<% if LoginControl() then %>
			  <li><a href="quizzes.asp">Quizzes</a></li>
			<% end if %>
            </ul>
			<% if LoginControl() then %>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
             <a href="profile.asp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=Session("Name")%>&nbsp;<%=Session("SurName")%> <span class="caret"></span></a>
             <ul class="dropdown-menu" role="menu">
             <li><a href="profile.asp">Profile</a></li>
             <li><a href="results.asp">My Results</a></li>
			 	 <% if Session("Admin") = True then %>
			 <li><a href="admin/">Admin Panel</a></li> 
			 <% end if %>
             <li class="divider"></li>
             <li><a href="process.asp?i=Logout">Logout</a></li>
             </ul>
             </li>
			 </ul>
			  <% else %>
			<ul class="nav navbar-nav navbar-right">
              <li><button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#register"><i class="fa fa-plus"></i> Register</button></li>
              <li><button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#login"><i class="fa fa-user"></i> Sign in</button></li>
            </ul>
			<% end if %>
          </div>
          <!--/.nav-collapse -->
        </div>
        <!--/.container-fluid -->
      </nav>