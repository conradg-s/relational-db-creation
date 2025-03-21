
/* Comments for your marker:

It has been assumed that items can be used for all services


*/


-- ENSURE that your SQL code is formatted and has a semicolon (;)
-- at the end of every statement. When marked this will be run as
-- a script.
-- Insert into APPOINTMENT
INSERT INTO appointment VALUES (
    1,
    TO_DATE('01/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    1,
    'T',
    1,
    'END001',
    1,
    NULL
);

INSERT INTO appointment VALUES (
    2,
    TO_DATE('01/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    2,
    'T',
    2,
    'GEN001',
    2,
    NULL
);

INSERT INTO appointment VALUES (
    3,
    TO_DATE('02/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    3,
    'T',
    3,
    'GEN002',
    3,
    NULL
);

INSERT INTO appointment VALUES (
    4,
    TO_DATE('07/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    4,
    'T',
    4,
    'GEN003',
    4,
    NULL
);

INSERT INTO appointment VALUES (
    5,
    TO_DATE('04/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    5,
    'T',
    5,
    'ORS001',
    5,
    NULL
);

INSERT INTO appointment VALUES (
    6,
    TO_DATE('04/SEP/2024 13:00', 'dd/MON/yyyy HH24:MI'),
    6,
    'T',
    6,
    'PED001',
    6,
    NULL
);

INSERT INTO appointment VALUES (
    7,
    TO_DATE('01/SEP/2024 18:00', 'dd/MON/yyyy HH24:MI'),
    1,
    'T',
    1,
    'END001',
    1,
    1
);

INSERT INTO appointment VALUES (
    8,
    TO_DATE('01/SEP/2024 18:00', 'dd/MON/yyyy HH24:MI'),
    2,
    'T',
    2,
    'GEN001',
    2,
    2
);

INSERT INTO appointment VALUES (
    9,
    TO_DATE('02/SEP/2024 18:00', 'dd/MON/yyyy HH24:MI'),
    3,
    'T',
    3,
    'GEN002',
    3,
    3
);

INSERT INTO appointment VALUES (
    10,
    TO_DATE('07/SEP/2024 16:00', 'dd/MON/yyyy HH24:MI'),
    4,
    'T',
    4,
    'GEN003',
    4,
    4
);

-- Insert into APPT_SERV
--1
INSERT INTO appt_serv VALUES (
    1,
    'RC01',
    300,
    40
);
--2
INSERT INTO appt_serv VALUES (
    1,
    'RC02',
    200,
    0
);
--3
INSERT INTO appt_serv VALUES (
    2,
    'D001',
    300,
    24
);
--4
INSERT INTO appt_serv VALUES (
    2,
    'DF02',
    190,
    84
);
--5
INSERT INTO appt_serv VALUES (
    3,
    'D003',
    100,
    4
);
--6
INSERT INTO appt_serv VALUES (
    3,
    'P003',
    78,
    2
);
--7
INSERT INTO appt_serv VALUES (
    4,
    'P001',
    100,
    0
);
--8
INSERT INTO appt_serv VALUES (
    4,
    'DF01',
    100,
    46
);
--9
INSERT INTO appt_serv VALUES (
    5,
    'EX01',
    90,
    20
);
--10
INSERT INTO appt_serv VALUES (
    6,
    'P002',
    150,
    5
);
--11
INSERT INTO appt_serv VALUES (
    6,
    'P003',
    150,
    42
);
--12
INSERT INTO appt_serv VALUES (
    7,
    'P003',
    75,
    46
);
--13
INSERT INTO appt_serv VALUES (
    7,
    'RC02',
    130,
    30
);
--14
INSERT INTO appt_serv VALUES (
    7,
    'RC03',
    150,
    48
);
--15
INSERT INTO appt_serv VALUES (
    7,
    'RC04',
    150,
    60
);

-- Insert into APPTSERVICE_ITEM
--1
INSERT INTO apptservice_item VALUES (
    1,
    1,
    'RC01',
    1,
    2
);
--2
INSERT INTO apptservice_item VALUES (
    2,
    1,
    'RC01',
    2,
    5
);
--3
INSERT INTO apptservice_item VALUES (
    3,
    1,
    'RC01',
    3,
    1
);
--4
INSERT INTO apptservice_item VALUES (
    4,
    2,
    'D001',
    1,
    10
);
--5
INSERT INTO apptservice_item VALUES (
    5,
    2,
    'D001',
    2,
    1
);
--6
INSERT INTO apptservice_item VALUES (
    6,
    2,
    'D001',
    3,
    1
);
--7
INSERT INTO apptservice_item VALUES (
    7,
    2,
    'DF02',
    19,
    2
);
--8
INSERT INTO apptservice_item VALUES (
    8,
    3,
    'D003',
    11,
    2
);
--9
INSERT INTO apptservice_item VALUES (
    9,
    3,
    'P003',
    10,
    1
);
--10
INSERT INTO apptservice_item VALUES (
    10,
    4,
    'DF01',
    17,
    1
);
--11
INSERT INTO apptservice_item VALUES (
    11,
    5,
    'EX01',
    21,
    4
);
--12
INSERT INTO apptservice_item VALUES (
    12,
    6,
    'P002',
    12,
    5
);
--13
INSERT INTO apptservice_item VALUES (
    13,
    6,
    'P003',
    19,
    1
);
--14
INSERT INTO apptservice_item VALUES (
    14,
    7,
    'P003',
    17,
    1
);
--15
INSERT INTO apptservice_item VALUES (
    15,
    7,
    'RC02',
    14,
    3
);
--16
INSERT INTO apptservice_item VALUES (
    16,
    7,
    'RC02',
    21,
    4
);
--17
INSERT INTO apptservice_item VALUES (
    17,
    7,
    'RC02',
    8,
    2
);
--18
INSERT INTO apptservice_item VALUES (
    18,
    7,
    'RC03',
    16,
    1
);
--19
INSERT INTO apptservice_item VALUES (
    19,
    7,
    'RC04',
    22,
    1
);
--20
INSERT INTO apptservice_item VALUES (
    20,
    7,
    'RC04',
    23,
    1
);

COMMIT;
