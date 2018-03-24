wet-boew-codecharge
===================

CodeCharge Studio variant of the Web Experience Toolkit (WET)
<br />
Demo site: http://wet-boew-php.azurewebsites.net/demos-ccs (???)

Version: WET 3.1.X

## Overview

This features WET based Design templates for use with YesSoftware CodeCharge Studio 5.x (CCS).
CCS facilitates Rapid web Application Development (RAD) in ASP, dotnet, Coldfusion, JSP, Perl,or php.
Application can be generated to run on IIS or Apache web server, and to support a variety of databases (MySQL, Oracle, DB2, MSSQL, PostgreSQL,...). Default language and DBMS for provided Design templates are php/MySQL, the most common one.

##Benefits

* Provides CodeChargeStudio developers with a clf compliant Master Design Template for existing and new projects, starting with the boew-intranet-theme. 
* Only one web page per subject, regardless of the number of user languages or theme used.
* Interface language labels completely separated from the page, managed in simple text based resource text files.
* Truly separates look and feel format and content development for easier web development effort.

* Conforms to WCAG 2.0 AA
* Uses WAI-ARIA to enhance accessibility
* Supports Firefox, Opera, Safari, Chrome, and IE 7+ 

##Minimum Requirements

* Design Template: CodeCharge Studio 5.X .The design template provided needs to be added either to the installed CodeChargeStudio files or in the Design folder of an existing project.
* Demos: The demo application was generated to be used in a LAMP stack** (Linux-Apache-MySQL-PHP). By example, if using Bitnami LAMPP distribution based on XAMPP, the demo applicaiton needs to be copied into c:\xampp\htdocs folder, and have the schema found in the data folder created on the corresponding MySQL database, using the default credential (username/password) found in the Common.php (which should be changed by the user).

##Additional Notes

* wet-boew-codecharge vs wet-boew-php:
wet-boew-codecharge provides re-useable Design template to implement clf while wet-boew-php is a full php based framework to be used to make php based pages. wet-boew-codecharge requries the use of CodechargeStudio 5.x while wet-boew-php only need php.

Also, in wet-boew-codecharge, presentation and domain code are clearly separated respectively in .html and .php code files.
Last, all user interface language variables are defined in external resource text file, one per language, for easier maintenance.

* Demo environment tailoring**

Although demo provided is generated ready for a LAMP system architecture environment (Linux Apache MySQL PHP), it can be re-generated for other combination of language/dbms. The capability to re-generate the demo-ccs demo application in a different languages and DBMS is an awesome feature of CodechargeStudio, which requires however a full licensed copy of CCS.

FILES
* dist-ccs\demo-ccs:	Folder that contains a generated demo application, using the re-useable design component (clf)
* dist-ccs\dist-ccs:	Folder that contains the re-useable CodeChargeStudio 5.X Design Templates, 
						starting with theme-gcwu-intranet


