# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# pull twitter content from social seeds every 15 minutes

cron "socialmedia_twitter" do
  minute "0,15,30,45"
  hour "*"
  day "*"
  command "wget -O - http://localhost:3000/data/socialmedia/pull/twitter >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# extract tweets from webpages twice per day

cron "extract_twitter" do
  minute "0"
  hour "0,12"
  day "*"
  command "wget -O - http://localhost:3000/data/webpage/extract/twitter >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# pull facebook content from social seeds every 1 hour

cron "socialmedia_facebook" do
  minute "5"
  hour "*"
  day "*"
  command "wget -O - http://localhost:3000/data/socialmedia/pull/facebook >/dev/null 2>&1"
end
