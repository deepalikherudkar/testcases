FactoryGirl.define do
  factory :author do |variable|
    sequence(:name) {|n| "author #{n}"}
  end

end