class UserMailer < ActionMailer::Base
  default from: "Kit Stone <no_reply@betastore.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @name = user.email.split("@").first
    @name = @name.titleize

    mail to: "#{@name} <#{user.email}>"
  end
end
