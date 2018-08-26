class BeneficiariesController < DashboardController
  before_action :set_beneficiary, only: [:show, :edit, :update]

  # PATCH/PUT /beneficiaries/1
  # PATCH/PUT /beneficiaries/1.json
  def update
    respond_to do |format|
      if @beneficiary.update(beneficiary_params)
        format.html { redirect_to @beneficiary, notice: 'Beneficiary was successfully updated.' }
        format.json { render :show, status: :ok, location: @beneficiary }
      else
        format.html { render :edit }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beneficiary
      @beneficiary = current_user.beneficiary
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beneficiary_params
      params.require(:beneficiary).permit(:name, :relation)
    end
end