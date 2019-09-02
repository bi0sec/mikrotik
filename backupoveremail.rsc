/system script
add name="Backup" owner=Admin policy=ftp,read,policy,test,sensitive \
    source="# Policies needed:  ftp, read, policy, sensitive, test\r\
    \n# Policies NOT needed:  password, reboot, write, sniff, romon\r\
    \n:log info \"Starting backup\";\r\
    \n/system backup save name=Nameofile_Daily\r\
    \n:delay 00:00:01\r\
    \n/tool e-mail send file=Nameofile_Daily.backup to=\"burimbajraktari3@gmail.com\" body=\"\
    Router #1 daily backup file attached.\" \\\r\
    \n   subject=\"Nameofile  \$[/system clock get date] at \$[/system clock get\
    \_time]  Backup\"\r\
    \n/ export file Prishtina_Daily\r\
    \n:delay 00:00:10\r\
    \n/tool e-mail send file=Nameofile_Daily.rsc to=\"burimbajraktari3@gmail.com\" body=\"Rou\
    ter #1 daily script file attached.\" \\\r\
    \n   subject=\"Nameofile  \$[/system clock get date] at \$[/system clock get\
    \_time]  Script\"\r\
    \n:log info \"Daily backup script completed\"\r\
    \n"
    
    
# script schedule 

/system scheduler
add interval=1d name="backup" on-event="Backup" policy=\
    ftp,read,write,policy,test,password,sniff,sensitive start-date=\
    jul/12/2016 start-time=22:31:00
