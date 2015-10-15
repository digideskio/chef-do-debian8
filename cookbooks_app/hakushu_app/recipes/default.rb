#
# Cookbook Name:: hakushu_app
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

::Chef::Recipe.send(:include, ::Hakushu::Helper)

# hakushu_app::default
puts "HELLO WORLD!"

execute 'APT UPDATE' do
  user 'root'
  command 'apt-get update -y'
end

execute 'INSTALL COMMON PACKS' do
  user 'root'
  command 'apt-get install build-essential dialog checkinstall bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxslt1.1 libxslt1-dev libxml2 libxml2-dev libxslt-dev autoconf libc6-dev -y'
end

# execute "INSTALL MYSQL" do
#   db_pass = node['hakushu']['db_user_password']

#   user 'root'
#   command ::Hakushu::Helper.wrap_and [
#     'export DEBIAN_FRONTEND=noninteractive',

#     "debconf-set-selections <<< 'mysql-server mysql-server/root_password password #{ db_pass }'",
#     "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password #{ db_pass }'",

#     'apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev ruby-mysql -y'
#   ]

#   returns [0, 2]
# end

# execute 'INSTALL IMAGE MAGICK' do
#   user 'root'
#   command 'apt-get install imagemagick libmagickwand-dev -y'
# end

# execute 'INSTALL REDIS' do
#   user 'root'

#   command "apt-get install redis-server -y"
# end

# execute 'INSTALL NODEJS' do
#   user 'root'

#   command "apt-get install nodejs -y"
# end

# execute 'INSTALL PSQL' do
#   user 'root'

#   command "apt-get install postgresql postgresql-client postgresql-contrib libpq-dev postgresql-server-dev-9.4 pgadmin3 -y"
# end

# execute 'SOFT CHECK LIST' do
#   user 'root'

#   command ::Hakushu::Helper.wrap_and [
#     'cd ~',
#     'wget https://raw.githubusercontent.com/TheDeployOnRails/TheRailsDeploy/master/check_soft.sh',
#     'chmod 744 ./check_soft.sh',
#     './check_soft.sh'
#   ]
# end

# execute 'APT UPGRADE' do
#   user 'root'
#   command ::Hakushu::Helper.wrap_and [
#     'apt-get upgrade -y',
#     'apt-get install -f -y'
#   ]
# end
