class Admin::VenuesController < AdminController
 admin_assistant_for Venue do |aa|
   aa.actions << :destroy      
   aa.form do |form|
     form.columns :name, :location, :url, :description, :directions
     form[:description ].text_area_options = {:rows => 5}    
     form[:directions ].text_area_options = {:rows => 5}         
   end
   aa.index do |index|
     index.columns :name, :location, :url
   end
 end
 
 def show
  @venue = Venue.find(params[:id])
 end
end
