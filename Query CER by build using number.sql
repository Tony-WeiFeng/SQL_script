select *
  from cer_error_report r
 where r.id in
       (select t.error_report_id
          from CER_LOG_DETAILS t
         where t.upi_id in
               (select u.upi_id from CER_UPIS u where u.build = 'I018.M.108'))
