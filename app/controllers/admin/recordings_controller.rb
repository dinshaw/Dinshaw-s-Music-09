class Admin::RecordingsController < AdminController
  admin_assistant_for Recording do |a|
    a.actions << :destroy
    a.form do |form|
    end
  end
end
