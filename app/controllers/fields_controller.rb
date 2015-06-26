class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @fields = Field.where(:user_id=>current_user.id)
    render :layout => 'dashboard_layout'
  end

  def show
    render :layout => 'dashboard_layout'
  end

  def new
    @field = current_user.fields.build
    render :layout => 'dashboard_layout'
  end

  def edit
    render :layout => 'dashboard_layout'
  end

  def create
    @field = current_user.fields.build(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to @field, notice: 'Field was successfully created.' }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to @field, notice: 'Field was successfully updated.' }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to fields_url, notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:field).permit(:description, :acres, :share, :rent)
    end
end
