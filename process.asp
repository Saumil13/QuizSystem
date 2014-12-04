<!-- #include file="inc/inc_settings.asp" -->
<%
req 			= QueryFilter(request.querystring("i"))
QID 			= QueryFilter(request.querystring("ID"))
'Register Form Parameters
firstname 		= ClearText(request.form("firstname"))
lastname 		= ClearText(request.form("lastname"))
email 			= ClearText(request.form("email"))
password 		= ClearText(request.form("password"))
password2 		= ClearText(request.form("password2"))


if req 	   = "Register" then
call Register

elseif req = "Login" then
call Login

elseif req = "UpdateProfile" then
LoginGate()
call UpdateProfile

elseif req = "Logout" then
call Logout

elseif req = "ActivateMember" then
call ActivateMember

elseif req = "ForgotPass" then
call ForgotPass

else
response.redirect "default.asp"
end if
%>
<%
Sub Register
if firstname = "" or lastname = "" or email = "" or password = "" then
response.redirect "default.asp?H=4"
end if

if password <> password2 then
response.redirect "default.asp?H=5" ' works fine :) 
end if
Auth_Token = GeneratePassword(10)
ActivationCode = GeneratePassword(10)
Md5Password = Md5(password)

StrSQL = "SELECT * FROM Members"
objRS.Open StrSQL, Conn, 1, 2

objRS.AddNew
objRS("Name") 		= firstname
objRS("Surname") 	= lastname
objRS("EMail") 		= email
objRS("Password") 	= Md5Password
objRS("Active") = 0
objRS("RegistrationDate") = GlobalTarih(now(),"no")
objRS("Auth_Token") = Auth_Token
objRS("ActivationCode") = ActivationCode
objRS.Update

objRS.Close : set objRS = Nothing
response.redirect "default.asp?H=1"
' Successfuly Registered , will send activation mail ---------------
' Here we will implement sending activation mail to registered user.

end sub
%>