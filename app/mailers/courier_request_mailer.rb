class CourierRequestMailer < ApplicationMailer
  def sender_email(courier_request)
    @courier_request = courier_request

    mail(to: @courier_request.sender_email, subject: 'Courier Request tracking info')
  end

  def receiver_email(courier_request)
    @courier_request = courier_request
    mail(to: @courier_request.receiver_email, subject: 'Courier Request tracking info')
  end
end
