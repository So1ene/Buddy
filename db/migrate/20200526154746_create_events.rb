class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :date
      t.time :time
      t.string :address
      t.text :description
      t.string :ticket_url

      t.timestamps
    end
  end
end
