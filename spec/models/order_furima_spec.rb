require 'rails_helper'

RSpec.describe OrderFurima, type: :model do
  before do
    @user = FactoryBot.create(:user)  
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order = FactoryBot.create(:user)
    sleep(0.1)
    @order_furima = FactoryBot.build(:order_furima, item_id: @item.id, user_id: @order.id)
  end

  describe '商品の購入' do
    context '購入ができた時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_furima).to be_valid
      end
    end
    context '購入ができなかった時' do
      it 'tokenが空では登録できないこと' do
        @order_furima.token = nil
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order_furima.postal_code = ''
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_idが空では登録できない' do
        @order_furima.area_id = ''
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipaltyが空では登録できない' do
        @order_furima.municipalty = ''
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Municipalty can't be blank")
      end
      it 'adressが空だと登録できない' do
        @order_furima.adress = ''
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Adress can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_furima.phone_number = ''
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'area_idが0だと登録できない' do
        @order_furima.area_id = 0
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Area must be other than 0")
      end
      it 'postal_codeにハイフンがなければ登録できない' do
        @order_furima.postal_code = "1234567"
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Postal code Postal code Input correctly")
      end
      it 'phone_numberにハイフンがあると登録できない' do
        @order_furima.phone_number = '090-1234-5678'
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Phone number Phone number Input only number")
      end
      it 'phone_numberが11桁以下でないと登録できない' do
        @order_furima.phone_number = '090123456789'
        @order_furima.valid?
        expect(@order_furima.errors.full_messages).to include("Phone number Phone number Input only number")
      end
    end
  end
end
