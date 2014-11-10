class DeveloperNotifier < ActionMailer::Base
  default from: "speakupproductions@gmail.com"

  def send_email(developer)
    @developer = developer
    mail(:to => "speakupproductions@gmail.com",:subject=>'new developer signup')
  end
end
