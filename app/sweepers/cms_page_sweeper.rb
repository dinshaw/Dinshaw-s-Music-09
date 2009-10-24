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
    expire_page cms_pages_path 
    expire_page cms_page_path(cms_page)
  end
end
