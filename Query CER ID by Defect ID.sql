select *
  from CER_DEFECTS t
  join cer_bucket_defect_relation bd
    on t.defect_id = bd.defect_id
  join cer_er_bucket_relation eb
    on bd.bucket_id = eb.bucket_id
  join cer_error_report e
    on eb.error_report_id = e.id
 where t.defect_tag = '1460433'
