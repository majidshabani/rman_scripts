SET LIN 500 PAGES 50 VERIFY OFF
COL HANDLE FOR A50
COL NEXT_CHANGE FOR A18
COL DEVICE_TYPE FOR A8
COL START_TIME FOR A20
/* Author: Majid Shabani */
SELECT SESSION_KEY, SESSION_STAMP, A.DB_KEY, DB_NAME, THREAD#, SEQUENCE#,
       NEXT_CHANGE#||''NEXT_CHANGE,
       TO_CHAR(NEXT_TIME,'YYYY-MM-DD HH24:MI:SS')LAST_TIME, B.DEVICE_TYPE,
       HANDLE, TO_CHAR(B.START_TIME,'YYYY-MM-DD HH24:MI:SS')START_TIME,
       TO_CHAR(B.COMPLETION_TIME,'YYYY-MM-DD HH24:MI:SS')COMPLETION_TIME, B.STATUS
FROM RC_BACKUP_ARCHIVELOG_DETAILS A, RC_BACKUP_PIECE B
WHERE A.ID1 = B.SET_STAMP
  AND A.ID2 = B.SET_COUNT
  AND UPPER(DB_NAME) = UPPER('&1')
  AND (SESSION_KEY = &2 OR FIRST_TIME >= SYSDATE - &3)
ORDER BY NEXT_TIME;
SET VERIFY ON
