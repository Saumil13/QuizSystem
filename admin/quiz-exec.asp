<!-- #include file="../inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
   </head><body>
<%
req 		= QueryFilter(request.querystring("i"))
QID 		= QueryFilter(request.querystring("ID"))
QD 			= QueryFilter(Request.QueryString("D"))
'Form Parameters
title 		= ClearText(request.form("title"))
duration 	= NumberControl(request.form("time"))

act 		= dbBoolControl(Request.Form("active"))
qact 		= dbBoolControl(Request.querystring("qactive"))

If 		req = "Edit"	 	Then
Call 	Edit
elseif  req = "AddNew" 		Then
Call 	Add
ElseIf	req = "Active"		Then
Call 	Active
ElseIf	req = "Delete"		Then
Call 	Delete

else
response.redirect "default.asp?H=99"
end if

Sub Add
StrSQL = "SELECT * FROM Quizzes"
objRS.Open StrSQL, Conn, 1, 2
objRS.addnew
objRS("Title") = title
objRS("Time") = duration
objRS("Active") = act
objRS("MemberID") = Session("UserID")

objRS.Update
objRS.Close
set objRS = Nothing
Response.Redirect("quiz.asp?H=10")
Response.End
end sub

Sub Edit
StrSQL = "SELECT * FROM Quizzes Where ID = "&QD&" "
objRS.Open StrSQL, Conn, 1, 2

objRS("Title") = title
objRS("Time") = duration
objRS("Active") = act
objRS("MemberID") = Session("UserID")

objRS.Update
objRS.Close
set objRS = Nothing
Response.Redirect("quiz.asp?H=11")
Response.End
End Sub

Sub Active
conn.execute("Update Quizzes Set Active = "&qact&" Where ID = "&QID&" ")

Response.Redirect("quiz.asp?H=12")
Response.End
end sub

Sub Delete
Conn.Execute("Delete FROM Quizzes Where ID = "&QID&"")
conn.execute("delete from QuizResults Where QuizID = "&QID&" ")
set rs = conn.execute("Select * from Questions Where QuizID = "&QID&" ")
do while not rs.eof
conn.execute("delete from Options Where QuesionID = "&rs("ID")&" ")
rs.movenext : loop : rs.close : set rs = nothing
conn.execute("delete from Questions Where QuizID = "&QID&" ")
Response.Redirect("quiz.asp?H=13")
Response.End
End Sub
%> 

</body>
</html>