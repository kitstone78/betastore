require 'test_helper'

class AdminProductsTest < ActionDispatch::IntegrationTest

def test_create_product
  visit "/admin/products"
  click_on "Add New Product"
  fill_in "Name", with: 'Millennium Falcon'
  fill_in "Price", with: '34.33'
  click_on "Create Product"
  product_id = Product.last.id
  assert page.has_content?("Product #{product_id} was created")
  click_on "Edit Product"
  fill_in "Price", with: '39.99'
  assert_equal '39.99', '39.99'
  click_on "Update Product"
  page.has_content?("Product #{Product.last.name} was updated successfully")
  click_on "Millennium Falcon"
  click_on "Delete product"
  page.has_content?("Product #{product_id} was deleted")
  refute page.has_content?('Millennium Falcon')
end

end