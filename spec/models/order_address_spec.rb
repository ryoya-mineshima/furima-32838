require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.1
    @order_address = FactoryBot.build(:order_address, user_id: user, item_id: item)
  end

  describe "商品購入" do
    context "商品の購入ができる時" do
      it "全ての値が正しく入力されていれば購入できること" do
        expect(@order_address).to be_valid
      end
    end

    context "商品購入がうまくいかない時" do
      it "post_cordが空だと購入できない" do
        @order_address.post_cord = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post cord can't be blank")
      end

      it "post_cordにハイフンがないと購入できない" do
        @order_address.post_cord = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post cord is invalid. Include hyphen(-)")
      end

      it "prefecture_idが未選択だと購入できない" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空だと購入できない" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it "buildingが空でも購入できること" do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end

      it "phone_numberが空だと購入できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが12桁では購入できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが英数混合では購入できない" do
        @order_address.phone_number = "0901234abcd"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
