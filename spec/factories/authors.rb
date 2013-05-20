require 'faker'

FactoryGirl.define do
  factory :author do |variable|

    #faker gem used to generate real data
    name {Faker::Name.name}
    #sequence(:name) {|n| "author #{n}"}

    after(:build) do |author|
      [:home_phone, :mobile_phone,:office_phone].each do |phone|
        author.phones << FactoryGirl.build(:phone,:phone_type => phone)
        #p author.phones
      end
    end
  end

  factory :invalid_author do
    name nil
  end
end