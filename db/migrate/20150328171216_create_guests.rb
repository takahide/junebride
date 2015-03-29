class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :code
      t.string :name
      t.integer :attendance

      t.timestamps
    end
  end
end
