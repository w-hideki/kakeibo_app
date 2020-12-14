require 'rails_helper'

RSpec.describe Spending, type: :model do
  before do
    @spending = FactoryBot.build(:spending)
  end

  describe '収入の記録' do
    it '収入の記録ができる' do
      expect(@spending).to be_valid
    end

    it "categoryがない場合は登録できないこと" do
      @spending.category = ""
      @spending.valid?
      expect(@spending.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it "year_monthがない場合は登録できないこと" do
      @spending.year_month = ""
      @spending.valid?
      expect(@spending.errors.full_messages).to include("Year monthを入力してください")
    end
    it "valueがない場合は登録できないこと" do
      @spending.value = ""
      @spending.valid?
      expect(@spending.errors.full_messages).to include("価格を入力してください")
    end
  end
end
