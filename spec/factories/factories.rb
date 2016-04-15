FactoryGirl.define do
  factory :event do
    date Time.now
    description "A random description"
    name "Name"
    price "Place"
    contact
    venue
    after(:create) { |event| FactoryGirl.create(:flayer, :event_id => event.id) }
  end

  factory :contact do
    email "email@email.org"
    telephone "1234567890"
  end

  factory :venue do
    address_1 "Address 1"
    address_2  "Address 2"
    city "City"
    name "Name"
    state "State"
    telephone "Telephone"
    zip_code "Zip Code"
  end

  factory :flayer do
    path "test.gif"
    height "120"
    width "60"
  end

end