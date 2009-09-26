class Admin::AddressesController < AdminController
  admin_assistant_for Address do |a|
    a.form do |form|
      a[:addressable].polymorphic_types = [Venue, User]  
    end
  end
end
