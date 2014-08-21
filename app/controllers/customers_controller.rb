class CustomersController < ApplicationController
def index
    @customers = Customer.order('name').where('name like ?', 'test%')
  end

  def show 
    @customers = Customer.find(params[:id])
  end

  def show
    @customers =Customer.edit(params[:id])
  end
end