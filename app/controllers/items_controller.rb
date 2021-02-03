class ItemsController < ApplicationController
  before_action :item_user, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :cheak_user, only: [:edit]
  
  def index
    @items = Item.all.order("created_at DESC")
  end
    
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end

def move_to_index
  unless  user_signed_in?
    redirect_to action: :index
  end
end

def cheak_user
  unless  current_user == @item.user#今現在ログインしてるユーザーが出品者じゃなければ
    redirect_to action: :index
  end
end

def item_user
@item = Item.find(params[:id])
end

