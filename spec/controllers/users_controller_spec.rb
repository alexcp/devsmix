require 'spec_helper'

describe UsersController do
  before :all do
    @user = create(:user)
  end

  describe "GET 'show'" do
    it "should returns http success" do
      get 'show', id: @user.id
      expect(response).to be_success
    end

    it "should find the requested user" do
      get 'show', id: @user.id
      expect(assigns(:user)).to eq(@user)
    end

    it "should redirect to root if no user was found" do
      get 'show', id: @user.id + 1
      expect(response).to redirect_to(root_path)
    end
  end

end
