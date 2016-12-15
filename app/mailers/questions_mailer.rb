class QuestionMailer < ActionMailer::Base
  default from: "tony@softwarecriollo.com"

  def send(question, subject)
    @question = question
    @greeting = "Hi"

    mail to: @question.user.email, subject: subject
  end

end
