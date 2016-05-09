# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# lookup follower count for active seeds

cron "socialseed_update_follower_count" do
  minute "0"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialseed/update/follower-count >/dev/null 2>&1"
end