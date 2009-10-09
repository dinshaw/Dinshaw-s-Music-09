#!/bin/sh

#Give the email address(es) to which the script will have to send the alerts
MAIL_TO=info@dinshaw.us

#Give your domain name here
DOMAIN=dinshaw.us
MAIL_BODY=/home/dinshaw1/dinshaw.us/current/log/ar_mailer.log

send_mail()
{
  cat $MAIL_BODY|mail -s "AR Mailer Alert for $DOMAIN" $MAIL_TO
  rm -f $MAIL_BODY
}

if ps | grep -v grep | grep ar_sendmail > /dev/null
  then
  {
    echo "------------------------------------" >> /home/dinshaw1/dinshaw.us/current/log/ar_mailer.log
    echo "Your AR Mailer is running fine..." >> /home/dinshaw1/dinshaw.us/current/log/ar_mailer.log
    echo "------------------------------------" >> /home/dinshaw1/dinshaw.us/current/log/ar_mailer.log
    send_mail
  }
else
  {
    /usr/local/bin/ruby /usr/local/bin/ar_sendmail -d -b 4 --delay 60  -c "/home/dinshaw1/dinshaw.us/current/" -e "production"
    echo "Your AR_Mailer was found down at `date '+DATE: %m/%d/%y   TIME:%H:%M:%S'`" >> /home/dinshaw1/dinshaw.us/current/log/ar_mailer.log
    echo "A restart was attempted automatically."  >> /home/dinshaw1/dinshaw.us/current/log/ar_mailer.log
    send_mail
  }
fi