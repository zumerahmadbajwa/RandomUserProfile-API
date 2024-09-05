class UsersController < ApplicationController
  def show
    @user = RandomUserService.fetch_random_user
  end
end
