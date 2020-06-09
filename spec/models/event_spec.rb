require 'rails_helper'

RSpec.describe Event, type: :model do
  it "should not save without title" do
    event = Event.new(:date => Time.current)
    expect(event).to_not be_valid
  end

  it "should not save without date" do
    event = Event.new(:title => "Title")
    expect(event).to_not be_valid
  end

  context "with all validations passed" do
    before(:each) do
      @user = User.new(:name => "Potato", :email => "pot@ato.com")
      @event = Event.new(:title => "Potato", :date => Time.current, :creator => @user)
    end

    it "should save with all validations provided" do
      expect(@event).to be_valid
    end

    it "should return user as Creator" do
      expect(@event.creator).to eq @user
    end
  end
end
