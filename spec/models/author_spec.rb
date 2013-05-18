require 'spec_helper'

describe "Author" do |variable|
describe "specs with build" do |variable|
  it "has a valid factory" do |variable|
    expect(FactoryGirl.build(:author)).to be_valid
  end
end
  it "allows to create new author" do |variable|
    FactoryGirl.create(:author,:name => "dipu")
  end

  it "is invalid without name" do |variable|
    FactoryGirl.build(:author,{:name=> nil}).should have(1).errors_on(:name)
  end

  it "is invalid with duplicate name" do |variable|
    author1 = FactoryGirl.create(:author)
    expect(FactoryGirl.build(:author,:name=> author1.name)).should have(1).errors_on(:name)
  end
end