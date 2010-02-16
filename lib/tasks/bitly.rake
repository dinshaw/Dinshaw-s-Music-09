namespace 'bitly' do
  desc "Generate bit.ly urls for all pages"
  task :start => :environment do
    Song.all.each do |song|
      song.update_attribute :bitly, Bitly.new(BITLY_USER, BITLY_API_KEY).shorten(song_url(song))
    end
  end
end