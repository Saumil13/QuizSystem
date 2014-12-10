<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
<div class="navbar-header">
  <a class="navbar-brand" href="default.asp"><img alt="Brand" src="../images/logo.png"></a>
</div>
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
  <!-- /.dropdown -->
  <li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	<%=Session("Name")%>&nbsp;<%=Session("SurName")%> <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
	</a>
	<ul class="dropdown-menu dropdown-user">
	  <li><a href="profile.asp"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
	  <li class="divider"></li>
	  <li><a href="../process.asp?i=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	  </li>
	</ul>
	<!-- /.dropdown-user -->
  </li>
  <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->
<div class="navbar-default sidebar" role="navigation">
  <div class="sidebar-nav navbar-collapse">
	<ul class="nav" id="side-menu">
	  <li class="sidebar-search">
		<div class="input-group custom-search-form">
		  <input type="text" class="form-control" placeholder="Quick Search...">
		  <span class="input-group-btn">
		  <button class="btn btn-default" type="button">
		  <i class="fa fa-search"></i>
		  </button>
		  </span>
		</div>
		<!-- /input-group -->
	  </li>
	  <li><a class="active" href="default.asp"><i class="fa fa-dashboard fa-fw"></i> Overview</a></li>
	  <li><a class="active" href="../" target="_blank"><i class="fa fa-binoculars fa-fw"></i> View Site</a></li>
	  <li><a class="active" href="help.asp"><i class="fa fa-life-ring fa-fw"></i> Help &amp; Support</a></li>
	  <li><a class="active" href="members.asp"><i class="fa fa-users fa-fw"></i> Members </a></li>
	  <li><a class="active" href="quiz.asp"><i class="fa fa-file-text fa-fw"></i> Quizzes</a></li>
	  <li><a class="active" href="settings.asp"><i class="fa fa-wrench fa-fw"></i> General Settings</a></li>
	</ul>
  </div>
  <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
</nav>