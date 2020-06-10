require "spec_helper"
RSpec.describe SessionsController, type: :controller do
  include SessionsHelper
    before :each do
       @user = User.create(email: 'pot@ato.com', name: 'Potato')
       session[:user_id] = nil
       get :new
       post :create, params: {email: @user.email}
    end
  
    it "sets current user" do
      expect(current_user.email).to eq @user.email
    end

    it "signs me in" do
      expect(logged_in?).to eq true
    end

  end