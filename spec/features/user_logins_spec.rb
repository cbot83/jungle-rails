require 'rails_helper'

RSpec.feature "Visitor Logs in", type: :feature, js: true do
    
  # SETUP
  before :each do

    @user = User.create!(
      first_name: "First",
      last_name: "User",
      email: "first@user.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  scenario "They login and order" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: 'password'
      click_button 'Submit'
    end

 

    sleep 10

    # DEBUG
    save_screenshot 'Login.png'
    puts page.html

    end


end
