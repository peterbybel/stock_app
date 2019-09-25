class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_funds = current_user.funds
  end
end
