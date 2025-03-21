
/*
(a)
*/

DROP SEQUENCE emergency_contact_seq;

CREATE SEQUENCE emergency_contact_seq
    START WITH 100
    INCREMENT BY 5;

DROP SEQUENCE patient_seq;

CREATE SEQUENCE patient_seq
    START WITH 100
    INCREMENT BY 5;

DROP SEQUENCE appointment_seq;

CREATE SEQUENCE appointment_seq
    START WITH 100
    INCREMENT BY 5;
/*
(b)
*/
INSERT INTO emergency_contact VALUES (
    emergency_contact_seq.NEXTVAL,
    'Jonathan',
    'Robey',
    '0412523122'
);

--Laura appointment setting
INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Laura',
    'Robey',
    '51 Hill Road',
    'Kalkallo',
    'VIC',
    '3064',
    TO_DATE('27/APR/2005', 'dd/MON/yyyy'),
    '0425763732',
    'laurarobey@raindrop.com',
    emergency_contact_seq.CURRVAL
);

INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('04/OCT/2024 15:30', 'dd/MON/yyyy HH24:MI'),
    (
    SELECT
        provider_roomno
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    'S',
    patient_seq.CURRVAL,
    (
    SELECT
        provider_code
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    6,
    NULL
);

--lachlan appointment setting
INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Lachlan',
    'Robey',
    '51 Hill Road',
    'Kalkallo',
    'VIC',
    '3064',
    TO_DATE('07/APR/2005', 'dd/MON/yyyy'),
    '0465763543',
    'lachlanrobey@raindrop.com',
    emergency_contact_seq.CURRVAL
);

INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('04/OCT/2024 16:00', 'dd/MON/yyyy HH24:MI'),
    (
    SELECT
        provider_roomno
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    'S',
    patient_seq.CURRVAL,
    (
    SELECT
        provider_code
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    6,
    NULL
);

/*
(c)
*/
INSERT INTO appointment VALUES (
    appointment_seq.NEXTVAL,
    TO_DATE('14/OCT/2024 16:00', 'dd/MON/yyyy HH24:MI'),
    (
    SELECT
        provider_roomno
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    'S',
    patient_seq.CURRVAL,
    (
    SELECT
        provider_code
    FROM
        provider
    WHERE
        upper(provider_fname) LIKE upper('bruce')
        AND upper(provider_lname) LIKE upper('striplin')
    ),
    14,
    ( --Subquery to fetch the previous appointment no
    SELECT
        appt_no
    FROM
        appointment
    WHERE --using room number and date to identify the initial appt_no, as a room number cannot be doublebooked
        APPT_ROOMNO = (SELECT
                    provider_roomno
                FROM
                    provider
                WHERE
                    upper(provider_fname) LIKE upper('bruce')
                    AND upper(provider_lname) LIKE upper('striplin')) 
        AND to_char(appt_datetime, 'dd/MON/yyyy HH24:MI') LIKE '04/OCT/2024 16:00'
));

/*
(d)
*/
UPDATE appointment
SET
    appt_datetime = TO_DATE(
        '18/OCT/2024 16:00',
        'dd/MON/yyyy HH24:MI'
    )
WHERE
    appt_no = (
        SELECT
            appt_no
        FROM
            appointment
        WHERE
            appt_roomno = (
                SELECT
                    provider_roomno
                FROM
                    provider
                WHERE
                    upper(provider_fname) LIKE upper('bruce')
                    AND upper(provider_lname) LIKE upper('striplin')
            )
            AND to_char(appt_datetime, 'dd/MON/yyyy HH24:MI') LIKE '14/OCT/2024 16:00'
    );

/*
(e)
*/
DELETE FROM appointment
WHERE
    APPT_NO = (
        SELECT
            appt_no
        FROM
            appointment
        WHERE
            PROVIDER_CODE = (
                SELECT
                    provider_code
                FROM
                    provider
                WHERE
                    upper(provider_fname) LIKE upper('bruce')
                    AND upper(provider_lname) LIKE upper('striplin')
            AND APPT_DATETIME BETWEEN TO_DATE('14/OCT/2024 00:00', 'dd/MON/yyyy HH24:MI') AND TO_DATE('18/OCT/2024 23:59', 'dd/MON/yyyy HH24:MI')
    ));
