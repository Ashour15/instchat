class AddForeignKeyToChatsAndMessages < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :chats, :chat_applications
    add_foreign_key :messages, :chats
  end
end
