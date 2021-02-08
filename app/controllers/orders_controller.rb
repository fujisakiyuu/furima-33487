class OrdersController < ApplicationController
  before_action :item_user, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    return redirect_to root_path if current_user == @item.user || @item.order.present?
    @user_order = UserOrder.new
  end


  def new
    @user_order = UserOrder.new   
  end 


  
  
  def create
    @user_order = UserOrder.new(user_order_params)   
     if @user_order.valid?
        pay_item
       @user_order.save
       redirect_to root_path
     else
      render :index
     end
    end

  
  private

  def user_order_params
   params.require(:user_order).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number).merge(token: params[:token],item_id: params[:item_id], user_id: current_user.id)
  end

  
  

  def item_user
    @item = Item.find(params[:item_id])
  end

  


  
  def pay_item
 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: @item.price,  
      card: user_order_params[:token],    
      currency: 'jpy'                 
    )
  end
end

