class AddApprovedAtToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :approved_at, :datetime
  end
end
