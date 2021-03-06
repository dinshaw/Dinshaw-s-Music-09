When /^I press "([^\"]*)"$/ do |button|
  $browser.button(:text, button).click
  assert_successful_response
end

When /^I follow "([^\"]*)"$/ do |link|
  $browser.link(:text, /#{link}/).click
  assert_successful_response
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  # check for an element matching...
  # label tag content
  if $browser.label(:text, /#{field}/i).exists?
    html_id = $browser.label(:text, /#{field}/i).for

  # name= atribute
  elsif $browser.text_field(:name, /#{field}/i).exists?
    html_id = $browser.text_field(:name, /#{field}/i).attribute_value(:id)

  else
    # or jsut return and hope an id= works
    # if this doesn't, then we want the exception to raise
    html_id = field
  end

  $browser.text_field(:id, html_id).value = value
end

When /^I check "([^\"]*)"$/ do |field|
  $browser.check_box(:id, find_label(field).for).set(true)
end

When /^I uncheck "([^\"]*)"$$/ do |field|
  $browser.check_box(:id, find_label(field).for).set(false)
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  $browser.select_list(:id, find_label(field).for).select value
end

When /^I choose "([^\"]*)"$/ do |field|
  $browser.radio(:id, find_label(field).for).set(true)
end

When /^I go to "([^\"]*)"$/ do |path|
  $browser.goto @host + path_to(path)
  assert_successful_response
end

When /^I should be on "([^\"]*)"$/ do |page_name|
  $browser.url.should =~ /#{path_to(page_name)}/
end

When /^I wait$/ do
  $browser.wait  
end

Then /^I should see "([^\"]*)"$/ do |text|
  # if we simply check for the browser.html content we don't find content that has been added dynamically, e.g. after an ajax call
  div = $browser.div(:text, /#{text}/)
  begin
    div.html
  rescue
    #puts $browser.html
    raise("div with '#{text}' not found")
  end
end

Then /^"([^\"]*)" with "([^\"]*)" "([^\"]*)" should be visible$/ do |element, attribute, value|
  $browser.send(element, attribute, value).visible?.should be_true
end

Then /^"([^\"]*)" with "([^\"]*)" "([^\"]*)" should not be visible$/ do |element, attribute, value|
  $browser.send(element, attribute, value).visible?.should be_false
end

Then /^I should not see "([^\"]*)"$/ do |text|
  div = $browser.div(:text, /#{text}/).html rescue nil
  div.should be_nil
end

def find_label(text)
  $browser.label :text, text
end

def assert_successful_response
  status = $browser.page.web_response.status_code
  if(status == 302 || status == 301)
    location = $browser.page.web_response.get_response_header_value('Location')
    puts "Being redirected to #{location}"
    $browser.goto location
    assert_successful_response
  elsif status != 200
    tmp = Tempfile.new 'culerity_results'
    tmp << $browser.html
    tmp.close
    `open -a /Applications/Safari.app #{tmp.path}`
    raise "Brower returned Response Code #{$browser.page.web_response.status_code}"
  end
end

Then /^I debug$/ do
  debugger
  0
end
