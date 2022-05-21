class Api::V1::ChatsController < ApplicationController
  before_action :set_chat, only: [:show]
  before_action :set_chat_application, only: [:create]

  # GET /api/v1/chat_applications/:chat_application_token/chats
  def index
    chats = Chat.all
    render json: chats, status: :ok
  end

  # GET /api/v1/chat_applications/:chat_application_token/chats/:number
  def show
    render json: @chat, status: :ok
  end

  # POST /api/v1/chat_applications/:chat_application_token/chats
  def create
    chat = Chat.new(chat_application_id: @chat_application.id)
    if chat.valid?
      set_chat_number(chat)
      create_chat_job(chat)
      render json: chat, status: :created
    else
      render json: chat.errors, status: :unprocessable_entity
    end
  end

  private

  def set_chat
    @chat = Chat.find_by!(number: params[:number], chat_application_token: params[:chat_application_token])
  end

  def set_chat_number(chat)
    chat.number = $redis.incr("chat_application_#{@chat_application.id}_chat_number")
  end

  def set_chat_application_id(chat)
    chat.chat_application_id = @chat_application.id
  end

  def set_chat_application
    @chat_application = ChatApplication.find_by!(token: params[:chat_application_token])
  end

  def create_chat_job(chat)
    ChatCreateWorker.perform_async(@chat_application.id, chat.number)
  end

end
