%w(autoconf build-essential vim ntp).each do |pkg|
  package pkg do
    action :install
  end
end
