#!/bin/bash

#Give the email address(es) to which the script will have to send the alerts
MAIL_TO=info@dinshaw.us

#Give your domain name here
DOMAIN=dinshaw.us
MAIL_BODY=/home/dinshaw1/dinshaw.us/current/log/delayed_job.log

send_mail()
{
  cat $MAIL_BODY|mail -s "Delayed_job Alert for $DOMAIN" $MAIL_TO
  rm -f $MAIL_BODY
}

TEST=`ps ax | grep delayed_job | grep -v grep | wc -l`
if [ $TEST = 0 ]
  then
  {
    cd /home/dinshaw1/dinshaw.us/current/
    /usr/local/bin/ruby RAILS_ENV=production script/delayed_job start
    echo "Your Delayed_job was found down at `date '+DATE: %m/%d/%y   TIME:%H:%M:%S'`" >> /home/dinshaw1/dinshaw.us/current/log/delayed_job.log
    echo "A restart was attempted automatically."  >> /home/dinshaw1/dinshaw.us/current/log/delayed_job.log
    send_mail
  }
fi