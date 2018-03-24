basic-linux-mysql-php: Basic demo application showcasing the GoC WET project boew intranet theme as clf compliant Design template addins, for use with YesSoftware CodeCharge Studio 5.x Rapid Application Development (RAD) tool.

Demo was generated for use with a LAMP server (Linux, Apache, MySQL/MAriaDB, PHP). Support for other server based language (.NET, C++, Perl) or database (MS Access, MS SQL, Oracle, DB2,...) possible. 

The application makes use of parametric of several theme selection, including the boew intranet theme. 

The application demonstrates the following features of a CodeCharge Studio based application:

a. Dynamic mutliple theme support. Use URL variable "design" to switch from one presentation layer to another, while accessing the same functional core application (ex: ?design=Light, ?design=theme-gcwu-intranet)

b. Dynamic multiple interface language support. Use the URL variable "locale" to switch the application interface languages, using separate language resources files, one per language supported (ex: ?locale=en, ?locale=fr).

INSTALLATION

1. Copy the whole directory in your lamp server.
2. create default demo application SQL schema using the file available in /data/*.sql, using tool like phpmyadmin or mysql at command prompt.

3. Give read write rights to it to your desired MySQL user, ideally a new user having only access to the new database.

4. modify the default application username and password credential as found in demo-ccs\basic-linux-mysql-php\Common.php file. 

IMPORTANT NOTE: Common.php file should not be readable from the internet, only accessible by the local application, as it contains critical Access Control information.
