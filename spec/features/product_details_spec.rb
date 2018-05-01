require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
  
  # SETUP
  before :each do
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

  scenario "They click to view a product" do
    # ACT
    visit root_path
    # need a new act to click on product
    visit '/products/2'
    # find('article.product').click_link(first)

    # DEBUG
    save_screenshot 'products.png'
    puts page.html

    # VERIFY
    # need a new expect for product visit
    # expect(page).to have_css 'article.product', count: 10
  end

end