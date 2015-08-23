class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :introduction
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :notes, :id
    add_index :notes, :user_id
  end
end
