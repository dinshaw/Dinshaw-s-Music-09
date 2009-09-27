class Admin::GigsController < AdminController
 admin_assistant_for Gig do |a|
   a.form do |form|
     form.columns :description, :venue, :time_start, :time_end
     form[:description ].text_area_options = {:rows => 5}
   end
 end
end
