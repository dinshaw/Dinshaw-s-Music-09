require 'test_helper'

class RecordingsControllerTest < ActionController::TestCase
  context '#index.xml' do
    setup do
      get :index, :format => :xml
    end
    
    should_render_template 'index.xml.builder'
    should_assign_to :recordings
  end
end
