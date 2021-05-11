class PasswordResetMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com'

  def password_reset
    user = params[:user]
    mail(to: user.email)
  end
end
