# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :cron_log, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 10.minutes do
  command '/bin/bash /home/dinshaw1/ar_mailer_monitor.sh'
  command 'RAILS_ENV=production /bin/bash /home/dinshaw1/delayed_job_monitor.sh'
end

every 1.week do
  command 'cd /home/dinshaw1/dinshaw.us/current && /bin/bash /home/dinshaw1/log_rotate.sh'
end