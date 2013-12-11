with er as 
(select *
  from CER_ERROR_REPORT r
--  where r.prodname LIKE 'Moldflow%' AND r.build_number LIKE '12%' and r.status > 0 and r.is_external = 1
  where r.prodname LIKE '%Moldflow%' AND r.prodversion = '2014' 
--  and id = 68779667
--  AND datecompleted < TO_DATE('27-JAN-2012','DD-MON-YYYY')
),    --This is for Moldflow CERs

er_de as 
(select /*+parallel(t,8)*/
    er.id                as Report_id,
    de.defect_tag        as Defect
    from er
    left join CER_ER_BUCKET_RELATION er_bu on er_bu.error_report_id = er.id
    left join CER_BUCKET_DEFECT_RELATION bu_de on bu_de.bucket_id = er_bu.bucket_id
    left join CER_DEFECTS de on de.defect_id = bu_de.defect_id
    left join CER_BUCKET bu on bu.id = er_bu.bucket_id
    left join CER_USER_COMMENT uc on uc.error_report_id = er.id
),  -- Moldflow CERs and Defect mapping

de_merged as 
(select report_id,
       max(decode(inner_order, 1, defect, null)) 
	|| nvl2(max(decode(inner_order, 2, defect, null)), ',    ' || max(decode(inner_order, 2, defect, null)), '') 
	|| nvl2(max(decode(inner_order, 3, defect, null)), ',    ' || max(decode(inner_order, 3, defect, null)), '')
	|| nvl2(max(decode(inner_order, 4, defect, null)), ',    ' || max(decode(inner_order, 4, defect, null)), '') 
	|| nvl2(max(decode(inner_order, 5, defect, null)), ',    ' || max(decode(inner_order, 5, defect, null)), '') 
	as defects
             
  from (select report_id, defect, rank() over(partition by report_id order by defect) as inner_order
        from (select * from er_de
              where Report_id in
                (select report_id
                 from (select er_de.Report_id, count(*) as count_
                 from er_de
                 group by er_de.Report_id)
                 where count_ >= 2
            )
        ) t  --Queried the CERs which have 2 or more defects logged
    group by report_id, defect) t1
 group by report_id
),    -- Merged defect, if one CER have 2 defects were logged, there will be 2 items for this CER, this code will merge it to one.

        
        
result_defect_unmerged as 
( select /*+parallel(t,8)*/
  distinct er.id                as Report_id,             bu.id as Bucket_id,
       er.daterecieved          as Date_Received,         er.datecompleted as Date_Completed,
       er.prodname              as Product,               er.appversion as APP_Ver,
       er.userinfo_metadata     as User_Data,             er.build_number as Build_Num,
       er.ip_addr_hash          as Hashed_IP_Address,     uc.useremail    as User_Email,
       de.defect_tag            as Defect,                bu.generic1 as Fixed, 
     decode(bu.generic2, 1, 'Triaged but not reproducible', 2, 'Triaged and reproducible',
        3, 'Fixed (Not used in product fix rate calculations', 4, 'External Dependency', '') Triaged,
       uc.errordescription as User_Comments,
       dx.system_os             as OS,                    er.notes as Notes,
       dx.graphics_manufacturer as graphics_manufacturer, dx.graphics_chip_type as graphics_chip_type,
       dx.graphics_dac_type     as graphics_dac_type,     dx.graphics_hw_memory as graphics_hw_memory,
       dx.graphics_display_mode as graphics_display_mode

    from er
    left join CER_ER_BUCKET_RELATION er_bu on er.id = er_bu.error_report_id
    left join CER_BUCKET_DEFECT_RELATION bu_de on er_bu.bucket_id = bu_de.bucket_id
    left join CER_DEFECTS de on bu_de.defect_id = de.defect_id
    left join CER_BUCKET bu on er_bu.bucket_id = bu.id
    left join CER_USER_COMMENT uc on er.id = uc.error_report_id
    left join CER_ER_DX_DIAG_RELATION dx on er.id = dx.error_report_id
), --This query show Moldflow CERs with unmerged Defects. That's mean if one CER have 2 defects were logged, then there will be 2 items for this CER

single_defect_cer as 
(select * from result_defect_unmerged 
  where not exists 
    ( select * from de_merged 
      where result_defect_unmerged.report_id = de_merged.report_id 
    )
), --This query for list the queried Moldflow CERs which has only one Defect or no defect logged.

multi_defects_cer as
(select distinct ta.Report_id, ta.Bucket_id, ta.Date_Received, 
                 ta.Date_Completed, ta.Product, ta.APP_Ver, 
         ta.User_Data, ta.Build_Num, ta.Hashed_IP_Address, ta.User_Email,
         tb.defects as Defect, ta.Fixed, ta.Triaged,
         ta.User_Comments, ta.OS, ta.Notes, 
         ta.graphics_manufacturer, ta.graphics_chip_type, ta.graphics_dac_type, 
         ta.graphics_hw_memory, ta.graphics_display_mode
  from result_defect_unmerged ta, de_merged tb
  where ta.Report_id = tb.Report_id
) --This query is for distinct the duplicated CERs and replaced the value of defect column by merged defects.

select * from single_defect_cer union all select * from multi_defects_cer
