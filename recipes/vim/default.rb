package "vim"

file '/home/ubuntu/.vimrc' do
  not_if 'ls /home/ubuntu/ | grep ".vimrc"'
  action :create
  user "ubuntu"
  source "./files/vimrc"
end

