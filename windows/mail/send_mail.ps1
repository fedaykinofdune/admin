$file = "<file to send>"$smtp_name = "<smtp server name>"$smtp_user_name = "<smtp user name>"$smtp_password = "<smtp password>"$email_from = "<>"$email_to = "<>"if (!(Test-Path $file)){	Write-Error "File not found."	break}write "Sending file..."$smtp = new-object Net.Mail.SmtpClient($smtp_name)$smtp.Credentials = new-object Net.NetworkCredential($smtp_user_name, $smtp_password)$msg = new-object Net.Mail.MailMessage($email_from, $email_to)$msg.Subject = "<subject>"$msg.Body = "<body>"		$attach = new-object Net.Mail.Attachment($file)$msg.Attachments.Add($attach)$smtp.Send($msg)write "Done."$msg.Dispose()