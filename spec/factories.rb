FactoryBot.define do
  factory :transaction do
    account nil
    amount 1.5
  end
  factory :account do
    user nil
    bank nil
    account_no "MyString"
    balance 1.5
  end
  factory :address do
    house_number "MyString"
    floor_no "MyString"
    building_name "MyString"
    street_no "MyString"
    landmark "MyString"
    area "MyString"
    state "MyString"
    city "MyString"
    pin_code "MyString"
    user nil
    permanent false
  end
  factory :profile do
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    mobile_no "MyString"
    user nil
  end
  factory :beneficiary do
    name "MyString"
    user nil
  end
  factory :bank do
    name "MyString"
  end
  
  # factory :user do
  #   username "Joe"
  #   email "joe@gmail.com"
  #   password "blah"
  # end

  # factory :admin, class: User do
  #   first_name { "Admin" }
  #   last_name { "User" }
  #   admin { true }
  # end

end