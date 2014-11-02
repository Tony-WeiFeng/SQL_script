SELECT 
    DATE(ji.endTime) AS render_date,
    ji.quality AS quality,
    total_jobs.total_job_number AS total_number,
    success_jobs.success_job_number AS success_number,
    CONCAT(ROUND(((total_jobs.total_job_number - success_jobs.success_job_number) / total_jobs.total_job_number * 100),
                    2),
            '%') AS failure_rate,
    ROUND(AVG((rj.modified - rj.created) / 1000),
            0) AS avg_total_time,
    ROUND(AVG(ji.renderTime), 0) AS avg_render_time
FROM
    jobinfo ji
        LEFT JOIN
    renderjob rj ON ji.jobid = rj.id
        LEFT JOIN
    #Get total job numbers for different quality on each day.
    (SELECT 
        DATE(FROM_UNIXTIME(rj.created / 1000)) AS render_request_date,
            ji.quality AS quality,
            COUNT(*) AS total_job_number
    FROM
        renderjob AS rj
    RIGHT JOIN jobinfo ji ON rj.id = ji.jobid
    WHERE
        rj.created / 1000 BETWEEN UNIX_TIMESTAMP('2014-10-31') AND UNIX_TIMESTAMP('2014-11-02')
    GROUP BY ji.quality , render_request_date) AS total_jobs ON total_jobs.render_request_date = DATE(ji.endTime)
        AND total_jobs.quality = ji.quality
        LEFT JOIN
    #Get successful job numbers for different quality on each day.
    (SELECT 
        DATE(FROM_UNIXTIME(rj.created / 1000)) AS render_request_date,
            ji.quality AS quality,
            COUNT(*) AS success_job_number
    FROM
        renderjob AS rj
    RIGHT JOIN jobinfo ji ON rj.id = ji.jobid
    WHERE
        rj.created / 1000 BETWEEN UNIX_TIMESTAMP('2014-10-30') AND UNIX_TIMESTAMP('2014-11-02')
            AND rj.processStatus IN (2 , 5)
    GROUP BY ji.quality , render_request_date) AS success_jobs ON success_jobs.render_request_date = DATE(ji.endTime)
        AND success_jobs.quality = ji.quality
WHERE
    DATE(ji.endTime) > '2014-10-30'
GROUP BY render_date , quality
ORDER BY quality , render_date DESC