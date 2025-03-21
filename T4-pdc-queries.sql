--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-pdc-queries.sql

-- ITO Assignment 2 Task 4

--Student ID: 35484306
--Student Name: Conrad Guo

/* Comments for your marker:


it has been assumed that apptserv_itemcost is the total cost of the items involved in the appointment.

*/

-- ENSURE that your SQL code is formatted and has a semicolon (;)
-- at the end of every statement. When marked this will be run as
-- a script.

/*
(a)
*/
    SELECT
        provider_code,
        provider_title || '. ' ||provider_fname || ' ' ||provider_lname AS provider_name
    FROM
        provider
    WHERE
        spec_id = (
            SELECT
                spec_id
            FROM
                specialisation
            WHERE
                upper(spec_name) LIKE 'PAEDIATRIC DENTISTRY'
        )
    ORDER BY
        provider_lname,
        provider_fname,
        provider_code;


/*
(b)
*/
SELECT
    s.service_code,
    service_desc,
    to_char(service_stdfee, '$99990.99')
FROM
    service s join appt_serv a on s.service_code = a.service_code
WHERE
    apptserv_fee > service_stdfee
ORDER BY service_stdfee, service_code;

/*
(c)
*/
SELECT
    app.appt_no,
    to_date(app.appt_datetime, 'dd/MON/yyyy HH24:MI') as appt_datetime,
    app.patient_no,
    p.patient_fname || ' ' || p.patient_lname                 AS patient_name,
    to_char(apptserv_fee + apptserv_itemcost, '$99990.99') AS apptserv_totalcost

FROM 
    patient p 
    join appointment app on p.patient_no = app.PATIENT_NO
    join appt_serv ap on app.appt_no = ap.appt_no

WHERE 
    (apptserv_fee + apptserv_itemcost) = (
        SELECT MAX(apptserv_fee + apptserv_itemcost)
        FROM appt_serv
    )
ORDER BY
    app.appt_no;

/*
(d)
*/
SELECT
    s.service_code,
    s.service_desc,
    TO_CHAR(s.service_stdfee, '$99990.99') AS SERVICE_STDFEE,
    TO_CHAR(AVG(a.apptserv_fee) - s.service_stdfee, '$99990.99') AS SERVICE_FEE_DIFFERENTIAL
FROM
    service s
    JOIN appt_serv a ON s.service_code = a.service_code
GROUP BY
    s.service_code, s.service_desc, s.SERVICE_STDFEE
ORDER BY
    s.service_code;

/*
(e)
*/
SELECT
    lpad(p.patient_no,10,' ') as PATIENT_NO,
    rpad(p.patient_fname || ' ' || p.patient_lname, 25, ' ') AS PATIENTNAME,
    lpad(trunc(months_between(sysdate, p.patient_dob)/12), 10, ' ') AS currentage,
    lpad(count(a.appt_no),10,' ')                                 AS numappts,
    lpad(to_char((sum(
        CASE
            WHEN a.appt_prior_apptno IS NOT NULL THEN
                1
            ELSE
                0
        END)/count(a.appt_no)*100), '90.9') || '%',9,' ')              AS followups
FROM
    patient     p
    JOIN appointment a
    ON p.patient_no = a.patient_no
GROUP BY
    p.patient_no,
    p.patient_fname,
    p.patient_lname,
    p.patient_dob
ORDER BY p.PATIENT_NO;

/*
(f)
*/
--it has been assumed that apptserv_itemcost is the total cost of the items involved in the appointment.
SELECT
    LPAD(a.provider_code, 6, ' ')  AS pcode,
    LPAD(count(DISTINCT a.appt_no), 11, ' ') AS numberappts,
    CASE
        WHEN SUM(DISTINCT AP.APPTSERV_FEE + ap.apptserv_itemcost) IS NULL THEN
            LPAD('-', 10, ' ')
        ELSE
            LPAD(TO_CHAR(
                SUM(DISTINCT AP.APPTSERV_FEE + ap.apptserv_itemcost), 
                '$999990.99'
            ), 10, ' ')
    END AS TOTALFEES,
    CASE
        WHEN SUM(DISTINCT ASI.AS_ITEM_QUANTITY) IS NULL THEN
            LPAD('-', 7, ' ')
        ELSE
            LPAD(TO_CHAR(
                SUM(DISTINCT ASI.AS_ITEM_QUANTITY), 
                '999999'
            ), 7, ' ')
    END AS NOITEMS
FROM
    APPOINTMENT A
    FULL OUTER JOIN APPT_SERV AP
    ON A.APPT_NO = AP.APPT_NO
    FULL OUTER JOIN APPTSERVICE_ITEM ASI
    ON ASI.APPT_NO = A.APPT_NO
WHERE
    A.APPT_DATETIME BETWEEN TO_DATE('01/SEP/2024 09:00', 'dd/MON/yyyy HH24:MI') AND TO_DATE('15/SEP/2024 17:00', 'dd/MON/yyyy HH24:MI')
GROUP BY
    A.PROVIDER_CODE
ORDER BY
    A.PROVIDER_CODE;

