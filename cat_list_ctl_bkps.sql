SET LIN 500 PAGES 200 VERIFY OFF
COL TAG FOR A20
COL HANDLE FOR A25
COL START_TIME FOR A20
COL DEVICE_TYPE FOR A12
COL FILESIZE_DISPLAY FOR A15
/* Author: Majid Shabani */
SELECT SESSION_KEY, SESSION_STAMP, TO_CHAR(P.COMPLETION_TIME,'DD/MM/YY
HH24:MI')CREATION_TIME, HANDLE, FILESIZE_DISPLAY,
 ROUND(ELAPSED_SECONDS)ELAPSED_SECONDS, STATUS, IS_RECOVERY_DEST_FILE,
CHECKPOINT_CHANGE# ||'' CHECKPOINT_CHANGE
FROM RMAN.RC_BACKUP_CONTROLFILE_DETAILS C, RMAN.RC_BACKUP_PIECE P
WHERE C.ID1 = P.SET_STAMP
 AND C.ID2 = P.SET_COUNT
 AND C.BTYPE = 'BACKUPSET'
 AND UPPER(DB_NAME) = UPPER('&1')
 AND (SESSION_KEY = &2 OR TRUNC(START_TIME) >= TRUNC(SYSDATE) - &3)
ORDER BY COMPLETION_TIME;
SET VERIFY ON
