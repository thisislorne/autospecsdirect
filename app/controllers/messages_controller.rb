class MessagesController < ApplicationController
  skip_before_action :products

  def new
    @message = Message.new
  end

  def create
    message_params = params.require(:message).permit(:name, :email, :body)
    @message = Message.new message_params
    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to new_message_url, notice: "Message received, thanks!"
    else
      render :new
    end
  end
end