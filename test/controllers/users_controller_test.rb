require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post new_user_registration_url, params: {
        user: {
          name: @user.name, email: @user.email,
          password: @user.name, password_confirmation: @user.name
        }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in @user
    patch user_url(@user), params: { user: { name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    sign_in @user
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to new_user_url
  end
end
