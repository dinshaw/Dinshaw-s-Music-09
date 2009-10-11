require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should_not_allow_values_for :email, "blah", "b lah" 
  should_allow_values_for :email, "a@b.com", "asdf@asdf.com" 
  should_not_allow_values_for :url, "asd", "asd.asd" 
  should_allow_values_for :url, "http://asd.com", "https://www.asd.com"  

  # context 'validation' do
  #   setup do
  #     @comment = Comment.new
  #   end
  # end


end
