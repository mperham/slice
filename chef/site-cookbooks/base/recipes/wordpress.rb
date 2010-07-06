include_recipe 'wordpress'

file '/etc/apache2/sites-enabled/000-default' do
  action :delete
end

cookbook_file '/etc/apache2/sites-available/wordpress.conf'

# link '/etc/apache2/sites-enabled/wordpress' do
#   to '/etc/apache2/sites-available/wordpress.conf'
# end