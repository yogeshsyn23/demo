class WelcomeMailer < ApplicationMailer
  def send_welcome_mail
    mail(to: "yogesh.dhanuka@synaptic.com", from: "yogeshdh2000@gmail.com",subject:"testingmail",message:"hii")
  end
end
