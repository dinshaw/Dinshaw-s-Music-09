class Admin::GigsController < AdminController
 admin_assistant_for Gig do |a|
   a.index do |index|
     index.columns :venue, :description, :time_start, :time_end
   end
   a.form do |form|
     form.columns :description, :venue, :time_start, :time_end
     form[:description ].text_area_options = {:rows => 5}
     form[:time_start].datetime_select_options = {
       :include_blank => false,
       :start_year => 2009,
       :use_short_month => true,
       :start_year => Time.new.year,
       :end_year => 1.year.from_now.year,
       :default => 1.month.from_now
      }
      form[:time_end].datetime_select_options = {
        :include_blank => false,
        :start_year => 2009,
        :use_short_month => true,
        :start_year => Time.new.year,
        :end_year => 1.year.from_now.year,
        :default => 1.month.from_now
       }
   end
 end
end
