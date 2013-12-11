with ICP as
 (select r.id, r.prodname, r.daterecieved
    from cer_error_report r
   where (r.prodname = 'D017' and r.prodversion = '19.1')
      or (r.prodname like 'AutoCAD PNID 2014')
     and build_number in
         ('I.18.0.0', 'I.18.0.0(x64)', '7.0.26.00', '7.0.26.00(x64)')
     and r.daterecieved >= to_date('3/27/2013', 'mm/dd/yyyy')
  union
  select r.id, r.prodname, r.daterecieved
    from cer_error_report r
   where r.prodname = 'D000'
     and (r.appversion IN ('10.3.525.0'))
     and r.daterecieved >=
         to_date('3/9/2013 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
  union
  select r.id, r.prodname, r.daterecieved
    from cer_error_report r
   where ((r.prodname = 'D002' and r.prodversion = '19.1') or
         (r.prodname like '%AutoCAD Map 3D 2014'))
     and build_number in
         ('I.18.0.0', 'I.18.0.0(x64)', '16.0.014.2', '16.0.014.2(x64)')
     and r.daterecieved >= to_date('03/01/2013', 'mm/dd/yyyy'))

select bucket_id, week
  from (select b.bucket_id,
               ICP.id,
               ICP.daterecieved,
               to_char(ICP.daterecieved, 'IW') week
          from (select eb.bucket_id, count(distinct ICP.prodname)
                  from CER_ER_BUCKET_RELATION eb
                  join ICP
                    on eb.error_report_id = ICP.id
                 group by eb.bucket_id
                having count(distinct ICP.prodname) = 3) b
          join cer_er_bucket_relation eb
            on b.bucket_id = eb.bucket_id
          join ICP
            on eb.error_report_id = ICP.id
         order by ICP.daterecieved asc)
 group by week, bucket_id
 order by week asc
