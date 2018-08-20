class RentMailer < ApplicationMailer
  def new_rent_notification
    @greeting = "Hi"
    mail to: 'frank.beatle@gmail.com', subject: 'Nueva renta realizada'
  end
end
