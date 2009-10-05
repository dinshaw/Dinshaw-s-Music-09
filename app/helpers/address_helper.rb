module AddressHelper
  def full_address(address)
    [
      address.street, 
      address.street_2, 
      address.city, 
      [
        address.state, 
        address.zip
      ].reject(&:blank?).compact.join(" ")
    ].reject(&:blank?).compact.join(", ")
  end
end
