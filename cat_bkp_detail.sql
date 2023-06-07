SET LINES 300 PAGES 30 VERIFY OFF
COL SESSION_RECID FOR 9999999 HEADING S_RECID
COL STATUS FOR A9
COL START_TIME FORMAT A14
COL OUTPUT_DEVICE_TYPE FOR A8 HEADING DEVICE
COL END_TIME FOR A14
col IN_SIZE for a12
col OUT_SIZE for a12
col COMP for 99.9999
col IN_SPEED for a10
col OUT_SPEED for a10
/* Author: Majid Shabani */
SELECT DB_NAME, DB_KEY, SESSION_KEY, SESSION_STAMP, STATUS, INPUT_TYPE,
       STARTING_TIME START_TIME, OUTPUT_DEVICE_TYPE,
       END_TIME, HOURS, IN_SIZE, OUT_SIZE, IN_SPEED, OUT_SPEED, COMP
FROM (
SELECT DB_NAME, DB_KEY, SESSION_KEY, SESSION_STAMP, STATUS, INPUT_TYPE,
       TO_CHAR(START_TIME,'DD/MM/YY HH24:MI') STARTING_TIME,
       OUTPUT_DEVICE_TYPE, TO_CHAR(END_TIME,'DD/MM/YY HH24:MI') END_TIME,
       ROUND(ELAPSED_SECONDS/60/60,1 )HOURS,
       INPUT_BYTES_DISPLAY IN_SIZE, OUTPUT_BYTES_DISPLAY OUT_SIZE,
       INPUT_BYTES_PER_SEC_DISPLAY IN_SPEED, OUTPUT_BYTES_PER_SEC_DISPLAY OUT_SPEED,
       ROUND(COMPRESSION_RATIO,4) COMP
FROM RC_RMAN_BACKUP_JOB_DETAILS
WHERE UPPER(DB_NAME) = UPPER('&1')
  AND TRUNC(START_TIME) >= TRUNC(SYSDATE) - &2
ORDER BY START_TIME);
SET VERIFY ON
