class AddPublishedToBooks < ActiveRecord::Migration
  def change
    add_column :books,:published,:boolean,:default=> false
  end
end
