require "rails_helper"

RSpec.describe ExchangeSettingsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # ExchangeSetting. As you add validations to ExchangeSetting, be sure to
  # adjust the attributes here as well.
  setup do
    @valid_attributes = create(:exchange_setting)
    @invalid_attributes = create(:not_exchange_setting)
    @valid_session = create(:exchange_setting)
  end

  describe "GET #index" do
    it "returns a success response" do
      exchange_setting = ExchangeSetting.create! @valid_attributes
      get :index, params: { base_currency_id: exchange_setting.base_currency_id,
                            target_currency_id: exchange_setting.target_currency_id,
                            period: exchange_setting.period },
                  session: @valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: @valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      exchange_setting = ExchangeSetting.create! @valid_attributes
      get :edit, params: { id: exchange_setting.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ExchangeSetting" do
        expect(post(:create, params: { exchange_setting: @valid_attributes },
                             session: @valid_session)).to change(ExchangeSetting, :count).by(1)
      end

      it "redirects to the created exchange_setting" do
        post :create, params: { exchange_setting: @valid_attributes }, session: @valid_session
        expect(response).to redirect_to(ExchangeSetting.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { exchange_setting: @invalid_attributes }, session: @valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { skip("Add a hash of attributes valid for your model") }

      it "updates the requested exchange_setting" do
        exchange_setting = ExchangeSetting.create! @valid_attributes
        put :update, params: { id: exchange_setting.to_param, exchange_setting: new_attributes },
                     session: @valid_session
        exchange_setting.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the exchange_setting" do
        exchange_setting = ExchangeSetting.create! @valid_attributes
        put :update, params: { id: exchange_setting.to_param, exchange_setting: valid_attributes },
                     session: @valid_session
        expect(response).to redirect_to(exchange_setting)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        exchange_setting = ExchangeSetting.create! @valid_attributes
        put :update, params: { id: exchange_setting.to_param, exchange_setting: invalid_attributes },
                     session: @valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested exchange_setting" do
      exchange_setting = ExchangeSetting.create! @valid_attributes
      expect(delete(:destroy, params: { id: exchange_setting.to_param },
                              session: @valid_session)).to change(ExchangeSetting, :count).by(-1)
    end

    it "redirects to the exchange_settings list" do
      exchange_setting = ExchangeSetting.create! @valid_attributes
      delete :destroy, params: { id: exchange_setting.to_param }, session: valid_session
      expect(response).to redirect_to(exchange_settings_url)
    end
  end
end
