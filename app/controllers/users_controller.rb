class UsersController < ApplicationController
  before_action :get_user

  def show
  end

  private

  def get_user
    begin
      @user = User.find_by_nickname!(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end
end
