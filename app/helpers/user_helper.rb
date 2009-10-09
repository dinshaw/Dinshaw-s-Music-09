module UserHelper
  def created_at_html_for_index(user)
    user.created_at.to_s(:short)
  end
end