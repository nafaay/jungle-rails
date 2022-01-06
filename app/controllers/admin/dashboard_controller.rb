class Admin::DashboardController < ApplicationController
  # Add basic authentication
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  # Add number of products and number of categories
  def show # Show them from database
    @product_count = Product.count
    @category_count = Category.count
  end

end