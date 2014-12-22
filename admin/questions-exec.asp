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
QuizID 		= ClearText(request.form("QuizID"))
QuestionID 	= ClearText(request.form("QuestionID"))
question 	= ClearText(request.form("question"))
answer 		= ClearText(request.form("answer"))
difficulty 	= ClearText(request.form("difficulty"))
isanswer 	= cint(request.form("isanswer"))

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
StrSQL = "SELECT * FROM Questions "
objRS.Open StrSQL, Conn, 1, 2

objRS.AddNew
objRS("Question") = question
objRS("Difficulty") = difficulty
objRS("Active") = act
objRS("QuizID") = QuizID
objRS("MemberID") = Session("UserID")
objRS.Update
QuestionID = objRS("ID")
objRS.Close
dim i : i = 1
for each x in Request.Form("answer")

if Cint(i) = Cint(isanswer) then
isanswer2 = 1
else
isanswer2 = 0
end if
Conn.Execute("INSERT INTO Options Values ("&QuestionID&",'"&x&"',"&isanswer2&") ")

i=i+1
next

set objRS = Nothing
Response.Redirect("questions.asp?QD="&QuizID&"&H=10")
Response.End
end sub

Sub Edit
dim i : i = 1

Conn.Execute("UPDATE Questions SET Question = '"&question&"' , Difficulty = "&difficulty&" ,  Active = "&act&" Where ID = "&QuestionID&" ")

set rs2 = Conn.Execute("Select * from Options Where QuesionID = "&QuestionID&" order by ID asc")
do while not rs2.eof
answer2 = Request.Form("answer")(i)


if i = Cint(isanswer) Then
isanswer2 = 1
else
isanswer2 = 0
end if

Conn.Execute("UPDATE Options Set Name = '"&answer2&"' ,TrueAnswer = "&isanswer2&" Where ID = "&rs2("ID")&" ")

i=i+1 : rs2.movenext : loop : rs2.close : Set rs2 = Nothing
Response.Redirect("questions.asp?QD="&QuizID&"&H=11")
Response.End
End Sub


Sub Active
conn.execute("Update Questions Set Active = "&qact&" Where ID = "&QID&" ")

Response.Redirect("questions.asp?QD="&QD&"&H=12")
Response.End
end sub

Sub Delete
Conn.Execute("Delete FROM Questions Where ID = "&QID&"")
conn.execute("Delete from Options Where QuesionID = "&QID&" ")

Response.Redirect("questions.asp?QD="&QD&"&H=13")
Response.End
End Sub
%> 

</body>
</html>