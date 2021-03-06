require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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
    scenario "Cart changes when product is added" do
      # ACT
      visit root_path

      first('').click
      # DEBUG
      save_screenshot
  
      # VERIFY
      expect(page).to have_css 'article.product'
    end

end