package "php"
package "php-fpm"
package "php-mcrypt"
package "php-mysql"
package "php-redis"

service "php7.0-fpm" do
  action :restart
end
