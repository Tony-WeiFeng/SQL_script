procedure RSP_Monitor_equests as
  
  -- Author  : Tony-Wei Feng
  -- Created : 1/30/2013 
  -- Purpose : Send the pending request notification include the unloader.
  
    mailbody  varchar2(10240);
    recipient varchar2(1024);
    useremail varchar2(100);
    exist     boolean;
  
    cursor monitor_cur is
      select sr.id, sr.product_build, sr.upload_submitted_by
        from cer_symbols_requests sr
       where (sr.status in
             ('OnUploadQueue', 'FileCopying', 'FileCopied', 'Uploading') and
             (sysdate - sr.date_upload_submitted) * 24 > 8)
          or (sr.status = 'Deleting' and
             (sysdate - sr.date_delete_submitted) * 24 > 8);
  
    monitor_rec monitor_cur%rowtype;
  
  begin
  
    exist := false;
    open monitor_cur;
    loop
    
      fetch monitor_cur
        into monitor_rec;
      exit when monitor_cur%notfound;
    
      if exist = false then
        exist    := true;
        mailbody := mailbody || '<I></font color="gray">You have received this email because there are some peding request(s) which was(were) uploaded by you. </font></I>' || '<br>';
        mailbody := mailbody || '<br>';
        mailbody := mailbody || 'Pending request(s) are found: ' || '<br>';
        recipient := recipient ||'<' ||'cer-symbols@autodesk.com'||'>'||',';
        
      end if;
    
      -- Prepare mail body
      mailbody := mailbody || 'Request Id: ' ||
                  '<a href="http://cerservices.autodesk.com/SymbolCentral/Uploader/RequestDetails.aspx?RequestId=' ||
                  monitor_rec.id || '" target="MainFrame">' ||
                  monitor_rec.id || '</a>     ';
      mailbody := mailbody || 'Product Build: ' ||
                  monitor_rec.product_build || '     ';
      mailbody := mailbody || 'Upload Submitted By: ' ||
                  '<b style="font-weight:bold;">' ||
                  monitor_rec.upload_submitted_by || '</b>';
      mailbody := mailbody || '<br>';
      
      select sue.user_email
        into useremail
        from CER_SYMBOLS_USERS_EX sue
       where sue.user_name = monitor_rec.upload_submitted_by;
    
      if (instr(recipient, useremail) > 0) then
        continue;
      else
        recipient := recipient || '<' || useremail || '>' || ',';
      end if;
    end loop;
  
    if exist = true then
      -- Send out via email
      CER.CER_EMAIL_PKG.TONY_SEND_EMAIL('cer-symbols@autodesk.com',
                                        recipient,
                                        'Autodesk CER Symbol Pending Request Monitor',
                                        'text/html',
                                        mailbody,
                                        3);
    end if;
  
  end SP_Monitor_Requests;
