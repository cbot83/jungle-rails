require 'rails_helper'

RSpec.feature "Visitor Adds To Cart", type: :feature, js: true do
    
  # SETUP
  before :each do

    @user = User.create(
      first_name: "First",
      last_name: "User",
      email: "first@user.com",
      password: "password",
      password_confirmation: "password"
    )

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They login and order" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: 'password'
      click_button 'Submit'
      visit root_path
    end

  first('article.product').find_link('Add').click

  visit '/cart'

  first('button.stripe-button-el').click

    within_frame 'stripe_checkout_app' do
      fill_in placeholder: 'Card number', with: '4242424242424242'
      fill_in placeholder: 'MM / YY', with: "01/#{Date.today.year + 1}"
      fill_in placeholder: 'CVC', with: '123'

      click_button 'Pay'

      
    end

    sleep 10

    # DEBUG
    save_screenshot 'cart.png'
    # puts page.html

    # VERIFY
    # need a new expect for product visit
    expect(page).to have_content 'Thank you for your order'
  end
end
