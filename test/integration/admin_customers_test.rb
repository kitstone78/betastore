require 'test_helper'

class AdminCustomersTest < ActionDispatch::IntegrationTest

def test_create_customer
  visit "/admin/customers"
  click_on "Add New Customer"
  fill_in "Name", with: 'Ricky Ricardo'
  fill_in "Email", with: 'test@one.net'
  fill_in "State", with: 'CA'
  fill_in "Zip code", with: '55555'
  click_on "Create Customer"
  customer_id = Customer.last.id
  assert page.has_content?("Customer #{customer_id} was created")
  click_on "Edit Customer"
  fill_in "Email", with: 'rick@ricardo.com'
  assert_equal 'rick@ricardo.com', 'rick@ricardo.com'
  click_on "Update Customer"
  assert page.has_content?("Customer #{Customer.last.name} was updated successfully")
  click_on "#{customer_id}"
  click_on "Delete customer"
  page.has_content?("Customer #{customer_id}")
  refute page.has_content?('Ricky Ricardo')
end

end