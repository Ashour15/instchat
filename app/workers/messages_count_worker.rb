class MessagesCountWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform(chat_id)
    if (chat = Chat.find_by_id(chat_id))
      messages_count = chat.messages.count
      chat.update!(messages_count: messages_count)
      MessagesCountWorker.perform_in(1.hours, chat_id)
    end
  end
end