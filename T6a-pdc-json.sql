
/*
(a)
*/

SELECT JSON_OBJECT(
    '_id' VALUE a.appt_no,
    'datetime' VALUE TO_CHAR(a.appt_datetime, 'DD/MM/YYYY HH24:MI'),
    'provider_code' VALUE a.provider_code,
    'provider_name' VALUE p.provider_title || '. ' || p.provider_fname || ' ' || p.provider_lname,
    'item_totalcost' VALUE SUM(i.item_stdcost * asi.as_item_quantity),
    'no_of_items' VALUE SUM(asi.as_item_quantity),
    'items' VALUE JSON_ARRAYAGG(
        JSON_OBJECT(
            'id' VALUE i.item_id,
            'desc' VALUE i.item_desc,
            'standardcost' VALUE i.item_stdcost,
            'quantity' VALUE asi.as_item_quantity
        )
    )
) AS appointment_json
FROM
    appointment      a
    JOIN provider p
    ON a.provider_code = p.provider_code
    JOIN apptservice_item asi
    ON a.appt_no = asi.appt_no
    JOIN item i
    ON asi.item_id = i.item_id
WHERE EXISTS (
    SELECT ASI.AS_ITEM_QUANTITY
    FROM apptservice_item asi_2
    WHERE asi_2.appt_no = a.appt_no
)
GROUP BY a.appt_no, a.appt_datetime, a.provider_code, 
         p.provider_title, p.provider_fname, p.provider_lname;

select * from APPT_SERV;
