class AddUseOfCompanyVehicleToEmploymentContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :employment_contracts, :use_of_company_vehicle, :boolean, defeault: false
  end
end
