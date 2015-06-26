class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
    @contract_groups = Contract.where(:user_id=>current_user.id).group_by(&:contract_type_id)
    render :layout => 'dashboard_layout'
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    render :layout => 'dashboard_layout'
  end

  # GET /contracts/new
  def new
    @contract = current_user.contracts.build
    render :layout => 'dashboard_layout'
  end

  # GET /contracts/1/edit
  def edit
    render :layout => 'dashboard_layout'
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = current_user.contracts.build(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:contract_type_id, :sale_type, :open_order, :bushels, :delivery_location, :futures_month, :futures_price, :basis, :contract_number, :long_short, :contracts, :strike_price, :gain_loss, :delivery_period, :year, :user_id)
    end
end
