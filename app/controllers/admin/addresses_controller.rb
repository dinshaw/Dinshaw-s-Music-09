class Admin::AddressesController < AdminController
  admin_assistant_for Address do |aa|
    aa.actions << :destroy
    aa[:addressable].polymorphic_types = [Venue, User]  

    aa.form do |form|
      form.columns :street, :street_2, :city, :state, :zip, :country, :addressable
    end

    aa.index do |index|
      index.columns :street, :street_2, :city, :state, :zip, :country, :addressable
    end
  end
end
