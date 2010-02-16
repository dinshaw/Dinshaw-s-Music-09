namespace 'bitly' do
  desc "Generate bit.ly urls for all pages"
  task :generate => :environment do
    include ActionController::UrlWriter    
    Song.all.each do |song|
      song.update_attribute :bitly, Bitly.new(BITLY_USER, BITLY_API_KEY).shorten(song_url(song)).short_url
    end
  end
end