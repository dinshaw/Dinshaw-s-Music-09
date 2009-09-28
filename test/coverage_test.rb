# Because the application is using Haml for all
# view and partial templates, a typo or indentation
# mistake in these templates will likely raise
# an exception. So in addition to integrated controller
# specs and existing view specs, it's important that
# every view and partial have at least a spec to render
# successfully.  

# require 'find'
# require 'test_helper'
# 
# class AddressTest < ActiveSupport::TestCase
#   context "with HAML for markup" do
#     setup do
#       @test_for_template_spec = lambda do |file|
#         template = file.split('/app/views/')[1]
#         template_exists = File.exist?(File.dirname(__FILE__) + '/' + template.gsub('haml', 'haml_test.rb'))
#         puts "Missing spec for #{template}" unless template_exists
#         assrt_equal template_exists, true
#       end
#     end
# 
#     should "have a view test for each Haml view template in the application" do
#       Dir.glob(File.dirname(__FILE__) + '/../../app/views/**/[^_]*.html.haml').each do |view|
#         @test_for_template_spec.call(view)
#       end
#     end
# 
#     should "have a view test for each Haml partial template in the application" do
#       Dir.glob(File.dirname(__FILE__) + '/../../app/views/**/_*.html.haml').each do |partial|
#         @test_for_template_spec.call(partial)
#       end
#     end
# 
#   end
# end