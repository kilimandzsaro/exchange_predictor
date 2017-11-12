# A logged in user can setup a new prediction settings
class ExchangeSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exchange_setting, only: [:edit, :update, :destroy]

  # GET /exchange_settings
  # GET /exchange_settings.json
  def index
    @exchange_settings = ExchangeSetting.where(user_id: current_user.id)
  end

  # GET /exchange_settings/new
  def new
    @exchange_setting = ExchangeSetting.new
  end

  # GET /exchange_settings/1/edit
  def edit
  end

  # POST /exchange_settings
  # POST /exchange_settings.json
  def create
    @exchange_setting = ExchangeSetting.new(exchange_setting_params)

    respond_to do |format|
      if @exchange_setting.save
        format.html { redirect_to @exchange_setting, notice: "The setting was successfully created." }
        format.json { render :index, status: :created, location: @exchange_setting }
      else
        format.html { render :new }
        format.json { render json: @exchange_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchange_settings/1
  # PATCH/PUT /exchange_settings/1.json
  def update
    respond_to do |format|
      if @exchange_setting.update(exchange_setting_params)
        format.html { redirect_to @exchange_setting, notice: "The setting was successfully updated." }
        format.json { render :index, status: :ok, location: @exchange_setting }
      else
        format.html { render :edit }
        format.json { render json: @exchange_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchange_settings/1
  # DELETE /exchange_settings/1.json
  def destroy
    @exchange_setting.destroy
    respond_to do |format|
      format.html { redirect_to exchange_settings_url, notice: "The setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exchange_setting
    @exchange_setting = ExchangeSetting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def exchange_setting_params
    params.require(:exchange_setting)
          .permit(:user_id, :base_currency_id, :target_currency_id, :amount, :period)
  end
end
