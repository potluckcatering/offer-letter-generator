class AddVacationTimeToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :vacation_time, :integer
    add_column :employment_contracts, :vacation_time_other, :string
  end
end
