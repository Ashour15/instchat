class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :number
      t.bigint :chat_application_id
      t.integer :messages_count, default: 0
      
      t.timestamps
    end
  end
end
