class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def last_email
    ActionMailer::Base.deliveries.last
  end
end
