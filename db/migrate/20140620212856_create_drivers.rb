class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :comment
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 1.megabyte
      t.string :name
      t.decimal :number, precision: 10, scale: 0
      t.text :address
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
