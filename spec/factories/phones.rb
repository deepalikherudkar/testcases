# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :phone do
    #association :author
    #faker gem used to generate real data
    phone_number {Faker::PhoneNumber.phone_number}

    #sequence(:phone_number) {|n| "111-111-222-#{n}"}
    phone_type "home"
  end

  factory :home_phone do
    phone_type "home"
  end

  factory :work_phone do
    phone_type "work"
  end

  factory :mobile_phone do
    phone_type "mobile"
  end
end
