class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string  :name,         null: false
      t.string  :title,        null: false
      t.integer :strength,     null: false
      t.integer :agility,      null: false
      t.integer :intelligence, null: false

      t.timestamps null: false
    end
  end
end
