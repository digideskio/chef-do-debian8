brew cask install virtualbox
brew cask install vagrant

vagrant plugin install vagrant-librarian-chef-nochef
vagrant plugin install vagrant-vbguest

vagrant up

vagrant ssh

(librarian-chef update && vagrant provision)

vagrant vbguest --status

vagrant vbguest --do start
vagrant vbguest --do install
vagrant vbguest --do rebuild

vagrant destroy -f
