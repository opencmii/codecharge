wet-boew-codecharge
===================

CodeCharge variant of the Web Experience Toolkit (WET)<br />
Demo site: http:tbd/demos-php/index.php

## Overview

This features WET based Design templates for use with YesSoftware CodeCharge Studio 5.x (CCS).
CCS facilitates Rapid web Application Development (RAD) in ASP, dotnet, Coldfusion, JSP, Perl,or php.
Application can be generated to run on IIS or Apache web server, and to support a variety of databases (MySQL, Oracle, DB2, MSSQL, PostgreSQL,...).

##Benefits

* Provides CodeChargeStudio developers with a clf compliant design template for existing and new projects, starting with the boew-intranet-theme.
* Simplify interface language management by capturing all values in separate external resource text files.
* Allow conversion of existing static page based web clf site into a consolidated data driven web application.
* Truly separates look and feel format and content development for the web development team.
* Reuse wet-boew-php sub-project meta-data definition to facilitate migration.

* Conforms to WCAG 2.0 AA
* Uses WAI-ARIA to enhance accessibility
* Supports Firefox, Opera, Safari, Chrome, and IE 7+ 

##Minimum Requirements

* Design Template: CodeCharge Studio 5.X
* Demos: LAMP server (Linux-Apache-MySQL-Php). 

##Additional Notes

* Demo environment tailoring

To run demos on Windows: Get CodechargeStudio, open demo project file, change output file format from Unix/Linux to Windows, and re-generate demo.

To run demos using ASP/dotnet/JSP/Coldfusion: Get CodechargeStudio, open demo project file, change Code Language, and re-generate demo.

To run demos with MSAccess/Oracle/MSSQL/DB2/PostgresSQL: Get CodechargeStudio, , open demo project file, change database connections, and re-generate demo.

* wet-boew-codecharge vs wet-boew-php:

php is the default language of the demos provided. The design template is good for all languages.

All user interface language variables are defined in external resource text file, one per language, for easier maintenance.

Html and php code files are completely separated (.php and .html), keeping a clear separation between presentation and code.
