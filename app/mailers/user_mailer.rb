class UserMailer < ApplicationMailer

  def user_mailer(user)
    @user = user
    mail(to: user.email, subject: 'Bienvenida')
  end

end
