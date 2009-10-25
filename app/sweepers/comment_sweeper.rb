class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_save(comment)
    expire_cache(comment)
    expire_cache(comment.song) if comment.respond_to?(:song)
  end

  def after_destroy(comment)
    expire_cache(comment)
    expire_cache(comment.song) if comment.respond_to?(:song)
  end

  private

  def expire_cache(comment)
    expire_page comments_path
    expire_page comment_path(comment)
  end

end
