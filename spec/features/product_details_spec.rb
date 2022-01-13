require 'rails_helper'

RSpec.feature "Visitor sees product details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The product details:" do
    # ACT
    visit root_path
    first('footer button').click
    # DEBUG
    #expect(page).to have_css 'section.products-show'
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end