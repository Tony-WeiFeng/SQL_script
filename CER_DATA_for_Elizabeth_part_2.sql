select distinct (ip_addr)
  from cer_error_report t
 where t.id in (select uc.error_report_id
                  from cer_user_comment uc
                 where uc.useremail like '%@surbana.com')
