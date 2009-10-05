#!/bin/sh

#Give the email address(es) to which the script will have to send the alerts
MAIL_TO=info@dinshaw.us

#Give your domain name here
DOMAIN=dinshaw.us
MAIL_BODY=/home/username/apps/log/.alertlog

send_mail()
{
  cat $MAIL_BODY|mail -s "Delayed_job Alert for $DOMAIN" $MAIL_TO
  rm -f $MAIL_BODY
}

i=`ps aux | grep delayed_job |grep  -v "grep" | wc -l`
if [ $i -eq 0 ]
  then
  {
    cd /home/dinshaw1/dinshaw.us/current/
    /usr/local/bin/ruby /usr/local/bin/ar_sendmail -d --batch-size 4 --delay 60 --environment production
    echo "Your Delayed_job was found down at `date '+DATE: %m/%d/%y   TIME:%H:%M:%S'`" >> /home/username/apps/log/.alertlog
    echo "A restart was attempted automatically."  >> /home/username/apps/log/.alertlog
    send_mail
  }
else
  {
    echo "------------------------------------" >> /home/username/apps/log/.alertlog
    echo "Your  Delayed_job is running fine..." >> /home/username/apps/log/.alertlog
    echo "------------------------------------" >> /home/username/apps/log/.alertlog
    send_mail
  }
fi