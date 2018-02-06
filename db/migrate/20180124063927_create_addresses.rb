class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :employee, foreign_key: true
      t.string :street_number
      t.string :street_address
      t.string :province
      t.string :city
      t.string :apt_number
      t.string :postal_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
