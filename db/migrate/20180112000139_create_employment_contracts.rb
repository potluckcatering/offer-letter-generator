class CreateEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_contracts do |t|
      t.references :department, foreign_key: true
      t.references :position, foreign_key: true
      t.decimal :compensation, precision: 8, scale: 2
      t.integer :compensation_type
      t.integer :supervisor_id
      t.date :start_date
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
