SET VERIFY OFF
COMP SUM OF PIECE_CNT ON REPORT
BREAK ON REPORT
/* Author: Majid Shabani */
SELECT DECODE(BACKUP_TYPE,'D','Full Backup','I','Incremental Backup' ,'L','Backup of Archivelog')BACKUP_TYPE, COUNT(*) PIECE_CNT
FROM RC_BACKUP_SET_DETAILS
WHERE UPPER(DB_NAME)=UPPER('&1')
  AND SESSION_KEY=&2
GROUP BY DECODE(BACKUP_TYPE,'D','Full Backup','I','Incremental Backup','L','Backup of Archivelog');
CLEAR BREAK
SET VERIFY ON
