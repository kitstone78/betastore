require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest

  def test_view_products
    visit "/"
    assert page.has_content?("$1,000.00"),
        'could not find product price'
    click_on "Hat"
    assert page.has_content?("A beautiful handcrafted hat from bangladesh.")
    click_on "Add To Cart"
    assert page.has_content?('Shopping Cart')
    assert page.has_content?('$1,000.00'),
        'could not find product price'
    click_link 'Hat'
    click_on 'Add To Cart'
    assert page.has_content?('$2,000.00')
  end
end