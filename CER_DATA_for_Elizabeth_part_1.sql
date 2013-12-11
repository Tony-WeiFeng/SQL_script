SELECT DISTINCT a.MONTH,
                a.DAY,
                a.TIMESTAMP,
                a.BUCKET,
                a.REPORT,
                b.MARKETING_PRODUCT_NAME,
                b.MARKETING_RELEASE_NAME,
                b.BUILD_TAG,
                a.OS,
                a.DISPOSITION,
                a.CATEGORY,
                a.MACHINE_ID,
                a.EMAIL,
                a.APP_VERSION,
                a.BUILD,
                a.MODULE,
                a.OBJECT,
                a.FUNCTION,
                a.OFFSET,
                a.DEFECT,
                a.FIXED_IN,
                a.USER_COMMENTS,
                a.GEO,
                a.COUNTRY,
                --a.CSN,
                --a.SERIAL_NUM
                a.serial_number
  from (select DISTINCT to_char(trunc(t.daterecieved, 'mm'), 'yyyy-mm') Month,
                        trunc(t.daterecieved) Day,
                        t.daterecieved timestamp,
                        ebr.bucket_id bucket,
                        t.id report,
                        CASE
                          WHEN u.product_line IS NULL THEN
                           'N/A'
                          ELSE
                           u.product_line
                        END product_line_id,
                        CASE
                          WHEN u.product_line IS NULL THEN
                           'N/A'
                          ELSE
                           u.release
                        END release_id,
                        CASE
                          WHEN u.product_line IS NULL THEN
                           'N/A'
                          ELSE
                           u.master
                        END master_id,
                        CASE
                          WHEN u.product_line IS NULL THEN
                           'N/A'
                          ELSE
                           u.build
                        END build_id,
                        CASE
                          WHEN u.product_line IS NULL THEN
                           'N/A'
                          ELSE
                           u.upi_version
                        END upi_version,
                        nvl(ot.description, 'N/A') OS,
                        c.disposition disposition,
                        c.category_desc category,
                        t.sub_mac_id machine_id,
                        r.email,
                        t.appversion app_version,
                        t.build_number build,
                        b.module,
                        b.object,
                        b.function,
                        b.offset,
                        cer.getDefectIDsInHtml(b.ID, '{0}') Defect,
                        b.generic1 fixed_in,
                        uc.errordescription user_comments,
                        nvl(g.region, 'UNKNOWN') geo,
                        nvl(g.country, 'UNKNOWN') country,
                        --sn.csn,
                        --sn.serial_num
                        r.serial_number
          from cer.cer_error_report       t,
               cer.status_code            s,
               cer.status_code_category   c,
               cer.cer_log_details        r,
               cer.cer_upis               u,
               cer.cer_os_info            oi,
               cer.cer_os_type            ot,
               cer.cer_bucket             b,
               cer.cer_er_bucket_relation ebr,
               cer.cer_user_comment       uc,
               cer.cer_geo_region         g
        --mja_serial_num             sn
         where t.status = s.code(+)
           and s.category = c.category_id(+)
           and t.id = r.error_report_id(+)
              --and r.serial_number = sn.serial_num
           and r.upi_id = u.upi_id(+)
           and t.os_info_id = oi.os_info_id(+)
           and oi.platform_id = ot.platform_id(+)
           and oi.major_version = ot.major_version(+)
           and oi.minor_version = ot.minor_version(+)
           and t.id = ebr.error_report_id(+)
           and ebr.bucket_id = b.id(+)
           and t.id = uc.error_report_id(+)
           and t.country = g.country(+)
           and t.is_external = 1
           and t.daterecieved >= to_date('1/1/2012', 'mm/dd/yyyy')
           and t.daterecieved <= to_date('9/30/2013', 'mm/dd/yyyy')
              --and uc.useremail like '%@surbana.com') a,
           and t.id in
               (select er.id
                  from cer_error_report er
                 where er.daterecieved >= to_date('1/1/2012', 'mm/dd/yyyy')
                   and er.daterecieved <= to_date('9/30/2013', 'mm/dd/yyyy')
                   and er.ip_addr in ('123.20.120.118', '123.20.102.170', '219.74.81.173', '203.126.242.57', '218.208.195.103', '219.74.34.72', '116.87.94.67')
                   and er.status = 6)) a,
       (select DISTINCT product_line_id,
                        release_id,
                        master_id,
                        build_id,
                        version as "UPI_VERSION",
                        marketing_product_name,
                        marketing_release_name,
                        build_tag
          from cip.cip_sds_upis@cipsprd1_usr.autodesk.com
         where status = 1) b
 where a.product_line_id = b.product_line_id
   and a.release_id = b.release_id
   and a.master_id = b.master_id
   and a.build_id = b.build_id
   and a.upi_version = b.upi_version;
