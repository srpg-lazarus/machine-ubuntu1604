package 'mysql-server'

execute 'mysql permission' do
  command <<-EOL
    chown mysql:mysql /var/log/mysqld.log
    chown -R mysql:mysql /var/lib/mysql
  EOL
end

execute 'mysql secure' do
  user "root"
  command <<-EOL
    mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
    mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
    mysql -u root -e "DROP DATABASE test;"
    mysql -u root -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
  EOL
end

execute 'mysql create database' do
  user "root"
  not_if "mysql -u root -e 'show databases' | grep portal_main"
  command <<-EOL
    mysql -u root -e "CREATE DATABASE portal_main CHARACTER SET utf8;"
  EOL
end
