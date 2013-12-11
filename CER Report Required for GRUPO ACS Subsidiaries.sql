 -----------------------------------------------------------------Part 1 ------------------------------------------------------------------  
--   John Holland Group 
Theiss P/L 
Leighton Holdings Infrastructure P/L 
Leighton Contractors P/L 
Devine Homes 
-----

create table account_data
(
   company_name varchar(50),
   csn          varchar(50),
   SERIAL_NUM   varchar(100),
   MJA_NAME     varchar(100),
   ACCT_NAME    varchar(100)
)
;

insert into account_data
SELECT /*+parallel(b,8) parallel(c,8) parallel(d,8)*/
DISTINCT 'JOHN HOLLAND',
       b.csn,
         d.Serial_Number as "SERIAL_NUM",
         c.top_lvl_name  as "MJA_NAME",
         b.name          as "ACCT_NAME"
  FROM lc1.Sbl_Account@lc1.autodesk.com b,
       lc1.Sbl_Account@lc1.autodesk.com c,
       lc1.sbl_asset@lc1.autodesk.com   d
 WHERE b.parent_row_id = c.row_id
   and b.row_id = d.account_row_id
   and upper(c.top_lvl_name) like '%JOHN%HOLLAND%'  
   and d.serial_number IS NOT NULL
   ;
---fetch specific JOHN HOLLAND mja_name condition---
-- and  company_name='JOHN HOLLAND' and mja_name not in ('JOHN HOLLANDER','JOHN HOLLANDER ILLUSTRATION','JOHNHOLLANDER','JOHNMILLHOLLAND')
 
 insert into  account_data  
SELECT /*+parallel(b,8) parallel(c,8) parallel(d,8)*/
DISTINCT 'THIESS' as company_name,
         b.csn,
         d.Serial_Number as "SERIAL_NUM",
         c.top_lvl_name  as "MJA_NAME",
         b.name          as "ACCT_NAME"
  FROM lc1.Sbl_Account@lc1.autodesk.com b,
       lc1.Sbl_Account@lc1.autodesk.com c,
       lc1.sbl_asset@lc1.autodesk.com   d
 WHERE b.parent_row_id = c.row_id
   and b.row_id = d.account_row_id
  -- and lower(c.top_lvl_name) like '%thiess%'  
  and upper(c.top_lvl_name) like '%THIESS%'
   and d.serial_number IS NOT NULL
   ;  

---fetch specific Thiess mja_name condition---
--   ((sn.mja_name like 'THIESS%'and sn.mja_name not like 'THIESSE%' and sn.mja_name not like 'THIESSON%')  or sn.mja_name in ('SIEMENS THIESS COMMUNICATION JV','THADDEA MATTHIESSEN') ) and company_name='THIESS'
 
 
   
insert into  account_data  
SELECT /*+parallel(b,8) parallel(c,8) parallel(d,8)*/
DISTINCT 'Leighton Holdings' as company_name,
         b.csn,
         d.Serial_Number as "SERIAL_NUM",
         c.top_lvl_name  as "MJA_NAME",
         b.name          as "ACCT_NAME"
  FROM lc1.Sbl_Account@lc1.autodesk.com b,
       lc1.Sbl_Account@lc1.autodesk.com c,
       lc1.sbl_asset@lc1.autodesk.com   d
 WHERE b.parent_row_id = c.row_id
   and b.row_id = d.account_row_id
  -- and lower(c.top_lvl_name) like '%thiess%'  
  and lower(c.top_lvl_name) like '%leighton%holdings%'
   and d.serial_number IS NOT NULL
   ;
---fetch specific Leighton Holdings mja_name condition---
--company_name='Leighton Holdings'

   
 insert into  account_data  
SELECT /*+parallel(b,8) parallel(c,8) parallel(d,8)*/
DISTINCT 'Leighton Contractors' as company_name,
         b.csn,
         d.Serial_Number as "SERIAL_NUM",
         c.top_lvl_name  as "MJA_NAME",
         b.name          as "ACCT_NAME"
  FROM lc1.Sbl_Account@lc1.autodesk.com b,
       lc1.Sbl_Account@lc1.autodesk.com c,
       lc1.sbl_asset@lc1.autodesk.com   d
 WHERE b.parent_row_id = c.row_id
   and b.row_id = d.account_row_id
  -- and lower(c.top_lvl_name) like '%thiess%'  
  and lower(c.top_lvl_name) like '%leighton%contractors%'
   and d.serial_number IS NOT NULL
   ;
