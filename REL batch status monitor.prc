CREATE OR REPLACE PROCEDURE REL_BATCH_STATUS_MONITOR IS
  unhandled_batch_count NUMBER;
  v_message             VARCHAR2(100);
  send_email BOOLEAN;

------------------------------------------------------------
/************* Author: Tony Feng 2012/12/03 ***************/
/***This procedure is for monitor REL batch status in DB***/
------------------------------------------------------------

BEGIN

  select count(*)
    into unhandled_batch_count
    from RESLN_LIST_BATCH t
   where t.status = 0;

  send_email := FALSE;
  v_message  := 'Hi, ';

  IF unhandled_batch_count > 0 THEN
    send_email := TRUE;
  END IF;

  v_message := v_message || 'There are(is)  ' || unhandled_batch_count ||
               '  unhandled batches in RESLN_LIST_BATCH table, please look at them...';

  IF send_email THEN
    alan_send_mail('cer.alerts@autodesk.com',
                   'cer.alerts@autodesk.com',
                   --'wei.feng@autodesk.com',
                   'Unhandled batches in RESLN_LIST_BATCH table',
                   v_message);
  end if;

end REL_BATCH_STATUS_MONITOR;
