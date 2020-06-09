require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not save without name" do
    user = User.new(:email => "pot@ato.com")
    expect(user).to_not be_valid
  end

  it "should not save without email" do
    user = User.new(:name => "Potato")
    expect(user).to_not be_valid
  end
  it "should save with all validations provided" do
    user = User.new(:name => "Potato", :email => "pot@ato.com")
    expect(user).to be_valid
  end
end
