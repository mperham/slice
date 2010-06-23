
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

  cookbook_file "/home/#{u}/.ssh/authorized_keys2" do
    source "authorized_keys2.#{u}"
    owner u
    group u
    mode '0600'
  end
  
  ruby_block "sudo for #{u}" do
    block do
      File.open("/etc/sudoers.d/#{u}") do |f|
        f.write("#{u} ALL=(ALL) NOPASSWD: ALL")
      end
    end
    only_if { !File.exist?("/etc/sudoers.d/#{u}"
  end
end

create_user 'mike'
