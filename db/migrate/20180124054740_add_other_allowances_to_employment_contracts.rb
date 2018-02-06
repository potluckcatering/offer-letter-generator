class AddOtherAllowancesToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :other_allowances, :string
    add_column :employment_contracts, :bonus_structure, :string
    add_column :employment_contracts, :professional_development_funding, :string
  end
end
