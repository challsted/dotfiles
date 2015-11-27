# Mutt

All of the information found in this file will probably be ported to the wiki

This is to log any extra things i had to do other then simply install listed packages

* touch /var/spool/mail/$USER (chase in my case)
* mkdir ~/git/dotfiles/mutt/temp
* Enable "Access for less secure apps" which is off by default
  * https://www.google.com/settings/security/lesssecureapps

## Extra Packages on top of what was told

Needed for Arch and Ubuntu:  
* msmtp - more complete smtp (and uses sendmail)
  * ln -s ~/git/dotfiles/MAIL/msmtprc ~/.msmtprc
  * make sure its 600
* fetchmail - downloads mail (pop3)
  * ln -s ~/git/dotfiles/MAIL/fetchmailrc ~/.fetchmailrc
  * make sure its 700
* procmail - mail sorting tool
  * ln -s ~/git/dotfiles/MAIL/procmailrc ~/.procmailrc

Needed specifically for Arch:  
* msmtp-mta - dependency for msmtp that needs to be manually resolved

Needed specifically for Ubuntu:  
* Place Holder

Needed specifically for OSX:  
* Place Holder


## Guides I followed to get what i have working
* https://help.ubuntu.com/community/MuttAndGmail
  * Good:
    * This DOES work for me
  * Bad:
    * Passwords are hard coded and open for anyone on your box to view or if you upload them to git (like i am doing) then the password is readable from the world
    * I have found a way around this, please see further down

## Encrypted Passwords Working!
* gpg --gen-key
  * This will prompt you for a name, and a password
  * You will need the name for the encryption below
  * The password will be needed to decrypt the file (1 time per opening of mutt)
  * Generating this key took about a minute for me
* `vi ~/git/dotfiles/mutt/passwords`
  * GMail:<tab key>SuperSecretPassword
  * :wq
* `gpg -e -r 'Name' passwords
* `shred -xu ~/git/dotfiles/mutt/passwords` because gpg made a file called passwords.gpg
* Where passwords are requested insert this:
  * `"gpg -d ~/git/dotfiles/mutt/password.gpg | awk '/GMail:/ {print $2}'"`
* In msmtprc you need this instead `passwordeval   "gpg --quiet --for-your-eyes-only --no-tty --decrypt ~/mutt/gmailpassword.gpg"`

## Issues
* Color scheme is not working? Not sure where im supposed to see it at still
* Have to preform multiple fetchmail -vs to get "all" emails

## TODO
* Build a script to auto build mutt with patches!!
