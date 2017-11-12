module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirm!
      sign_in user
    end
  end

  def login_with(user = double("user"), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      anonim_user(scope)
    else
      not_nil_user(current_user, user)
    end
  end

  private

  def anonim_user(scope)
    allow(request.env["warden"])
      .to receive(:authenticate!)
      .and_throw(:warden, scope: scope)
    allow(controller)
      .to receive(current_user)
      .and_return(nil)
  end

  def not_nil_user(current_user, user)
    allow(request.env["warden"])
      .to receive(:authenticate!)
      .and_return(user)
    allow(controller)
      .to receive(current_user)
      .and_return(user)
  end
end
