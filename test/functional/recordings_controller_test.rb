require 'test_helper'

class RecordingsControllerTest < ActionController::TestCase
  context 'index' do
    setup do
      2.times do
        song = Song.make
        song.recordings.make
      end
    end
    context '#index.xml' do
      setup do
        get :index, :format => :xml
      end
      should_render_template 'index.xml.builder'
      should_assign_to :recordings
    end
    context '#index.rss' do
      setup do
        get :index, :format => :rss
      end

      should_respond_with :success
      should_render_template 'index.rss.builder'
      should_respond_with_content_type /rss/
      should_assign_to :recordings
      
      should 'have two items' do
        doc = Nokogiri::XML(@controller.response.body)
        assert_equal Recording.count, doc.xpath('//item').size
      end
    end
  end
end