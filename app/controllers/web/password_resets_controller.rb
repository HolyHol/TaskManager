class Web::PasswordResetsController < Web::ApplicationController
  def new
    @user_email = UserEmailForm.new
  end

  def create
    @user = User.find_by(email: params[:user_email_form][:email])

    @token_created_at = Time.current

    if @user.password_reset
      @user.password_reset.regenerate_token.update(token_created_at: @token_created_at)
    else
      @password_reset = @user.create_password_reset(token: @token, token_created_at: @token_created_at)
    end

    PasswordResetMailer.with(user: @user).password_reset.deliver_now
    redirect_to(new_session_url)
  end

  def edit
    @password_reset = PasswordReset.find_by(token: params[:token])
  end

  def update
    @password_reset = PasswordReset.find_by(token: params[:token])

    @user = @password_reset.user

    @time_difference = Time.current.to_i - @password_reset.token_created_at.to_i

    if @user.update(password_params) && @time_difference < 86400
      redirect_to(new_session_url)
    else
      render(:edit)
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
