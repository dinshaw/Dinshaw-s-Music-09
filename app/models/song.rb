class Song < ActiveRecord::Base
  include ActionController::UrlWriter 
  after_create :shorten_url
  
  has_friendly_id :title, :use_slug => true
  
  has_many :recordings
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  validates_presence_of :title
  validates_presence_of :lyrics
  validates_presence_of :composition_date
  validates_presence_of :composition_location
  
  default_scope :order => :title
  
  private
  def shorten_url
    update_attribute :bitly, Bitly.new(BITLY_USER, BITLY_API_KEY).shorten(song_url(self, :host => "http://#{BASE_DOMAIN}")).short_url
  end
end
