class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :sold_item

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = 'sk_test_69d4c37c66fa9220ffbae7bf'
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :other, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id
  end

  def sold_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end
end
