class AddTrialShiftDateToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :trial_shift_date, :date
  end
end
