require 'spec_helper'

RSpec.describe 'User Events', type: :feature do
  before :each do
    if !User.first.nil?
      @user = User.first
    else
      @user = User.create(email: 'test@test.com', name: 'Potato')
      @user.save
    end
  end

  it 'creates new event' do
    visit '/sessions/new'
    fill_in 'email', with: @user.email
    click_button 'Login'
    visit '/events/new'
    fill_in 'Title', with: 'This Event'
    within '.date-of-event' do
      find("option[value='2021']").select_option
      find("option[value='1']", text: '1').select_option
      find("option[value='1']", text: '1').select_option
    end
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content 'This Event'
  end

  it 'changes the attendance of event' do
    @event = Event.first
    visit '/sessions/new'
    fill_in 'email', with: @user.email
    click_button 'Login'
    visit event_path(@event.id)
    if page.has_selector?(:link_or_button, 'Attend')
      click_on 'Attend'
      expect(page).to have_content @user.email
    else
      click_on 'Withdraw'
      expect(page).to_not have_content @user.email
    end
  end
end
