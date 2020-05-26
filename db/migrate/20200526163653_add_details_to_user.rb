class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :bio, :text
    add_column :users, :living_in, :string
    add_column :users, :search_location, :string
  end
end
