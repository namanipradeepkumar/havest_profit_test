 
require ::File.expand_path('../config/environment',  __FILE__)
 
use Rack::ReverseProxy do
  reverse_proxy /^\/blog(\/.*)$/, 'http://harvestprofit.brilliancetechsols.com', :username => '', :password => '', :timeout => 500, :preserve_host => true
end
 
#run Boulder::Application
run Rails.application
