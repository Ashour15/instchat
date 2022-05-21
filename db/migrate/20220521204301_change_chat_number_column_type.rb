class ChangeChatNumberColumnType < ActiveRecord::Migration[5.2]
  def up
    change_column :chats, :number, :integer
  end

  def down
    change_column :chats, :number, :string
  end
end
