# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# pull twitter content from social seeds every 15 minutes

cron "socialmedia_pull_twitter" do
  minute "0,15,30,45"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/pull/twitter >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# extract tweets from webpages twice per day

cron "socialmedia_extract_twitter" do
  minute "0"
  hour "0,12"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/webpage/extract/twitter >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# pull facebook content from social seeds every 1 hour

cron "socialmedia_pull_facebook" do
  minute "5"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/pull/facebook >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# process ngrams every 10 minutes
cron "socialmedia_process_ngrams" do
  minute "0,10,20,30,40,50"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/process/ngrams >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# process sentiment every 10 minutes

cron "socialmedia_process_sentiment" do
  minute "5,15,25,35,45,55"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/process/sentiment >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# update social media locations every 15 mins

cron "socialmedia_update_locations" do
  minute "0,15,30,45"
  hour "*"
  day "*"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/update/locations >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# update district related social media every week

cron "socialmedia_update_district_related" do
  minute "0"
  hour "*"
  day "0,7,14,21,28"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/update/district-related >/dev/null 2>&1"
end

# ----------------------------------------------------------------------------------------------------------------------

# update social media without seeds every week

cron "socialmedia_update_seeds" do
  minute "0"
  hour "*"
  day "0,7,14,21,28"
  command "wget -O - http://127.0.0.1:3000/data/socialmedia/update/seeds >/dev/null 2>&1"
end