include_recipe 'wordpress'

file '/etc/apache2/sites-enabled/000-default' do
  action :delete
end

cookbook_file '/etc/apache2/sites-available/wordpress.conf'

# link '/etc/apache2/sites-enabled/wordpress' do
#   to '/etc/apache2/sites-available/wordpress.conf'
# end



%w(perham mikeperham).each do |db|
  execute "create-database-#{db}" do
    command "/usr/bin/mysqladmin -u root -ppassword create database if not exists #{db}"
  end
end