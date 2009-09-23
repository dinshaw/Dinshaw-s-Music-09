require 'enumerator'
module ApplicationHelper

  def page_title
    [h(SITE_NAME),"|",@cms_page.title].join(" ")
  end
  
  # output meta description or resuce with nil if no page is set
  def meta_description
    @cms_page.meta_description.blank? ? "Web application development in New York" : @cms_page.meta_description
  end
 
  # output meta keywords tag or resuce with nil if no page is set
  def meta_keywords
    @cms_page.meta_keyword.blank? ? "New York (NY) Web Development, Custom ecommerce development, Web Application Development" : @cms_page.meta_keyword
  end
  
  # write the tag for both meta_description and meta_keywords
  def meta(name, content)
    %(<meta name="#{name}" content="#{content}" />)
  end

  def is(value)
    value ? "Yes" : "No"
  end


end


