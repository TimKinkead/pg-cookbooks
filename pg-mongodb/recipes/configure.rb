# Configure MongoDB on Amazon Linux EC2 Instance
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-amazon/

# ----------------------------------------------------------------------------------------------------------------------

# create custom mongod config file (from ../templates/default/<source>)
# - variables pulled from 'node' (stack json) or attributes/default.rb
# - https://doc.mongodb.org/manual/reference/configuration-options/

template "/etc/mongod.conf" do
    source "config_mongod.conf.erb"
	#owner 'root'
    #group 'root'
    owner 'mongod'
    group 'mongod'
    mode '0775'
    variables ({
        :dbpath => node["mongodb"]["config"]["dbpath"],
        :logpath => node["mongodb"]["config"]["logpath"],
        :replSet => node["mongodb"]["config"]["replSet"]
    })
end

# ----------------------------------------------------------------------------------------------------------------------

# give mongod permission to files
# - data & log directories (everything in /srv/mongodb)
# - http://stackoverflow.com/questions/7948789/mongodb-mongod-complains-that-there-is-no-data-db-folder

execute "mongod_permission" do
    command "sudo chown -R mongod:mongod /srv/mongodb"
    command "sudo chown mongod:mongod /var/run/mongodb/mongod.pid"
end

# ----------------------------------------------------------------------------------------------------------------------

# edit Transparent Huge Pages (THP) Settings
# - get rid of mongod startup warning
# - http://docs.mongodb.org/manual/reference/transparent-huge-pages/#transparent-huge-pages-thp-settings

# 1. disable

execute "disable_thp_khugepaged_defrag" do
    command "echo 0 | sudo tee /sys/kernel/mm/transparent_hugepage/khugepaged/defrag" # different b/c file doesn't have options list
end
execute "disable_thp_hugepage_defrag" do
    command "echo 'never > /sys/kernel/mm/transparent_hugepage/defrag' | sudo tee --append /sys/kernel/mm/transparent_hugepage/defrag"
end
execute "disable_thp_hugepage_enables" do
    command "echo 'never > /sys/kernel/mm/transparent_hugepage/enabled' | sudo tee --append /sys/kernel/mm/transparent_hugepage/enabled"
end

# 2. verify disabled on reboot

template "/etc/rc.local" do
    source "startup_rc.local.erb"
    owner 'root'
    group 'root'
    mode '0775'
end

# ----------------------------------------------------------------------------------------------------------------------

# create upstart config file to start mongod (from ../templates/default/<source>)
# - use upstart (/etc/init) instead of default system v (/etc/init.d)

template "/etc/init/mongod.conf" do
    source "upstart_mongod.conf.erb"
	owner 'mongod'
	group 'mongod'
	#owner 'root'
    #group 'root'
    mode '0775'
end

# ----------------------------------------------------------------------------------------------------------------------

# create monit config file for mongod (from ../templates/default/<source>)
# - similar to .monitrc files for node web applications auto-generated by opsworks

template "/etc/monit.d/mongod.monitrc" do
    source "monit_mongod.monitrc.erb"
	owner 'root'
    group 'root'
    mode '0775'
end

# ----------------------------------------------------------------------------------------------------------------------

# reload monit process to initialize mongod.monitrc

execute "monit_reload" do
    #command "sudo monit reload"
    command "monit reload"
end


# TODO: don't run as root!