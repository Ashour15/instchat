class AddIndicesToChatsAndMessages < ActiveRecord::Migration[5.2]
  def change
    add_index :chats, [:chat_application_id, :number], unique: true
    add_index :messages, [:chat_id, :number], unique: true
    add_index :chats, [:chat_application_id]
    add_index :messages, [:chat_id]
  end
end
