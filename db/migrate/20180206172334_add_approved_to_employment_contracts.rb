class AddApprovedToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :approved, :boolean, default: false
  end
end
