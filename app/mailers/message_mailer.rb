class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body

    mail to: "jordan@groovymedia.com", from: message.email
  end

end
