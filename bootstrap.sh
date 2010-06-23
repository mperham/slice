
# Execute these three lines by hand
#apt-get update -y
#apt-get upgrade -y
#apt-get install -y git-core
# Then:
#git clone git://github.com/mperham/slice.git
#slice/bootstrap.sh

apt-get install -y ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential nginx libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
  --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
            /usr/share/man/man1/ruby1.9.1.1.gz \
  --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
  --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
  --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1
 
update-alternatives --config ruby

gem install chef -v '>= 0.9.0' --no-rdoc --no-ri

# Add /var/lib/gems/1.9.1/bin to /etc/environmnent

/var/lib/gems/1.9.1/bin/chef-solo -s ~/slice/solo.rb -j ~/slice/node.json