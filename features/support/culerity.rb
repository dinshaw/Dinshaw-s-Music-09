require 'culerity'

Before do
  $rails_server ||= Culerity::run_rails
  sleep 5
  $server ||= Culerity::run_server
  $browser = Culerity::RemoteBrowserProxy.new $server, {:browser => :firefox}
  @host = 'http://localhost:3001'
  
  [User].each do |model|
    model.delete_all
  end
end

at_exit do
  $browser.exit if $browser
  $server.exit_server if $server
  Process.kill(6, $rails_server.pid.to_i) if $rails_server
end
