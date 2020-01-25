require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "hoge user", email: "hoge@example.com",
											password: "password", password_confirmation: "password")
	end

	test "有効かどうか" do
		assert @user.valid?
	end

	test "名前が空白じゃない" do
		@user.name = " "
		assert_not @user.valid?
	end

	test "アドレスが空白じゃない" do
		@user.email = " "
		assert_not @user.valid?
	end

	test "名前が20文字以上じゃない" do
		@user.name = "a" * 21
		assert_not @user.valid?
	end

	test "アドレスがが30文字以上じゃない" do
		@user.name = "a" * 31 + "@example.com"
		assert_not @user.valid?
	end

	test "メールアドレスが重複しない" do
		dup_user = @user.dup
		@user.save
		dup_user.email = @user.email.upcase
		@user.save
		assert_not dup_user.valid?
	end

  test "メールアドレスを小文字で保存" do
    mixedcase_email = "HoGe@ExaMple.CoM"
    @user.email = mixedcase_email
    @user.save
    assert_equal mixedcase_email.downcase, @user.reload.email
  end

  test "パスワードが空白じゃない" do
  	@user.password = @user.password_confirmation = " " * 6
  end

  test "パスワードが５文字以上" do
  	@user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
