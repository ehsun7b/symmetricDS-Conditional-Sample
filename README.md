symmetricDS-Conditional-Sample
==============================

A symmetricDS configuration for a mesh and direct conditional sync. There are two groups of nodes.

Groups of nodes:
  * Main
  * PC

Only one table: Patient which you can find the details in the db.sql file.

* All the records from Main nodes will get synced to the PC nodes and other main nodes (if any) on INSERT, UPDATE, DELETE
* All the data from PC nodes will get synced to the Main nodes on INSERT, UPDATE, DELETE
* All the data from PC nodes will get synced to the other PC nodes if the filed SYNC has the value of 'ALL', on INSERT, UPDATE and DELETE


Please pay attention to the node configuration files (*.properties files) and update the database url, username and password as well as the servers' IP addresses.

The main configuration of the registration  node (the only main node in the current topology) is in main00.sql.