---fetch specific Leighton Contractors mja_name condition---
--  company_name='Leighton Contractors'

 insert into  account_data  
SELECT /*+parallel(b,8) parallel(c,8) parallel(d,8)*/
DISTINCT 'Devine Homes' as company_name,
         b.csn,
         d.Serial_Number as "SERIAL_NUM",
         c.top_lvl_name  as "MJA_NAME",
         b.name          as "ACCT_NAME"
  FROM lc1.Sbl_Account@lc1.autodesk.com b,
       lc1.Sbl_Account@lc1.autodesk.com c,
       lc1.sbl_asset@lc1.autodesk.com   d
 WHERE b.parent_row_id = c.row_id
   and b.row_id = d.account_row_id
  -- and lower(c.top_lvl_name) like '%thiess%'  
  and lower(c.top_lvl_name) like '%devine%homes%'
   and d.serial_number IS NOT NULL
   ;
---fetch specific Devine Homes mja_name condition---
--  company_name='Devine Homes'

 -----------------------------------------------------------------Part 2 ------------------------------------------------------------------  
SELECT DISTINCT REPORT,
		a.BUCKET,
		a.TIMESTAMP,
		a.MJA_ACCOUNT,
		a.ACCOUNT_NAME,
		a.SERIAL_NUM,
		a.GEO,
		a.COUNTRY,
		b.MARKETING_RELEASE_NAME,
		a.APP_VERSION,
		a.BUILD,
		b..MACHINE_ID,
		a.MODULE,
		a.OBJECT,
		a.FUNCTION,
		a.OFFSET,
		a.DEFECT,
		a.FIXED_IN,
		a.EMAIL
     from (select /*+parallel(t,8) parallel(r,8)*/
           DISTINCT replace(sn.mja_name, '[GP]', '') MJA_Account,
                    sn.acct_name Account_Name,
                    to_char(trunc(t.daterecieved, 'mm'), 'yyyy-mm') Month,
                    trunc(t.daterecieved) Day,
                    t.daterecieved timestamp,
                    ebr.bucket_id bucket,
                    t.id report,
                    CASE WHEN u.product_line IS NULL THEN 'N/A' ELSE u.product_line END product_line_id,
                    CASE WHEN u.product_line IS NULL THEN 'N/A' ELSE u.release END release_id,
                    CASE WHEN u.product_line IS NULL THEN 'N/A' ELSE u.master  END master_id,
                    CASE WHEN u.product_line IS NULL THEN 'N/A' ELSE u.build END build_id,
                    CASE WHEN u.product_line IS NULL THEN 'N/A' ELSE u.upi_version  END upi_version,
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
                    nvl(g.region,'UNKNOWN') geo,
                    nvl(g.country,'UNKNOWN') country,
                    sn.csn,
                    sn.serial_num
             from cer.cer_error_report       t,
                  cer.status_code            s,
                  cer.status_code_category   c,
                  cer_log_details            r,
                  cer.cer_upis               u,
                  cer.cer_os_info            oi,
                  cer.cer_os_type            ot,
                  cer.cer_bucket             b,
                  cer.cer_er_bucket_relation ebr,
                  cer.cer_user_comment       uc,
                  cer.cer_geo_region         g,
                  account_data sn                  
            where t.status = s.code(+)
              and s.category = c.category_id(+)
              and t.id = r.error_report_id(+)
              and r.serial_number = sn.serial_num
              and r.upi_id = u.upi_id(+)
              and t.os_info_id = oi.os_info_id(+)
              and oi.platform_id = ot.platform_id(+)
              and oi.major_version = ot.major_version(+)
              and oi.minor_version = ot.minor_version(+)
              and t.id = ebr.error_report_id(+)
              and ebr.bucket_id = b.id(+)
              and t.id = uc.error_report_id(+)
              and t.country=g.country(+)
              and t.is_external = 1
              and t.daterecieved >= to_date('2012-11-26','yyyy-mm-dd')
              and t.daterecieved <=to_date('2013-11-26','yyyy-mm-dd')
          and sn.mja_name not in ('JOHN HOLLANDER','JOHN HOLLANDER ILLUSTRATION','JOHNHOLLANDER','JOHNMILLHOLLAND')
		  and company_name='JOHN HOLLAND'
  ) a,
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