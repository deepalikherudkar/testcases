class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_type
      t.string :phone_number
      t.integer :author_id
      t.timestamps
    end
  end
end
