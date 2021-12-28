class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :phone
      t.string :commune
      t.string :street
      t.string :district
      t.string :city

      t.timestamps
    end
  end
end
