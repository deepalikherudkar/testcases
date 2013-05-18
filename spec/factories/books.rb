# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :book do

    #faker gem used to generate real data
    title {Faker::Name.title}

    #sequence(:title) {|n| "Let Learn C #{n}"}
  end
end
