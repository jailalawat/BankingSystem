class AddressesController < BaseController
  before_action :set_address, only: [:edit, :update]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = current_user.addresses
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to addresses_path, notice: 'Address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = current_user.addresses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.fetch(:address, {})
      params.require(:address).permit(:house_number, :floor_no, :building_name, :street_no, :landmark, :area, :state, :city, :pin_code, :permanent)
    end
end
