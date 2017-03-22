execute "for node v6" do
  command "curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -"
end

package "nodejs"

execute "nodejs > node" do
  user "root"
  command "update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10"
end

