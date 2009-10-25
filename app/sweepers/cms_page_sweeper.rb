class CmsPageSweeper < ActionController::Caching::Sweeper
  observe CmsPage

  def after_save(cms_page)
    expire_cache(cms_page)
  end

  def after_destroy(cms_page)
    expire_cache(cms_page)
  end

  private
  def expire_cache(cms_page)
    case cms_page.reference_string
    when /privacy/i
      expire_page '/privacy'
    when /contact/i
      expire_page '/contact'
    when /unsubscribe/i
      expire_page '/unsubscribe'
    end

  end
end
