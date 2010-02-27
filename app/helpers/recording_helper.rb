module RecordingHelper
  def song_html_for_index(recording)
    link_to(recording.song.title, admin_song_path(recording.song)) rescue 'N/A'
  end

  def in_player_rotation_html_for_index(recording)
    is(recording.in_player_rotation)
  end
end

class AdminAssistant
  class PaperclipColumn < Column
    class IndexView < View
      def html(record)
        ''
      end
    end
  end
end