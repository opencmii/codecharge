wet-boew-codecharge
===================

CodeCharge variant of the Web Experience Toolkit (WET)<br />
Demo site: http:tbd/demos-php/index.php

## Overview

This feature WET based Design templates for use with YesSoftware CodeCharge Studio 5.x
to facilitate rapid web application development (ASP,.net,Coldfusion,JSP,Perl,php) 
for use on IIS or Apache web server and almost any user database (MySQL, Oracle, DB2, MSSQL,...).
Demo features a multi-language application framework making showcasing a database driven navigation menu and breadcrum.


##Benefits

* Provides theme-gcwu-intranet as design template for existing and new projects.
* All languages variables managed as external resource text file.
* site menu, navigation menu and breadcrum are database driven.
* One template file for all instance of languages and option selection (subsite,submenu,signin/signout)


* Conforms to WCAG 2.0 AA
* Uses WAI-ARIA to enhance accessibility
* Supports Firefox, Opera, Safari, Chrome, and IE 7+ 

##Minimum Requirements

* CodeCharge Studio 5.X
* dist folder from WET 3.1 Core

##Additional Notes
Demo provided has been generated to run on LAMP solution. It has been generated to use php, MySQL, and Linux based www service.
To obtain a demo using any other available languages (ASP,.net,Coldfusion,JSP,Perl), or database (DB2,Oracle, PostgreSQL,MSSQL)
please obtain a copy Codecharge Studio or contact us. All the source files required to re-generate in any way required are provided in dist folder.

Key differences with this demo and wet-boew-php subprojects are:
* All user interface language variables are defined into external resource text file, one per language, for easier maintainance.
* html and php code file are separated files, keeping a clear separation between presentation and code.
* demo features a database driven menu and paramateric content strategy, whereby many look and feel theme can be defined and used dynamically. 
* To the extent possible, theme variable names defined in the php subproject has been retained for compatiblity/transition.


