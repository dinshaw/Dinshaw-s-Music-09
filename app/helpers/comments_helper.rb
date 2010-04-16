module CommentsHelper
  def url_html_for_index(comment)
    link_to(comment.url, comment.url, :class => :external) if !comment.url.blank?
  end
end
