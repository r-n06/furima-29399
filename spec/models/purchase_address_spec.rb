require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    it '全ての値が正しく入力されていると購入できること' do
      expect(@purchase_address).to be_valid
    end
    it 'post_codeが空だと購入できないこと' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角ハイフンを含んだ正しい形式でないと購入できない' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
    end
    it 'post_codeが全角だと購入できないこと' do
      @purchase_address.post_code = '１２３４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
    end
    it 'cityが空だと購入できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'prefectureが選択されていないと購入できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'otherが空だと購入できないこと' do
      @purchase_address.other = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Other can't be blank")
    end
    it 'building_nameが空でも購入できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが空だと購入できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンが含まれていると購入できないこと' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが全角だと購入できないこと' do
      @purchase_address.phone_number = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'カード情報がtoken化されていないと購入できない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it '紐づくitemがないと購入できない' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it '紐づくuserがないと購入できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
  end
end
