task :warmup_cache => :environment  do
  desc "hit all caches_page pages to warm up cache"
  require RAILS_ROOT+"/vendor/rails/actionpack/lib/action_controller/integration.rb"

  app = ActionController::Integration::Session.new()
  app.host = BASE_DOMAIN

  Song.all.each do |song|
    app.get("/songs/#{song.id}")
    puts "Getting: /songs/#{song.id} and sleeping for 10sec" 
    sleep 10
  end
end