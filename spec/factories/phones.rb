# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    association :author
    sequence(:phone_number) {|n| "111-111-222-#{n}"}
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
