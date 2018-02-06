class RequestStepsController < ApplicationController
  include Wicked::Wizard
  before_action :set_employment_contract
  steps :first, :second, :third, :fourth

  def show
    render_wizard
  end

  def update
    @employment_contract.update_attributes(employment_contract_params)
    flash[:notice] = 'Request successfully updated.'
    render_wizard @employment_contract
  end


  def finish_wizard_path
    flash[:notice] = 'Request was successfully updated.'
    employment_contract_path(@employment_contract)
  end 

  private 

    def set_employment_contract
      @employment_contract = EmploymentContract.find(session[:employment_contract_id])
    end

    def employment_contract_params
      params.require(:employment_contract).permit(
        :department_id, 
        :position_id, 
        :compensation, 
        :pay_frequency, 
        :compensation_type, 
        :supervisor_id, 
        :start_date, 
        :employee_id,
        :vacation_time,
        :vacation_time_other,
        :cellphone_allowance,
        :other_allowances,
        :bonus_structure,
        :professional_development_funding,
        :trial_shift_date)
    end

end