require 'spec_helper'

RSpec.describe 'User Events', type: :feature do
  before :each do
    @user = User.create(email: 'pot@ato.com', name: 'Potato')
  end

  it 'creates new event' do
    visit '/sessions/new'
    fill_in 'email', with: 'pot@ato.com'
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
end
