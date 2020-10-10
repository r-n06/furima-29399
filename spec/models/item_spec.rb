require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '商品画像と商品名、商品の説明と全てのプルダウンの選択、価格が300円〜9999999円で設定されていれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '新規投稿がうまくできないとき' do
      it '商品画像がなければ投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと投稿できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと投稿できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの選択ができていなければ投稿できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態の選択ができていなければ投稿できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の選択ができていなければ投稿できない' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it '発送元の地域の選択ができていなければ投稿できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数の選択ができていなければ投稿できない' do
        @item.shipment_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment day can't be blank")
      end
      it '価格の情報がないと投稿できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格設定が300円〜9,999,999円でないと投稿できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の入力が半角でないと投稿できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '紐づくユーザーが存在しないと投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
