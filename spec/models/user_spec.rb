require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nicknameとemailpassword、password_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに＠が含まれていないと登録できない" do
      @user.email = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上で登録できること" do
      @user.password = "00000a"
      @user.password_confirmation = "00000a"
      expect(@user).to be_valid
    end
    it "passwordが6文字以上でないと登録できない" do
      @user.password = "0000a"
      @user.password_confirmation = "0000a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "000001a"
      @user.password_confirmation = "000000a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが英数字混合でないと登録できない" do
      user = User.new(password: 'A' * 5)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが数字のみの場合は登録できない" do
      user = User.new(password: 'A' + 'a' * 5)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが英字のみの場合は登録できない" do
      user = User.new(password: '1' * 5)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "ユーザー本名は苗字が空だと登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名は名前が空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名(苗字)は全角でないと登録できない" do
      @user.family_name = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "ユーザー本名(名前)は全角でないと登録できない" do
      @user.first_name = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザー本名の苗字のフリガナが空だと登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "ユーザー本名の名前のフリガナが空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザー本名の苗字のフリガナが全角でないと登録できない" do
      @user.family_name_kana = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "ユーザー本名の名前のフリガナが全角でないと登録できない" do
      @user.first_name_kana = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "ユーザー本名の苗字のフリガナは漢字ではで登録できない" do
      @user.family_name_kana = "阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "ユーザー本名の名前のフリガナは漢字ではで登録できない" do
      @user.first_name_kana = "阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "ユーザー本名の苗字のフリガナはひらがなではで登録できない" do
      @user.family_name_kana = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "ユーザー本名の名前のフリガナはひらがなではで登録できない" do
      @user.first_name_kana = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
