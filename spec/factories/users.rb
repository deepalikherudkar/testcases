# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "asd123"
    password_confirmation "asd123"
  end
end
