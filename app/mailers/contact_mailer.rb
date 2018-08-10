class ContactMailer < ApplicationMailer

  def contact(subscriber)
    @subscriber = subscriber 
    mail(to: @subscriber.email , subject: 'The awsome newsletter subscription')
  end
end
