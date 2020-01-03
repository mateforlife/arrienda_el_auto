# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
require 'active_support/all'
Time.zone = 'America/Santiago'
set :output, 'log/cron_log.log'
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

every 1.day, at: Time.zone.parse('00:00 am').utc do
  rake 'reservations:finish_by_date'
end

# Learn more: http://github.com/javan/whenever
