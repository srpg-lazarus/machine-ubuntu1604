package "nginx"

template "/etc/nginx/sites-available/lazarus" do
  user "root"
  source "./templates/lazarus.erb"
  variables(
    root: "/var/www/lazarus-portal",
    server_name: "localhost",
    portal_css: "/var/www/lazarus-portal/static/css/",
    node_pass: "http://127.0.0.1:3000", #末尾の/は取る
    portal_url: "TODO: modify url ex)//ec2-54-199-141-152.ap-northeast-1.compute.amazonaws.com",
  )
end

link "/etc/nginx/sites-enabled/lazarus" do
  user "root"
  to "/etc/nginx/sites-available/lazarus"
end

execute "disable default" do
  user "root"
  command "rm /etc/nginx/sites-enabled/default"
  only_if "ls /etc/nginx/sites-enabled | grep default"
end

service "nginx" do
  user "root"
  action :restart
end
