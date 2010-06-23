
def create_user(u)
  user u do
    home "/home/#{u}"
  end

  directory "/home/#{u}" do
    owner u
    group u
    mode "0755"
  end

  directory "/home/#{u}/.ssh" do
    owner u
    group u
    mode '0700'
  end  

  remote_file "/home/#{u}/.ssh/authorized_keys2" do
    source "authorized_keys2.#{u}"
    owner u
    group u
    mode '0600'
  end
end

create_user 'mike'
