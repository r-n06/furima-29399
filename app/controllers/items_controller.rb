class ItemsController < ApplicationController
  def index
    #@items = Item.all.order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :status_id, :postage_payer_id, :shipping_area_id, :shipment_day_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end
end
