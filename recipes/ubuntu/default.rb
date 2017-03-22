execute 'apt-get update' do
  user "root"
  command "apt-get update -y"
end

execute 'set timezone' do
  user "root"
  command <<-EOL
    timedatectl set-timezone Asia/Tokyo
  EOL
end

