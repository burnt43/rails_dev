class AddColorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :color, :string
  end
end
