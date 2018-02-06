class WordDocsController < ApplicationController

  def show
    @employment_contract = EmploymentContract.find(params[:id])
    respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"employment_contract.docx\"" }
    end    
  end

end