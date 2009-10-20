class Admin::RolesController < AdminController
  admin_assistant_for Role do |aa|
    aa.form do |form|
      form.columns :name
    end

    aa.index do |index|
      index.columns :name, :authorizable
    end
  end
end