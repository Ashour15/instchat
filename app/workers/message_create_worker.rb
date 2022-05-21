class MessageCreateWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'medium'

  def perform(chat_id, message_number, body)
    if (chat = Chat.find_by_id(chat_id))
      Message.create!(
        number: message_number,
        chat_id: chat_id,
        body: body
        )
    end
  end
end