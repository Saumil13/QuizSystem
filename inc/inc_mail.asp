<%
Private Sub SendMail(byVal Sender, byVal Recipient, byVal Subject, byVal Message)
			Set objMail = Server.CreateObject("Persits.MailSender")
			With objMail
				.Charset = "UTF-8"
				 .IsHTML = True
				 .Priority = 1
				 .SSL = True
				 .Port = 465
				 .ContentTransferEncoding = "Quoted-Printable"
				 .Host = strMailServer
				 .Username = strMailSMTPUsername
				 .Password = strMailSMTPPass
				 .From = strMailSMTPUsername
				 .FromName = strSiteTitle
				 .AddAddress Recipient
				 .AddReplyTo strMailSMTPUsername
				 .Subject = .EncodeHeader(Subject, "utf-8")
				 .Body = Message
					.Send
			End With
			Set objMail = Nothing	
End Sub
%>