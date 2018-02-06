class AddIndexToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_index :employment_contracts, :supervisor_id
  end
end
