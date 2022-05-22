class ChatsCountWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform(chat_application_id)
    if (chat_application = ChatApplication.find_by_id(chat_application_id))
      chats_count = chat_application.chats.count
      chat_application.update!(chats_count: chats_count)
      ChatsCountWorker.perform_in(1.hours, chat_application.id)
    end
  end
end