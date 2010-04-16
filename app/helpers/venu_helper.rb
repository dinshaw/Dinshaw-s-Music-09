module VenuHelper
  def url_html_for_index(venue)
    link_to venue.url, venue.url, :class => :external
    
  end
end