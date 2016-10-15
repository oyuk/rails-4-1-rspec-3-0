require 'rails_helper'

describe Phone do

  it "does not allow duplicate phone numbers per contact" do
    phone_number = '123-456-7890'
    contact = create(:contact)
    create(:home_phone,
      contact: contact,
      phone: phone_number
    )
    mobile_phone = build(:mobile_phone,
      contact: contact,
      phone: phone_number
    )
    mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include('has already been taken')
  end

  it "allows two contacts to share a phone number" do
    phone_number = '123-456-7890'
    create(:home_phone,
      phone: phone_number
    )
    expect(build(:home_phone,
      phone: phone_number
    )).to be_valid
  end

end
