<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Administration</title>
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<!-- Style Codes for Admin Template -->
<link href="../css/admin.css" rel="stylesheet">
<!-- JavaScript Libraries
    ================================================== -->
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div id="wrapper">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
<div class="navbar-header">
  <a class="navbar-brand" href="default.asp">IUS Quiz System</a>
</div>
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
  <!-- /.dropdown -->
  <li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	Fahri Dede <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
	</a>
	<ul class="dropdown-menu dropdown-user">
	  <li><a href="Profile.asp"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
	  <li class="divider"></li>
	  <li><a href="Logout.asp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
	  <li><a class="active" href="index.html"><i class="fa fa-dashboard fa-fw"></i> Overview</a></li>
	  <li><a class="active" href="#"><i class="fa fa-binoculars fa-fw"></i> View Site</a></li>
	  <li><a class="active" href="#"><i class="fa fa-life-ring fa-fw"></i> Help &amp; Support</a></li>
	  <li><a class="active" href="#"><i class="fa fa-users fa-fw"></i> Members </a></li>
	  <li><a class="active" href="#"><i class="fa fa-file-text fa-fw"></i> Quizzes</a></li>
	  <li><a class="active" href="#"><i class="fa fa-wrench fa-fw"></i> General Settings</a></li>
	</ul>
  </div>
  <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
</nav>
<div id="page-wrapper">
<div class="row">
  <div class="col-lg-12">
	<h1 class="page-header">Quick Overview</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-3 col-md-6">
	<div class="panel panel-orange">
	  <div class="panel-heading">
		<div class="row">
		  <div class="col-xs-3">
			<i class="fa fa-file-text fa-5x"></i>
		  </div>
		  <div class="col-xs-9 text-right">
			<div class="huge">26</div>
			<div>Number of Quizzes</div>
		  </div>
		</div>
	  </div>
	  <a href="#">
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
			<div class="huge">124</div>
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
			<div class="huge">12</div>
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
			<div class="huge">13</div>
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
</div>
<!-- /.row -->
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

</body>
</html>