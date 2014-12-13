<!-- #include file="../inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
   </head><body>
<%
req 			= QueryFilter(request.querystring("i"))
QID 			= QueryFilter(request.querystring("ID"))
QD 				= QueryFilter(Request.QueryString("D"))
'Form Parameters
firstname 		= ClearText(request.form("firstname"))
lastname 		= ClearText(request.form("lastname"))
email 			= ClearText(request.form("email"))
password 		= trim(ClearText(request.form("password")))

act 			= dbBoolControl(Request.Form("active"))
qact 			= dbBoolControl(Request.querystring("qactive"))

If 		req = "Edit"	 	Then
Call 	Edit
ElseIf	req = "Active"		Then
Call 	Active
ElseIf	req = "Delete"		Then
Call 	Delete

else
response.redirect "default.asp?H=99"
end if

Sub Edit
StrSQL = "SELECT * FROM Members Where ID = "&QD&""
objRS.Open StrSQL, Conn, 1, 2
objRS("Name") = firstname
objRS("Surname") = lastname
objRS("EMail") = email
objRS("Active") = act
if not password = "" then
objRS("Password") = md5(password)
end if

objRS.Update
objRS.Close
set objRS = Nothing
Response.Redirect("members.asp?H=11")
Response.End
End Sub

Sub Active
conn.execute("Update Members Set Active = "&qact&" Where ID = "&QID&" ")

Response.Redirect("members.asp?H=12")
Response.End
end sub

Sub Delete
Set objRs = Conn.Execute("Delete FROM Members Where ID = "&QID&"")

Response.Redirect("members.asp?H=13")
Response.End
End Sub
%> 

</body>
</html>