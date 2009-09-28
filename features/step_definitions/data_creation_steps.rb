# data creation
Given /^there are "([^\"]*)" "([^\"]*)" named "([^\"]*)"$/ do |num, items, names|
  case items
  when 'upcoming gigs'
    split_names(names).each do |name| 
      Gig.make(:venue => Venue.make(:name => name))
    end
  end
end

def split_names(names)
  names.split(/and|,/).map{ |name| name.strip if !name.blank? }.compact
end