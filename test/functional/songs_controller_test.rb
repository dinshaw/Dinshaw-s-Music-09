require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  context 'index' do
    setup do
      2.times do
        song = Song.make
      end
    end
    context '#index.rss' do
      setup do
        get :index, :format => :rss
      end

      should_respond_with :success
      should_render_template 'index.rss.builder'
      should_respond_with_content_type /rss/
      should_assign_to :songs
      
      should 'have two items' do
        doc = Nokogiri::XML(@controller.response.body)
        assert_equal Song.count, doc.xpath('//item').size
      end
    end
  end
end
