# rman_scripts
# Please be aware, all the scripts prefixed witn cat_* must be used against recovery catalog database.
1. cat_db_detail.sql
 
What is it: 
displays the database ID and DATABASE key of the given database name.

Usage:

cat_db_detail.sql <DB Name>



2. cat_bkp_detail.sql 

What is it: 
shows the backup detail of the given database name for specified time period. 
Usage:
cat_db_detail.sql <DB Name>

Usage:
 
cat_bkp_detail.sql <DB Name> <How long duration>


3.  cat_list_ctl_bkps.sql
 
What is it: 
It shows the backup set details of controlfile for the given DB name using the value obtained from
SESSION_KEY column of the previous script or by specifying time period. 
 
Usage:
 
cat_list_ctl_bkps.sql <DB Name> <specific backup session key> null
OR
cat_list_ctl_bkps.sql <DB Name> null <How long duration> 


4.  cat_list_spfile_bkps.sql
 
What is it: 
The script returns no row If the backup piece doesn’t contain spfile.

Usage:
 
cat_list_spfile_bkps.sql <DB Name> <specific backup session key> null
OR
cat_list_spfile_bkps.sql <DB Name> null <piece name>


5. cat_show_arch_scn.sql

What is it: 
It shows the archive log in the specified backup using of the value obtained from SESSION_KEY
column of the 'cat_bkp_detail.sql' script or by specifying time period.

Usage:
 
cat_list_ctl_bkps.sql <DB Name> <specific backup session key> null
OR
cat_list_ctl_bkps.sql <DB Name> null <piece name>



6. cat_show_arch_scn.sql

What is it: 
shows the number of pieces in the specified backup for specific database.

Usage:
 
cat_piece_count.sql <DB Name> <specific backup session key>



7. cat_bkpset_details.sql

What is it: 
shows all the information is required for restore operation including how many file exists in each backup piece,
pnumber of backup pieces, size of backup pieces, control file names, scn value in archivelog backup and so on so forth.

Usage:
 
cat_bkpset_details.sql <DB Name> <specific backup session key>



8. cat_bkp_log.sql

What is it: 
display the log of RMAN job saved in the catalog db.

Usage:
 
cat_bkp_log.sql <DB key> <specific backup session key>



9. cat_db_scp.sql

What is it: 
show the backup script saved in the catalog DB of the given databasename.

Usage:
 
cat_db_scp.sql <DB Name>



10. rman_sess.sql

What is it: 
script shows RMAN session and time needed to perform its operation.

Usage:
 
rman_sess.sql



11. rman_tio.sql

What is it: 
shows how much of data restored by all channels. 

Usage:
 
@ rman_tio.sql



12. rman_sess_io.sql
What is it: 

shows how much of data restored by each channel. 

Usage:
 
@ rman_sess_io.sql


13. cat_bkpset_more_detail

What is it: 
its shows what is in the specific backup piece 
also, use it to find the piece that has specific datafile by its file#.

Usage:
 
@ cat_bkpset_more_detail <DB Name> <specific backup session key> <piece name> <file#>
 
@ cat_bkpset_more_detail <DB Name> <specific backup session key> <piece name> null
 
@ cat_bkpset_more_detail <DB Name> <specific backup session key> null null 
 
@ cat_bkpset_more_detail <DB Name> <specific backup session key> null <file#>
 

