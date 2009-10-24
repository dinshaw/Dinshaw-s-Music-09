require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  context 'page_header' do
    context 'with CmsPage' do
      setup do
        @cms_page = CmsPage.make
      end
      should 'return the cms_page title' do
        assert_equal page_header, @cms_page.title
      end
    end
    context 'with song' do
      setup do
        @cms_page = CmsPage.make
        @song = Song.make        
      end
      should 'return the cms_page title' do
        assert_equal page_header, @song.title
      end
    end
    context 'with override' do
      setup do
        @cms_page = CmsPage.make
        @song = Song.make        
        @page_header = "This is the header now"
      end
      should 'return the cms_page title' do
        assert_equal page_header, "This is the header now"
      end
    end
  end
end