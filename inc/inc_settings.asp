<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
Session.CodePage = 65001
Session.LCID = 1055
Response.Charset = "UTF-8"

Dim db_server
Dim db_user
Dim db_pass
Dim db_name
Dim Conn
Dim objRs
Dim StrSQL

Dim strMailServer
Dim strMailAdres
Dim strMailSMTPUsername
Dim strMailSMTPPass

db_server = "mssql.sabahwebdizayn.com" '/// SERVER NAME
db_user = "ius_quiz" '/// DATABASE USERNAME
db_pass = "i4#kGv34" '/// DATABASE PASSWORD
db_name = "quiz_system" '/// DATABASE NAME

'#### START TO CONNECT DATABASE
Response.expires = 0 
Response.expiresabsolute = Now() - 1
Response.addHeader "pragma", "no-cache"
Response.addHeader "cache-control", "private"
Response.CacheControl = "no-cache"

	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.open = "Provider=SQLNCLI11;Server="&db_server&";Database="&db_name&";Uid="&db_user&";Pwd="&db_pass&";"
	
	Set ObjRsYard = Server.CreateObject("ADODB.Recordset")
	Set ObjRs = Server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT * FROM Settings"
	Set ObjRs = Conn.Execute(strSQL)
	
	strSiteTitle		= objRS("SiteTitle")
	strSiteUrl			= objRS("SiteUrl")
	strDescription		= objRS("Description")
	strKeywords			= objRS("Keywords")	
	strMailServer 		= objRS("MailServer")
	strMailAddress		= objRS("MailAddress")
	strMailSMTPUsername	= objRS("MailSMTPUsername")
	strMailSMTPPass 	= objRS("MailSMTPPass")
	
objRS.Close

%>
<!-- #include file="inc_md5.asp" -->
<!-- #include file="inc_functions.asp" -->