class SongSweeper < ActionController::Caching::Sweeper
  observe Song

  def after_save(song)
    expire_cache(song)
  end

  def after_destroy(song)
    expire_cache(song)
  end

  private

  def expire_cache(song)
    expire_page songs_path 
    expire_page song_path(song)
  end

end