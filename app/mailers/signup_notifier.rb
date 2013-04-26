class SignupNotifier < ActionMailer::Base
  default :from => "iforms-noreply@ifor.ms"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_notifier.signedup.subject
  #
  def signedup(user)
    @user = user
    mail to: @user.email, :subject => "Welcome to Layout App"
  end
end
