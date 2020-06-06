class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      reset_session
      log_in @user
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login; end

  def welcome; end

  def destroy
    log_out
    redirect_to '/welcome'
  end
end
