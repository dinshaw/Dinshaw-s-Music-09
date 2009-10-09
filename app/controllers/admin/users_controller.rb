class Admin::UsersController < AdminController
  admin_assistant_for User do |a|
    a.form do |form|
      form.columns :email
    end
    a.index do |index|
      index.columns :email, :aasm_state, :created_at
    end
    a.show.columns :email, :aasm_state, :created_at
  end
end