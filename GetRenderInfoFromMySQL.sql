SELECT 
    DATE(ji.endTime) AS render_date,
    result_Count.render_type AS render_type,
    result_Count.total_number AS total_number,
    result_Count.success_number AS success_number,
    result_Count.failure_rate AS failure_rate,
    ROUND(MAX(((rj.dispatchTime - rj.created) / 1000) + ji.renderTime),
            0) AS max_total_time,
    ROUND(AVG(((rj.dispatchTime - rj.created) / 1000) + ji.renderTime),
            0) AS avg_total_time,
    ROUND(MIN(((rj.dispatchTime - rj.created) / 1000) + ji.renderTime),
            0) AS min_total_time,
    ROUND(AVG(ji.renderTime), 0) AS avg_render_time
FROM
    jobinfo ji
        LEFT JOIN
    renderjob rj ON ji.jobid = rj.id
        LEFT JOIN
    (SELECT 
        total_jobs.render_request_date AS render_date,
            total_jobs.rendering_type AS render_type,
            total_jobs.total_job_number AS total_number,
            success_jobs.success_job_number AS success_number,
            CONCAT(ROUND(((total_jobs.total_job_number - success_jobs.success_job_number) / total_jobs.total_job_number * 100), 2), '%') AS failure_rate
    FROM
        (SELECT 
        DATE(FROM_UNIXTIME(rj.created / 1000)) AS render_request_date,
            rj.type AS rendering_type,
            COUNT(*) AS total_job_number
    FROM
        (SELECT 
        renderjob.*, b.type
    FROM
        renderjob
    LEFT JOIN (SELECT 
        CASE
                WHEN renderopt LIKE '%panorama%' THEN 'panorama'
                ELSE 'image'
            END AS type,
            id
    FROM
        jobcontent) AS b ON renderjob.contentId = b.id) AS rj
    LEFT JOIN jobinfo ji ON rj.id = ji.jobid
    WHERE
        rj.created / 1000 BETWEEN UNIX_TIMESTAMP('2014-12-15') AND UNIX_TIMESTAMP('2015-01-05')
    GROUP BY render_request_date , rendering_type) AS total_jobs
    LEFT JOIN (SELECT 
        DATE(FROM_UNIXTIME(rj.created / 1000)) AS render_request_date,
            rj.renderingType AS rendering_type,
            COUNT(*) AS success_job_number
    FROM
        renderjob AS rj
    LEFT JOIN jobinfo ji ON rj.id = ji.jobid
    WHERE
        rj.created / 1000 BETWEEN UNIX_TIMESTAMP('2014-12-15') AND UNIX_TIMESTAMP('2015-01-05')
            AND rj.imgS3Url IS NOT NULL
    GROUP BY render_request_date , rendering_type) AS success_jobs ON total_jobs.render_request_date = success_jobs.render_request_date
        AND total_jobs.rendering_type = success_jobs.rendering_type) AS result_Count ON result_Count.render_date = DATE(ji.endTime)
        AND result_Count.render_type = ji.resultType
WHERE
    DATE(ji.endTime) >= '2014-12-15'
        AND DATE(ji.endTime) < '2015-01-05'
GROUP BY render_date , render_type
ORDER BY render_date DESC , render_type ASC