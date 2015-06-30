 
require ::File.expand_path('../config/environment',  __FILE__)
 
use Rack::ReverseProxy do
  reverse_proxy /^\/blog(\/.*)$/, 'http://harvestprofit.flywheelsites.com', :username => 'flywheel', :password => 'melted-juice', :timeout => 500, :preserve_host => true
end
 
#run Boulder::Application
run Rails.application
