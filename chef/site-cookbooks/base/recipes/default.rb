user 'mike' do
  home '/home/mike'
end

cookbook_file '/home/mike/.ssh/authorized_keys2' do
  source 'authorized_keys2'
  owner 'mike'
  group 'mike'
  mode '0600'
end
