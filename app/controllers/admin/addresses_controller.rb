class Admin::AddressesController < AdminController
  admin_assistant_for Address do |a|
    a.form do |form|
      a[:addressable].polymorphic_types = [Venue, User]  
    end
    a.index do |index|
      index.columns :street, :street_2, :city, :state, :zip, :country, :addressable
    end
  end
end
