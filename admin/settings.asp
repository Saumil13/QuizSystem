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
		  <!-- #include file="inc/-err_messages.asp" -->
            <h1 class="page-header">General Settings</h1>
          </div>
          <!-- /.col-lg-12 -->
		  
        </div>
        <!-- /.row -->
          <%
          strSQL = "Select * From Settings"
          Set objRs = Conn.Execute(StrSQL)
          %>
<form action="settings-exec.asp" method="post">
<div class="row">
  <div class="col-md-6">
  <div class="form-group">
            <label for="fname">Title of Website</label>
            <input type="text" class="form-control" name="title" value="<%=objRs("SiteTitle")%>" />
          </div>
          <div class="form-group">
            <label for="lname">Site URL</label>
            <input type="text" class="form-control" name="url" value="<%=objRs("SiteUrl")%>" />
          </div>
		  <div class="form-group">
            <label for="lname">Description for SEO</label>
            <input type="text" class="form-control" name="desc" value="<%=objRs("Description")%>" />
          </div>
		  <div class="form-group">
            <label for="lname">Keywords for SEO</label>
            <input type="text" class="form-control" name="keywords" value="<%=objRs("Keywords")%>" />
          </div>
		  <div class="form-group">
            <label for="lname">Mail Server</label>
            <input type="text" class="form-control" name="mailserver" value="<%=objRs("MailServer")%>" />
          </div>
		  <div class="form-group">
            <label for="lname">Mail Address</label>
            <input type="text" class="form-control" name="mailaddress" value="<%=objRs("MailAddress")%>" />
          </div>
          <div class="form-group">
            <label for="lname">Mail SMTP Username</label>
            <input type="text" class="form-control" name="smtpuser" value="<%=objRs("MailSMTPUsername")%>" />
          </div>
		  <div class="form-group">
            <label for="lname">Mail SMTP Password</label>
            <input type="password" class="form-control" name="smtppass" value="<%=objRs("MailSMTPPass")%>" />
          </div>
  
  </div>
  <div class="col-md-6">
	<div class="form-group">
	<label for="lname">Release Notes</label>
	<textarea name="rnotes" class="summernote"><%=objRs("ReleaseNotes")%></textarea>
	</div>
  </div>
</div>
<button type="submit" class="btn btn-success">Save</button>
 </form>      
          <%
          objRs.Close
          Set objRs = Nothing
          %>
        <!-- /.row -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- #include file="inc/-footer.asp" -->
 <link rel="stylesheet" href="../css/summernote.css">
  <script type="text/javascript" src="../js/summernote.min.js"></script>

  <script type="text/javascript">
    $(function() {
      $('.summernote').summernote({
        height: 405
      });

    });
  </script>
  </body>
</html>