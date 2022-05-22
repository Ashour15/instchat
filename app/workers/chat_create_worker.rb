class ChatCreateWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'medium'

  def perform(chat_application_id, chat_number)
    if (chat_application = ChatApplication.find_by_id(chat_application_id))
      chat = Chat.create(
        chat_application_id: chat_application.id,
        number: chat_number
      )
      MessagesCountWorker.perform_in(1.hours, chat.id)
    end
  end
end