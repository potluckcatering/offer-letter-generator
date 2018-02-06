class AddPayFrequencyToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :pay_frequency, :integer
  end
end
