require 'enumerator'
module ApplicationHelper

  def page_title
    [h(SITE_NAME),"|",@song.try(:title) || @cms_page.title].join(" ")
  end

  def page_header
    @page_header || case
    when @song
      @song.title
    when @recording_session
      ['Session:',@recording_session.title].join(' ')
    else
      @cms_page.title
    end
  end
  # output meta description or resuce with nil if no page is set
  def meta_description 
    if @song and !@song.new_record?
      "Lyrics and info about #{@song.title} by Dinshaw."
    else
      @cms_page.title.blank? ? "Dinshaw: Original singer songwriter. New York City" : @cms_page.title
    end
  end

  # output meta keywords tag or resuce with nil if no page is set
  def meta_keywords
    if @song and !@song.new_record?
      [@song.title, @song.lyrics, 'Dinshaw'].join(", ")
    else
      @cms_page.meta_keyword.blank? ? "Original music, New York, NYC, Manhattan, Singer, Songwritter, Singer-songwritter, Acoustic Guitar" : @cms_page.meta_keyword
    end
  end
  # write the tag for both meta_description and meta_keywords
  def meta(name, content)
    %(<meta name="#{name}" content="#{content}" />)
  end

  def is(value)
    value ? "Yes" : "No"
  end


  def errors_ul(obj)
    errors = obj.errors.map{|e| content_tag(:li, [e[0].capitalize, e[1]].join(" ")) }
    content_tag(:ul, errors)
  end
end


