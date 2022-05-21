class Api::V1::MessagesController < ApplicationController
  before_action :set_chat_application
  before_action :set_chat
  before_action :set_message , only: [:show]

  def index
    render json: @chat.messages, status: :ok
  end

  def show
    render json: @message, status: :ok
  end

  def create
    message = Message.new(message_params)
    if message.valid?
      set_message_number(message)
      create_message_job(message)
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(chat_id: @chat.id)
  end

  def set_message
    @message = @chat.messages.find_by!(number: params[:number])
  end
  
  def set_chat
    @chat = @chat_application.chats.find_by!(number: params[:chat_number])
  end

  def set_chat_application
    @chat_application = ChatApplication.find_by!(token: params[:chat_application_token])
  end

  def create_message_job(message)
    MessageCreateWorker.perform_async(@chat.id, message.number, message.body)
  end

  def set_message_number(message)
    message.number = $redis.incr("chat#{@chat.id}_message_number")
  end
end