wet-boew-codecharge
===================

CodeCharge Studio variant of the Web Experience Toolkit (WET)
<br />
Demo site: http://wet-boew-php.azurewebsites.net/demos-ccs (???)

Version: WET 3.1.X

## Overview

This features WET based Design templates for use with YesSoftware CodeCharge Studio 5.x (CCS).
CCS facilitates Rapid web Application Development (RAD) in ASP, dotnet, Coldfusion, JSP, Perl,or php.
Application can be generated to run on IIS or Apache web server, and to support a variety of databases (MySQL, Oracle, DB2, MSSQL, PostgreSQL,...).

##Benefits

* Provides CodeChargeStudio developers with a clf compliant Master Template for existing and new projects, starting with the boew-intranet-theme. 
* Only one web page per subject, regardless of the number of user languages or theme used.
* Interface language labels completely separated from the page, managed in simple text based resource text files.
* Static text content pages can have all translated text saved on same page yet only one language shown for better configuration control.
* Truly separates look and feel format and content development for easier web development effort.

* Conforms to WCAG 2.0 AA
* Uses WAI-ARIA to enhance accessibility
* Supports Firefox, Opera, Safari, Chrome, and IE 7+ 

##Minimum Requirements

* Design Template: CodeCharge Studio 5.X
* Demos: LAMP stack** (Linux-Apache-MySQL-PHP). 

##Additional Notes

* wet-boew-codecharge vs wet-boew-php:

Codecharge variant provides re-usable Master Templates for CodeCharge, which are independent of the generator language used (php,.net,perl,C##,...)
Some demos are provided, all generated in php, ready to use on any Apache MySQL PHP infrastructure. They showcase the re-usability of the clf themes 
and a MVC based application framework. Web developers can focus on content, and re-use the same content across all themes provided.
Html and php code files are completely separated (.php and .html), keeping a clear separation between presentation and code.
All user interface language variables are defined in external resource text file, one per language, for easier maintenance.

* Demo environment tailoring**

Although demo provided is generated ready for a LAMP system architecture environment (Linux Apache MySQL PHP), it can be re-generated for other combination of language/dbms. This capability requires a licensed copy of CCS.

To run demo on Windows: Get CodechargeStudio, open demo project file, change output file format from Unix/Linux to Windows, and re-generate demo.

To run demo using ASP/dotnet/JSP/Coldfusion: Get CodechargeStudio, open demo project file, change Code Language, and re-generate demo.

To run demo with MSAccess/Oracle/MSSQL/DB2/PostgresSQL: Get CodechargeStudio, , open demo project file, change database connections, and re-generate demo. Conversion of schema from MySQL SQL syntax to the other SQL dbms may be required.

