REM =================================
REM DEV build and install process 
REM =================================
REM purpose: install demo-ccs application on localhost for TEST only.
REM production installation requires ususally more considerations (file priviledges, MySQL user management,...)
REM ---------------------------------
REM Overview
REM ---------------------------------
REM 1. setup your LAMP server
REM Create a LAMP server. Suggestion: Install bitnami XAMPP Distribution locally.
REM create a demo user, and demo database using provided demo_MySQL.sql file in /data folder
REM hint: if using XAMPP, use phpmyadmin to copy-and-paste the content of demo_MySQL.sql into phpmyadmin sql TAB;

REM 2. setup demo application
REM Copy directory demo-ccs to your LAMP server; 
REM update Common.php with demo user and database info; 
REM make Common.php readable only by server... 
REM ==================================
REM INSTALL
REM ==================================
REM Assumptions: 
REM 1. local Bitnami XAMPP Distribution installed by default (in c:\xampp) (Windows)
SET DEMO=demo-ccs
SET WWW=c:\xampp\htdocs
REM -----------------------------------
REM Procedure
REM -----------------------------------
REM Backup present installed application just in case...
REM DELETE %WWW%\%DEMO%_old
REM RENAME %WWW%\%DEMO% %WWW%\%DEMO%_old 

REM (Re-)install demo-ccs from local directory where this file reside.
REM MKDIR %WWW%\%DEMO%
XCOPY /S /D .\*.* %WWW%\%DEMO%
PAUSE

