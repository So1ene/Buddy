class AddChatroomToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :chatroom, :string
  end
end
