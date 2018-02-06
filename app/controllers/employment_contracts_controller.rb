class EmploymentContractsController < ApplicationController
  # respond_to :docx
  before_action :set_employment_contract, only: [:show, :edit, :update, :destroy, :offer_settings, :update_offer_letter, :send_notification_email, :approve_request]

  # GET /employment_contracts
  # GET /employment_contracts.json
  def index
    @employment_contracts = EmploymentContract.order("created_at desc")
  end

  # GET /employment_contracts/1
  # GET /employment_contracts/1.json
  def show
  end

  def offer_settings
  end

  def update_offer_letter
      if params[:rails_settings_setting_object]
          params[:rails_settings_setting_object].each do |key, value|
              @employment_contract.settings(:offer_body).update_attributes! key.to_sym => value
          end
        redirect_to employment_contract_path
     end
  end

  def approve_request
    @employment_contract.update(approved: true)
    @user = @employment_contract.supervisor
    UserMailer.approved_email(@user, @employment_contract, employment_contract_url(@employment_contract)).deliver_now
    flash[:notice] = "Successfully approved Setup Request. It is now available for download."
    redirect_to employment_contracts_path
  end

  def send_notification_email
    UserMailer.notification_email(current_user, @employment_contract, employment_contract_url(@employment_contract)).deliver_now
    flash[:notice] = "Request Notification Successfully Emailed To Executive Director"
    redirect_to employment_contracts_path
  end

  # GET /employment_contracts/new
  def new
    @employment_contract = EmploymentContract.new
  end

  # GET /employment_contracts/1/edit
  def edit
    session[:employment_contract_id] = @employment_contract.id
  end

  # POST /employment_contracts
  # POST /employment_contracts.json
  def create
    @employment_contract = EmploymentContract.new(employment_contract_params)

    respond_to do |format|
      if @employment_contract.save
        session[:employment_contract_id] = @employment_contract.id

        format.html { redirect_to request_steps_path, notice: 'Request successfully created.' }
        format.json { render :show, status: :created, location: @employment_contract }
      else
        format.html { render :new }
        format.json { render json: @employment_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employment_contracts/1
  # PATCH/PUT /employment_contracts/1.json
  def update
    respond_to do |format|
      if @employment_contract.update(employment_contract_params)
        format.html { redirect_to request_steps_path, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment_contract }
      else
        format.html { render :edit }
        format.json { render json: @employment_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_contracts/1
  # DELETE /employment_contracts/1.json
  def destroy
    @employment_contract.destroy
    respond_to do |format|
      format.html { redirect_to employment_contracts_url, notice: 'Employment contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_contract
      @employment_contract = EmploymentContract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_contract_params
      params.require(:employment_contract).permit(:department_id, :approved, :position_id, :compensation, :pay_frequency, :compensation_type, :supervisor_id, :start_date, :employee_id)
    end
end
