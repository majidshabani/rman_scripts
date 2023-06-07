PROMPT
PROMPT This query displays the progress of the RMAN job.
PROMPT
SET LIN 500
col SID for 999999999
SELECT INST_ID, SID, SERIAL#, CONTEXT, SOFAR, TOTALWORK,
ROUND(SOFAR/TOTALWORK*100,2) "%_COMPLETE",
ROUND(TIME_REMAINING/60,2) TIME_REMAINING_MIN
FROM GV$SESSION_LONGOPS
WHERE OPNAME LIKE 'RMAN%'
AND OPNAME NOT LIKE '%aggregate%'
AND TOTALWORK != 0
AND SOFAR <> TOTALWORK;