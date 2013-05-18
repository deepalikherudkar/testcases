require 'spec_helper'

describe "Author" do |variable|
describe "specs with build" do |variable|
  it "has a valid factory" do |variable|
    expect(FactoryGirl.build(:author)).to be_valid
  end
end
  it "allows to create new author" do |variable|
    create(:author,:name => "dipu")
  end

  it "is invalid without name" do |variable|
    expect(FactoryGirl.build(:author,:name=> nil)).to have(1).errors_on(:name)
  end

  it "is invalid with duplicate name" do |variable|
    author1 = FactoryGirl.create(:author,:name=> "author1")
    expect(FactoryGirl.build(:author,:name=> author1.name)).to have(1).errors_on(:name)
  end
end