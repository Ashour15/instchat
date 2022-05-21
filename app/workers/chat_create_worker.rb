class ChatCreateWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'medium'

  def perform(chat_application_id, chat_number)
    if (chat_application = ChatApplication.find_by_id(chat_application_id))
      chat_application.chats << Chat.new(number: chat_number)
    end
  end
end