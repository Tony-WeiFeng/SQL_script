CREATE OR REPLACE PROCEDURE CER_LATENCY_STATUS_MONITOR IS
    all_count       number;
    recipient       varchar2(100);
    v_message       varchar2(1000);
    table_string    varchar2(1000);
    send_email      boolean;
    
    cursor cur is
      select '<tr><td>' || a.frontend_server || '</td><td align="middle">' || count(*) ||
               '</td></tr>' as str
          from (select *
                  from cer_error_report t
                 where daterecieved >= sysdate - 3
                   and status = 0) a
         group by a.frontend_server
         order by a.frontend_server;
         
     t_string_rec cur%rowtype;
----------------------------------------------------------------
/*************** Author: Tony Feng 2013/04/24 *****************/
/***This procedure is for monitor CER Latency Status Monitor***/
----------------------------------------------------------------  

BEGIN

select count(*)
  into all_count
  from cer_error_report t
 where t.status = 0
   and t.daterecieved > sysdate - 3;

     send_email := false;
     v_message  := 'Hi Team, <br><br>';
     recipient  := recipient || '<cer-admin-support@autodesk.com>,<cipcer.appsupport@autodesk.com>';
     --recipient  := recipient || '<wei.feng@autodesk.com>'; 
     
  if all_count >= 100 then
    
    open cur;
    loop
      fetch cur
        into t_string_rec;
      exit when cur%notfound;
      table_string := table_string || t_string_rec.str;
     end loop;

    send_email := true;
    v_message  := v_message || 'There are ' || '<font color="red">'|| all_count || '</font>' ||
                  ' CERs were backlogging on CER Frontend Servers in the last 3 days. It may bring the CER latency issue, please restart the weblogic of the Frontend Server which has most backlogged CERs. <br><br>' ||
                  'For the number of backlogged CERs on each Frontend Server, please see following table:<br><br>' || '<table border="1"><tr><th>Frontend Server</th><th>Count of Backlogged CERs</th></tr>' || 
                  table_string ||
                  '</tr></table>'||
                  '<br><br>'||
                  'Thanks, <br>' ||
                  'CER Team <br>';

  end if;     
       
  if send_email then
     CER.CER_EMAIL_PKG.TONY_SEND_EMAIL('cer-admin-support@autodesk.com',
                                       recipient,
                                       'CER Latency Status Monitor',
                                       'text/html',
                                       v_message,
                                       3);
  end if;

END CER_LATENCY_STATUS_MONITOR;
