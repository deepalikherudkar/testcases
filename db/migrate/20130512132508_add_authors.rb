class AddAuthors < ActiveRecord::Migration
  def up
    create_table "authors",:force => true do |author|
      author.string :name
    end
  end

  def down
    drop_table :authors
  end
end
