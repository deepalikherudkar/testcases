require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "add new" do |variable|
    it "should create new user" do |variable|
      expect {FactoryGirl.create(:user)}.should change(User, :count).by(1)
    end
  end
end
