class OrdersController < ApplicationController
  before_action :item_user, only: [:new]
  def index
  end

  def new
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)   
     if @user_order.valid?
       @user_order.save
       redirect_to action: :index
     else
       render action: :new
     end
  end


  
  private

 def order_params
  params.require(:user_order).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number)
 end

  def item_user
    @item = Item.find(params[:item_id])
  end
  
end

