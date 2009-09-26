class Admin::VenuesController < AdminController
 admin_assistant_for Venue do |a|
   a.form do |form|
     form.columns :name, :location, :description
     form[:description ].text_area_options = {:rows => 5}    
   end
 end
end
