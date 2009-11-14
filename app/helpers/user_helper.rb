module UserHelper
  def created_at_html_for_index(user)
    user.created_at.to_s(:short)
  end
  def aasm_state_html_for_index(user)
    [user.aasm_current_state, (user.pending? ? link_to("[resend]", resend_activation_admin_user_path(user)) : nil)].compact.join(" ")
  end
end