require 'test_helper'

class Web::PasswordResetsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new

    assert_response :success
  end

  test 'should post create' do
    ActionMailer::Base.deliveries.clear
    user = create(:user)
    user_email = { email: user.email }
    post :create, params: { user_email_form: user_email }
    assert_emails 1

    assert_response :redirect
  end

  test 'should get edit' do
    user = create(:user)
    password_reset = create(:password_reset, user: user)
    get :edit, params: { token: password_reset.token }

    assert_response :success
  end

  test 'should patch update' do
    user = create(:user)
    password_reset = create(:password_reset, user: user)
    user_params = { confirmation: user.password, password: user.password }
    patch :update, params: { user: user_params, token: password_reset.token }

    assert_response :redirect
  end

  test 'should token created at' do
    user = create(:user)
    password_reset = create(:password_reset, user: user, token_created_at: 2.month.ago)
    user_params = { confirmation: user.password, password: user.password }
    patch :update, params: { user: user_params, token: password_reset.token }
  end
end
