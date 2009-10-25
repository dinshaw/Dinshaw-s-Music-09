class GigSweeper < ActionController::Caching::Sweeper
  observe Gig

  def after_save(gig)
    expire_cache(gig)
  end

  def after_destroy(gig)
    expire_cache(gig)
  end

  private

  def expire_cache(gig)
    expire_page gigs_path 
    expire_page gig_path(gig)
    expire_page '/index'
  end

end