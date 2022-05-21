class Api::V1::ChatApplicationsController < ApplicationController
  before_action :set_chat_application, only: [:show, :update, :destroy]

  #GET /api/v1/chat_applications
  def index 
    chat_applications = ChatApplication.all
    render json: chat_applications, status: :ok
  end
  
  #GET /api/v1/chat_applications/:token
  def show 
    render json: @chat_application, status: :ok
  end

  #POST /api/v1/chat_applications
  def create
    chat_application = ChatApplication.new(chat_application_params)
    if chat_application.save
      render json: chat_application, status: :created
    else
      render json: chat_application.errors, status: :unprocessable_entity
    end
  end

  #PUT /api/v1/chat_applications/:token
  def update
    if @chat_application.update(chat_application_params)
      render json: @chat_application, status: :ok
    else
      render json: @chat_application.errors, status: :unprocessable_entity
    end
  end

  #DELETE /api/v1/chat_applications/:token
  def destroy
    @chat_application.destroy
    head :no_content
  end

  private

  def chat_application_params
    params.require(:chat_application).permit(:name)
  end

  def set_chat_application
    @chat_application = ChatApplication.find_by_token(params[:token])
  end
end