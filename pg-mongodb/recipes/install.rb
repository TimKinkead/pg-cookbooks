# Install MongoDB on Amazon Linux EC2 Instance
# - http://docs.mongodb.org/manual/tutorial/install-mongodb-on-amazon/

# ----------------------------------------------------------------------------------------------------------------------

# create the repo directory
# - https://docs.chef.io/resource_directory.html

directory "/etc/yum.repos.d" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# ----------------------------------------------------------------------------------------------------------------------

# create the repo file (from ../templates/default/<source>)
# - https://docs.chef.io/resource_file.html
# - https://docs.chef.io/resource_template.html

template "/etc/yum.repos.d/mongodb-org-3.2.repo" do
    source "install_mongodb-org-3.2.repo.erb"
	owner 'root'
    group 'root'
    mode '0775'
end

# ----------------------------------------------------------------------------------------------------------------------

# install mongodb yum package from repo
# - https://docs.chef.io/resource_yum.html

yum_package "mongodb-org" do
    action :install
end