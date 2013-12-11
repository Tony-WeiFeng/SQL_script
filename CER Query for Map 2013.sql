/*******************************************

The buckets should meet following requirements:
1. Should contain reports from Map 2013
2. Can also contain reports from Map 2012/2011/2010/2009/2008/… and Topobase
3.  2011/2010/2009/…
4. Should NOT contain reports from Map 2013 SP1, Map 2013 Sp1 HF1 or Map 2014
5. Should ONLY have reports from Map &TB
6. Should be unfixed and external bucket
 
 
Here is some information for your reference:
  · Map 2013 Product version ((r.prodname = 'B002' and r.prodversion = '19.0') or (r.prodname like 'AutoCAD Map 

3D 2013'))
  · Map 2013 RTM build number ('G.55.0.0', 'G.55.0.0(x64)', '16.0.036.2', '16.0.036.2(x64))
  · Map 2013 Sp1 build number ('16.0.102.29(x64)','16.0.102.29','G.114.0.0(x64)','G.114.0.0')
  · Map 2013 SP1 HF1 build number ('16.0.102.43','16.0.102.43(x64)')
  · Map 2014 Product version ((r.prodname = 'D002' and r.prodversion = '19.1') or (r.prodname like 'AutoCAD Map 

3D 2014'))


*******************************************/


select bucket, numberofcrashes
  from (select tt.bucket, tt.numberofcrashes, rr.prodname
          from (select /*+parallel(er,8)*/
                 bucket, numberofcrashes
                  from (select /*+parallel(er,8)*/
                         b.bucket_id as bucket,
                         count(distinct(e.prodname)) as productassociations,
                         count(e.id) as numberofcrashes,
                         c.generic1
                          from cer_error_report       e,
                               cer_er_bucket_relation b,
                               cer_bucket             c
                         where c.id = b.bucket_id
                           and c.generic1 is null
                           and b.bucket_id in
                               (select /*+parallel(er,8)*/
                                 er1.bucket_id
                                  from cer_er_bucket_relation er1,
                                       cer_error_report       ee1
                                 where ee1.daterecieved >=
                                       to_date('03/01/2012 12:00:00 AM',
                                               'mm/dd/yyyy HH:MI:SS PM')
                                   and (IS_EXTERNAL = 1 or IS_EXTERNAL = null)
                                   and (ee1.prodname like '%002%' or
                                       ee1.prodname like '%AutoCAD Map 3D%' or
                                       ee1.prodname like '%Topobase%' or
                                       ee1.prodname like '%Reeses%')
                                      
                                   and (ee1.build_number in
                                       ('G.55.0.0',
                                         'G.55.0.0(x64)',
                                         '16.0.036.2',
                                         '16.0.036.2(x64)'))
                                   and er1.error_report_id = ee1.id
                                   and er1.bucket_id not in
                                       (select /*+parallel(er,8)*/
                                         er2.bucket_id
                                          from cer_er_bucket_relation er2,
                                               cer_error_report       ee2
                                         where ee2.daterecieved >=
                                               to_date('03/01/2012 12:00:00 AM',
                                                       'mm/dd/yyyy HH:MI:SS PM')
                                           and (IS_EXTERNAL = 1 or
                                               IS_EXTERNAL = null)
                                           and (ee2.prodname like '%002' or
                                               ee2.prodname like
                                               'AutoCAD Map 3D 201%')
                                              
                                           and (ee2.build_number in
                                               ('16.0.102.29(x64)',
                                                 '16.0.102.29',
                                                 'G.114.0.0(x64)',
                                                 'G.114.0.0',
                                                 '16.0.102.43',
                                                 '16.0.102.43(x64)'))
                                           and er2.error_report_id = ee2.id
                                         group by er2.bucket_id)
                                 group by er1.bucket_id)
                           and b.error_report_id = e.id
                         group by b.bucket_id, c.generic1) a --where productassociations = 1 
                --order by numberofcrashes desc
                ) tt,
               cer.CER_ERROR_REPORT rr,
               cer.CER_ER_BUCKET_RELATION r --error_report_id bucket_id
         where rr.id = r.error_report_id
           and r.bucket_id = tt.bucket
        
        ) Tony
 group by bucket, numberofcrashes
having sum(case when Tony.prodname = 'B002' or (Tony.prodname like 'AutoCAD Map 3D%' and Tony.prodname <> 

'AutoCAD Map 3D 2014') or Tony.prodname = 'Autodesk Topobase Client 2011' or Tony.prodname = 'AutoCAD Reeses 

Desktop' then 1 else 0 end) > 0 and sum(case when Tony.prodname = 'B002' or (Tony.prodname like 'AutoCAD Map 3D%' 

and Tony.prodname <> 'AutoCAD Map 3D 2014') or Tony.prodname = 'Autodesk Topobase Client 2011' or Tony.prodname = 

'AutoCAD Reeses Desktop' then 0 else 1 end) = 0;
