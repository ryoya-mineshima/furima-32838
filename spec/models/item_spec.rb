require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品の出品ができる時" do
      it "全ての値が正しい場合は出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品の出品ができる時" do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"Image can't be blank"}
      end
    
      it "商品名が必須であること" do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include "can't be blank"
      end
    
      it "商品の説明が必須であること" do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include "can't be blank"
      end
    
      it "カテゴリーの情報が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include "can't be blank"
      end

      it "category_idが「1」では登録できないこと" do
        @item.category_id = [1]
        @item.valid?
        expect(@item.errors[:category_id]).to include "can't be blank"
      end

      it "商品の状態についての情報が必須であること" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include "can't be blank"
      end

      it "condition_idが「1」では登録できないこと" do
        @item.condition_id = [1]
        @item.valid?
        expect(@item.errors[:condition_id]).to include "can't be blank"
      end
    
      it "配送料の負担についての情報が必須であること" do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include "can't be blank"
      end

      it "shipping_cost_idが「1」では登録できないこと" do
        @item.shipping_cost_id = [1]
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include "can't be blank"
      end
    
      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include "can't be blank"
      end

      it "prefecture_idが「1」では登録できないこと" do
        @item.prefecture_id = [1]
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include "can't be blank"
      end
    
      it "発送までの日数についての情報が必須であること" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors[:shipping_day_id]).to include "can't be blank"
      end

      it "shipping_day_idが「1」では登録できないこと" do
        @item.shipping_day_id = [1]
        @item.valid?
        expect(@item.errors[:shipping_day_id]).to include "can't be blank"
      end

      it "価格についての情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    
      it "価格が、299円以下では登録できないこと" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors[:price]).to include "must be greater than or equal to 300"
      end

      it "価格が、10,000,000円以上では登録できないこと" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors[:price]).to include "must be less than or equal to 9999999"
      end
    
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors[:price]).to include "is not a number"
      end

      it "販売価格は全角文字では保存できないこと" do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors[:price]).to include "is not a number"
      end

      it "販売価格は半角英数混合では保存できないこと" do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors[:price]).to include "is not a number"
      end

      it "販売価格は半角英語では保存できないこと" do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors[:price]).to include "is not a number"
      end
    end
  end
end
