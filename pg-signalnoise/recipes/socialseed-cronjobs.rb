# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# lookup twitter data for social seeds

cron "socialseed_update_twitter_data" do
  minute "0"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialseed/update/twitter-data >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# update social seed categories from user data

cron "socialseed_update_categories" do
  minute "5"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialseed/update/categories >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# update social seed state/county from user data

cron "socialseed_update_geo" do
  minute "10"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialseed/update/geo >/dev/null 2>&1"
end