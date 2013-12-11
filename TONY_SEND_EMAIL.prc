PROCEDURE TONY_SEND_EMAIL(sender     IN VARCHAR2,
                            recipients IN VARCHAR2,
                            subject    IN VARCHAR2,
                            mime_type  IN VARCHAR2 DEFAULT 'text/plain',
                            message    IN VARCHAR2,
                            priority   IN PLS_INTEGER DEFAULT NULL) IS
  
    -- This procedure added some parameters base on the procedure: alan_send_mail
    -- Author: Tony Feng   1/24/2013
    -- This procedure using alan_send_mail for send email to multiple email addresses, and provide some more parameters for the email sending.
    --
    -- Parameters:
    -- sender - single email address
    -- recipients - single or multiple email addresses
    -- subject - subject of the email message
    -- mime_type - set the text type, default value is 'text/plain'. You can set it like 'text/html'
    -- message - body of the email message
    -- priority - set the priotity for the email
    -- Set priority:
    --   High      Normal       Low
    --   1     2     3     4     5
  
    --
    -- It will report the status of the sent mail
  
    -- NOTE: email addresses must be separated with either a comma "," or a semi-colon ";"
  
    -- NOTE: You must modify the "mailhost" and "mailport" variables below
  
   
  
    mailhost VARCHAR2(64) := 'mail.autodesk.com'; -- hostname of the mail server
    mailport NUMBER := 25; -- mailport
  
    mail_conn     UTL_SMTP.CONNECTION;
    szBuffer      VARCHAR2(2000);
    szQuit        UTL_SMTP.REPLY;
    location      NUMBER := 0;
    my_index      NUMBER := 1;
    my_recipients VARCHAR2(32000);
    my_sender     VARCHAR2(32000);
  
  BEGIN
  
    mail_conn := utl_smtp.open_connection(mailhost, mailport);
    utl_smtp.helo(mail_conn, mailhost);
  
    -- clean up any trailing separation characters
  
    --DBMS_OUTPUT.PUT_LINE(sender);
    my_sender := RTRIM(sender, ',; ');
    --DBMS_OUTPUT.PUT_LINE(my_sender);
  
    -- determine multiple sender by looking
    -- for separation characters
  
    location := INSTR(my_sender, ',', 1, 1);
    IF location = 0 THEN
      location := INSTR(my_sender, ';', 1, 1);
    END IF;
  
    -- If more then one sender in string, parse out
    -- the first sender and use this sender to
    -- authenticate with the mail server when
    -- calling UTL_SMTP.MAIL, all other senders
    -- will be ignored
  
    IF location <> 0 THEN
      -- multiple senders, use the first one
      UTL_SMTP.MAIL(mail_conn, SUBSTR(my_sender, 1, location - 1));
    ELSE
      -- only one sender
      UTL_SMTP.MAIL(mail_conn, sender);
    END IF;
  
    -- clean up any trailing separation characters
    my_recipients := RTRIM(recipients, ',; ');
    -- initialize loop variables
    my_index := 1;
  
    -- Parse out each recipient and make a call to
    -- UTL_SMTP.RCPT to add it to the recipient list
  
    WHILE my_index < LENGTH(my_recipients) LOOP
    
      -- determine multiple recipients by looking for separation characters
    
      location := INSTR(my_recipients, ',', my_index, 1);
      IF location = 0 THEN
        location := INSTR(my_recipients, ';', my_index, 1);
      END IF;
    
      IF location <> 0 THEN
        -- multiple recipients, add this one to the recipients list
        UTL_SMTP.RCPT(mail_conn,
                      TRIM(SUBSTR(my_recipients,
                                  my_index,
                                  location - my_index)));
        my_index := location + 1;
      ELSE
        -- single recipient or last one in list
        UTL_SMTP.RCPT(mail_conn,
                      TRIM(SUBSTR(my_recipients,
                                  my_index,
                                  LENGTH(my_recipients))));
        my_index := LENGTH(my_recipients);
      END IF;
    
    END LOOP;
  
    -- Replace separation character ";" with ","
    my_recipients := REPLACE(my_recipients, ';', ',');
    
    
    -- Specify sender's address (our server allows bogus address
    -- as long as it is a full email address (xxx@yyy.com).
  
    -- Setup the TO, SUBJECT and BODY sections of the email
  
    UTL_SMTP.OPEN_DATA(mail_conn);
    UTL_SMTP.WRITE_DATA(mail_conn, 'To: ' || my_recipients || utl_tcp.CRLF);
    UTL_SMTP.WRITE_DATA(mail_conn, 'Subject: ' || subject || utl_tcp.CRLF);
    UTL_SMTP.WRITE_DATA(mail_conn,
                        'Content-Type:' || mime_type || utl_tcp.CRLF);
    UTL_SMTP.WRITE_DATA(mail_conn,
                        'X-Mailer: Mailer by Oracle UTL_SMTP' ||
                        utl_tcp.CRLF);
                        
    -- Set priority:
    --   High      Normal       Low
    --   1     2     3     4     5
    IF (priority IS NOT NULL) THEN
      UTL_SMTP.WRITE_DATA(mail_conn,
                          'X-Priority: ' || priority || utl_tcp.CRLF);
    END IF;
  
    -- Send an empty line to denotes end of MIME headers and
    -- beginning of message body.
    UTL_SMTP.WRITE_DATA(mail_conn, utl_tcp.CRLF);
    UTL_SMTP.WRITE_DATA(mail_conn, message);
    
    UTL_SMTP.CLOSE_DATA(mail_conn);
    
    szQuit := UTL_SMTP.QUIT(mail_conn);
  
    -- Status Reporting/Error Handling
  
    IF szQuit.code = 221 THEN
      DBMS_OUTPUT.PUT_LINE('Your e-mail was successfully sent.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Your e-mail was NOT sent.');
      DBMS_OUTPUT.PUT_LINE('Reply Code: ' || szQuit.code);
      DBMS_OUTPUT.PUT_LINE('Message: ' || szQuit.text);
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      szBuffer := sqlerrm;
      DBMS_OUTPUT.PUT_LINE('Error: ' || szBuffer);

  END TONY_SEND_EMAIL;