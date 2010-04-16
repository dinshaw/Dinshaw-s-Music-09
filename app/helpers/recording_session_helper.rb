module RecordingSessionHelper
  def description_html_for_index(recording_session)
    truncate recording_session.description, 200
  end

end
