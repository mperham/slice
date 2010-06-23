user 'mike' do
  home '/home/mike'
end

directory '/home/mike/.ssh' do
  owner 'mike'
  group 'mike'
  mode '0700'
end  

remote_file '/home/mike/.ssh/authorized_keys2' do
  owner 'mike'
  group 'mike'
  mode '0600'
end
