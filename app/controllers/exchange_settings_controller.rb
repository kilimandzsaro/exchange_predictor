# A logged in user can setup a new prediction settings
class ExchangeSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :index, :update, :destroy]
  before_action :set_exchange_setting, only: [:edit, :update, :destroy]

  # GET /exchange_settings
  # GET /exchange_settings.json
  def index
    @exchange_settings = ExchangeSetting.where(user_id: current_user.id).order("id DESC")
  end

  # GET /exchange_settings/new
  def new
    @exchange_setting = ExchangeSetting.new
  end

  # GET /exchange_settings/1/edit
  # def edit
  # end

  # POST /exchange_settings
  # POST /exchange_settings.json
  def create
    @exchange_setting = ExchangeSetting.new(exchange_setting_params)
    if @exchange_setting.save
      flash[:success] = "The setting was successfully created."
      redirect_to exchange_settings_url
    else
      flash[:error] = "Please add correct values."
      redirect_to new_exchange_setting_url
    end
  end

  # PATCH/PUT /exchange_settings/1
  # PATCH/PUT /exchange_settings/1.json
  def update
    if @exchange_setting.update(exchange_setting_params)
      flash[:success] = "The setting was successfully updated."
      redirect_to exchange_settings_url
    else
      flash[:error] = "Please add correct values."
      redirect_to edit_exchange_setting_url(current_user.id)
    end
  end

  # DELETE /exchange_settings/1
  # DELETE /exchange_settings/1.json
  def destroy
    @exchange_setting.destroy
    flash[:success] = "The setting was successfully destroyed."
    redirect_to exchange_settings_url
  end

  private

  def set_user
    @user = current_user
  end

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
