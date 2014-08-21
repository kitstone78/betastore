class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.order('name')
  end

  def create
    @customer = Customer.new(customer.param)
  if @customer.save
    redirect_to admin_customer_path(@customer), notice: "Customer #{@customer.id} was created"
  else
    render 'new'
    end
  end

  def show
   @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end 

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer.param)
    redirect_to admin_customers_path(@customer), notice: "Customer #{@customer.name} was updated successfully"
  else
    render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path, notice: "Customer #{@customer.id} was deleted}"
  end

  private

  def product_params
  params.require(:product).permit(:email, :password)
  end

end