class UsersController < ApplicationController
  def show
    user = RandomUserService.fetch_random_user
    if user.is_a?(Hash) && user[:error]
      flash[:alert] = user[:error]
      @user = nil
    else
      @user = user
    end
  end
end
