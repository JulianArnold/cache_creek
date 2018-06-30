class UserMailer < ApplicationMailer
  def account_activation_email(user)
    @user = user
    @url = confirm_user_sign_ups_url(code: @user.account_activation_code)
    mail(to: @user.email, subject: 'Please activate your account')
  end
end
