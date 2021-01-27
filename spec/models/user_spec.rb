require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '新規登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'emailに一意性がないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは、@を含まないと登録できない' do
      @user.email = 'example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードは不正な値です')
    end
    it 'パスワードは、半角英字だけでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'パスワードは、全角では登録できない' do
      @user.password = 'ａａａａａａ'
      @user.password_confirmation = 'ａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
    end
  end
end
