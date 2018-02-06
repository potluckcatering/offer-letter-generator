class AddCellphoneAllowanceToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :cellphone_allowance, :integer
  end
end
