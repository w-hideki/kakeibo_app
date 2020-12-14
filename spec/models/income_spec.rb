require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = FactoryBot.build(:income)
  end

  describe '収入の記録' do
    it '収入の記録ができる' do
      expect(@income).to be_valid
    end

    it "categoryがない場合は登録できないこと" do
      @income.category = ""
      @income.valid?
      expect(@income.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it "year_monthがない場合は登録できないこと" do
      @income.year_month = ""
      @income.valid?
      expect(@income.errors.full_messages).to include("Year monthを入力してください")
    end
  
    it "valueがない場合は登録できないこと" do
      @income.value = ""
      @income.valid?
      expect(@income.errors.full_messages).to include("価格を入力してください")
    end
  end
end
