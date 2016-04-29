# Setup cron jobs on Opsworks instances.
# - http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-extend-cron.html
# - http://www.nncron.ru/help/EN/working/cron-format.htm

# ----------------------------------------------------------------------------------------------------------------------

# perform batch analysis at start of each month

cron "analysis_batch" do
  minute "0"
  hour "0"
  day "1,2,3,4,5"
  command "wget -O - http://127.0.0.1:3000/data/analysis/batch >/dev/null 2>&1"
end