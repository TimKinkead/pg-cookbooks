# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# pull twitter content from social seeds every 15 minutes

cron "socialmedia_twitter" do
  minute "0,15,30,45"
  hour "*"
  day "*"
  command "wget -O - http://localhost:80/data/socialmedia/pull/twitter >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------
