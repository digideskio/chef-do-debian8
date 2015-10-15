# hakushu.io

gem install bundler

Gemfile

```
gem install librarian-chef
gem install knife-digital_ocean
```

http://gettingstartedwithchef.com/first-steps-with-chef.html
http://gettingstartedwithchef.com/introducing-chef-server.html
https://github.com/rmoriz/knife-digital_ocean
https://mkdev.me/posts/nastraivaem-servera-i-deploim-prilozheniya-pri-pomoschi-chef

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://downloads.chef.io/chef-dk/mac/

chef -v
  Chef Development Kit Version: 0.9.0
  chef-client version: 12.5.1
  berks version: 4.0.1
  kitchen version: 1.4.2

chef verify

chef generate app hakushu.io
cd hakushu.io
(sudo) mkdir -p .chef
echo '.chef' >> .gitignore

https://manage.chef.io/organizations/hakushu
- Generate Knife config => knife.rb
- Reset validation key  => hakushu-validator.pem

https://id.chef.io/id/signin
user:login
https://id.chef.io/id/profile
- Get New Key => hakushu.pem

mv knife.rb .chef
mv hakushu-validator.pem .chef
mv hakushu.pem .chef

knife cookbook create hakushu_app -o cookbooks_app

gem install librarian-chef
librarian-chef init

```
site "https://supermarket.getchef.com/api/v1"

cookbook "apt"
cookbook "hakushu_app", path: './cookbooks_app/hakushu_app'
```

librarian-chef install

# `knife.rb`
#
# ```
# require 'librarian/chef/integration/knife'
# cookbook_path [ Librarian::Chef.install_path, "#{current_dir}/../cookbooks_app" ]
# ```

# FOR LOCAL MACHINE

# touch solo.rb

# ```
# current_dir = File.expand_path("../", __FILE__)

# file_cache_path "#{current_dir}/chef-solo"
# cookbook_path   "#{current_dir}/cookbooks"
# ```

# touch web.json

# ```
# {
#   "run_list": [ "recipe[hakushu_app]" ]
# }
# ```

librarian-chef update
knife cookbook upload --all
https://manage.chef.io/organizations/hakushu/cookbooks

# knife role create hakushu_app
# knife role list

```ruby
knife[:digital_ocean_client_id]    = 'do_deploy'
knife[:digital_ocean_access_token] = 'e2ae47dce25a1b7622c9276348d2320752826ff3b281e'
```

knife digital_ocean --help

knife digital_ocean account info
knife digital_ocean image list -P
knife digital_ocean region list
knife digital_ocean size list

knife digital_ocean sshkey create -n do_ssh_key -i ~/.ssh/zykin_ilya_rsa.pub

knife digital_ocean sshkey list
  > ID       Name        Fingerprint
  > 1516632  do_ssh_key  51:cb:9a:f8:b1:35:52:b8:f5:c2:96:04:c1:b7:76:49

knife digital_ocean sshkey destroy -i 1516629
knife digital_ocean droplet list

```
knife digital_ocean droplet create \
  --server-name hakushu.io \
  --image debian-8-x64 \
  --location ams3 \
  --size 512mb \
  --ssh-keys 1516632 \
  --run-list "recipe[hakushu_app]" \
  --bootstrap
```

knife status
knife digital_ocean droplet list

```
(librarian-chef update) && \
(knife cookbook upload --all) && \
(knife ssh "name:hakushu.io" "chef-client -l info" -x root -G 188.166.70.248)

ssh root@188.166.70.248
```

# knife digital_ocean droplet list
# knife digital_ocean droplet destroy -S 8177569
# knife client list
# knife client delete hakushu.io -y
