<!-- #include file="../inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
   </head><body>
<%
'Settings Form Parameters
title 			= ClearText(request.form("title"))
url 			= ClearText(request.form("url"))
desc 			= ClearText(request.form("desc"))
keywords 		= ClearText(request.form("keywords"))
mailserver 		= ClearText(request.form("mailserver"))
mailaddress 	= ClearText(request.form("mailaddress"))
smtpuser 		= ClearText(request.form("smtpuser"))
smtppass 		= ClearText(request.form("smtppass"))
rnotes	 		= request.form("rnotes")

StrSQL = "SELECT * FROM Settings"
objRS.Open StrSQL, Conn, 1, 2
objRS("SiteTitle") = title
objRS("SiteUrl") = url
objRS("Description") = desc
objRS("Keywords") = keywords
objRS("MailServer") = mailserver
objRS("MailAddress") = mailaddress
objRS("MailSMTPUsername") = smtpuser
objRS("MailSMTPPass") = smtppass
objRS("ReleaseNotes") = rnotes

objRS.Update
objRS.Close
set objRS = Nothing
Response.Redirect("settings.asp?H=11")
Response.End
%> 

</body>
</html>