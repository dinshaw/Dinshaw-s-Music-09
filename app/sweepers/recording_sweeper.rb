class RecordingSweeper < ActionController::Caching::Sweeper
  observe Recording

  def after_save(recording)
    expire_cache(recording)
  end

  def after_destroy(recording)
    expire_cache(recording)
  end

  private

    def expire_cache(recording)
      expire_page '/recordings/for_player.xml'
      expire_page recording_path(recording)
      expire_page song_path(recording.song)
      expire_page songs_path
    end

end
