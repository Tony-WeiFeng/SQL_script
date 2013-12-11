/* *********************************************************************************** */
/* **************** Product language is English (Locale = 1033) ********************** */
/* *********************************************************************************** */
------------------------
-----AutoCAD 2010-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '8001'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2010-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '15'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2011-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '9001'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2011-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '16'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2012-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'a001'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2012-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '17'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2013-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname in ('b001', 'B001')
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2013-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '18'
     and er.is_external = 1
     and er.locale = 1033
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

/* *********************************************************************************** */
/* **************** Product language is Germany (Locale = 1031) ********************** */
/* *********************************************************************************** */
------------------------
-----AutoCAD 2010-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '8001'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2010-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '15'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2011-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '9001'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2011-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '16'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2012-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'a001'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2012-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '17'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2013-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname in ('b001', 'B001')
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2013-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '18'
     and er.is_external = 1
     and er.locale = 1031
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

/* *********************************************************************************** */
/* **************** Product language is Japanese (Locale = 1041) ********************* */
/* *********************************************************************************** */
------------------------
-----AutoCAD 2010-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '8001'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2010-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '15'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2011-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = '9001'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2011-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '16'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2012-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'a001'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2012-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '17'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
-----AutoCAD 2013-------
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname in ('b001', 'B001')
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;

------------------------
----AutoCAD LT 2013-----
------------------------
with OS_types as
 (SELECT CASE
           WHEN dx.system_os LIKE '%32-bit Windows 7%' THEN
            '32-bit Windows 7'
           WHEN dx.system_os LIKE '%64-bit Windows 7%' THEN
            '64-bit Windows 7'
           WHEN dx.system_os LIKE '%32-bit Windows Vista%' THEN
            '32-bit Windows Vista'
           WHEN dx.system_os LIKE '%64-bit Windows Vista%' THEN
            '64-bit Windows Vista'
           WHEN dx.system_os LIKE '%32-bit Windows XP%' THEN
            '32-bit Windows XP'
           WHEN dx.system_os LIKE '%64-bit Windows XP%' THEN
            '64-bit Windows XP'
           WHEN dx.system_os LIKE '%32-bit Windows 8%' THEN
            '32-bit Windows 8'
           WHEN dx.system_os LIKE '%64-bit Windows 8%' THEN
            '64-bit Windows 8'
           WHEN dx.system_os LIKE '%32-bit Windows Server%' THEN
            '32-bit Windows Server'
           WHEN dx.system_os LIKE '%64-bit Windows Server%' THEN
            '64-bit Windows Server'
           ELSE
            'Other'
         END AS os_type,
         dx.error_report_id as eid,
         to_char(er.daterecieved, 'yyyy-mm') as month_received
    from cer_er_dx_diag_relation dx, cer_error_report er
   where er.daterecieved >
         to_date('05/01/2011 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.daterecieved <
         to_date('05/31/2012 12:00:00 AM', 'mm/dd/yyyy HH:MI:SS PM')
     and er.prodname = 'AutoCAD LT'
     and er.prodversion = '18'
     and er.is_external = 1
     and er.locale = 1041
     and dx.error_report_id = er.id)
select month_received, os_type, count(*) as count
  FROM OS_types ost
 GROUP BY month_received, os_type
 ORDER BY month_received, os_type, count;
