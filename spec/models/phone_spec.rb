require 'spec_helper'

describe Phone do
  pending "add some examples to (or delete) #{__FILE__}"

  it "allows to share a phone number" do |variable|
    expect(create(:phone,:phone_number => "111-222-33-22",:author_attributes=> FactoryGirl.build(:author).attributes)).to be_valid
  end
end
