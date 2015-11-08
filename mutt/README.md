# Mutt

All of the information found in this file will probably be ported to the wiki

This is to log any extra things i had to do other then simply install listed packages

* touch /var/spool/mail/$USER (chase in my case)

## Extra Packages on top of what was told

* msmtp - more complete smtp (and uses sendmail)
  * msmtp-mta - dependency for msmtp that needs to be manually resolved
  * You will need to configure this package by hand on Arch at least
* OfflineIMAP - Download emails or offline viewing
