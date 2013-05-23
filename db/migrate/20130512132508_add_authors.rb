class AddAuthors < ActiveRecord::Migration
  def up
    create_table "authors",:force => true do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :authors
  end
end
